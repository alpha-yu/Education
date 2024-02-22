package com.education.web.controller.edu;

import com.education.common.annotation.Log;
import com.education.common.config.RuoYiConfig;
import com.education.common.core.controller.BaseController;
import com.education.common.core.domain.AjaxResult;
import com.education.common.core.page.TableDataInfo;
import com.education.common.enums.BusinessType;
import com.education.common.utils.file.FileUploadUtils;
import com.education.common.utils.file.MimeTypeUtils;
import com.education.common.utils.poi.ExcelUtil;
import com.education.edu.domain.Advertisement;
import com.education.edu.service.IAdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/edu/advertisement")
public class AdvertisementController extends BaseController {

    @Autowired
    private IAdvertisementService advertisementService;

    /**
     * 获取广告列表
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:list')")
    @GetMapping("/list")
    public TableDataInfo list(Advertisement advertisement) {
        startPage();
        List<Advertisement> advertisements = advertisementService.selectAdvertisementList(advertisement);
        return getDataTable(advertisements);
    }

    /**
     * 根据广告编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:query')")
    @GetMapping(value = "/{advertisementId}")
    public AjaxResult getInfo(@PathVariable Long advertisementId) {
        return success(advertisementService.selectAdvertisementById(advertisementId));
    }

    /**
     * 新增广告信息
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:add')")
    @Log(title = "广告管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Advertisement advertisement) {
        advertisement.setCreateBy(getUsername());
        return toAjax(advertisementService.insertAdvertisement(advertisement));
    }

    /**
     * 修改广告信息
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:edit')")
    @Log(title = "广告管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Advertisement advertisement) {
        advertisement.setUpdateBy(getUsername());
        return toAjax(advertisementService.updateAdvertisement(advertisement));
    }

    /**
     * 删除广告信息
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:remove')")
    @Log(title = "广告管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{advertisementIds}")
    public AjaxResult remove(@PathVariable Long[] advertisementIds) {
        return toAjax(advertisementService.deleteAdvertisementByIds(advertisementIds));
    }

    /**
     * 导出广告信息
     */
    @Log(title = "广告管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:advertisement:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Advertisement advertisement) {
        List<Advertisement> list = advertisementService.selectAdvertisementList(advertisement);
        ExcelUtil<Advertisement> util = new ExcelUtil<>(Advertisement.class);
        util.exportExcel(response, list, "广告数据");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:advertisement:edit')")
    @Log(title = "广告管理", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, Advertisement advertisement) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            advertisement.setAdImg(advertisement.getApi() + avatar);
        }
        if (advertisement.getAdId() == null) {
            advertisement.setCreateBy(getUsername());
            return toAjax(advertisementService.insertAdvertisement(advertisement));
        }
        if (advertisement.getAdId() != null) {
            advertisement.setUpdateBy(getUsername());
            return toAjax(advertisementService.updateAdvertisement(advertisement));
        }
        return AjaxResult.error();
    }
}
