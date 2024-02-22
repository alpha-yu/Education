package com.education.web.controller.edu;

import com.education.common.annotation.Log;
import com.education.common.config.RuoYiConfig;
import com.education.common.constant.Constants;
import com.education.common.core.controller.BaseController;
import com.education.common.core.domain.AjaxResult;
import com.education.common.core.page.TableDataInfo;
import com.education.common.enums.BusinessType;
import com.education.common.utils.StringUtils;
import com.education.common.utils.file.FileUploadUtils;
import com.education.common.utils.file.MimeTypeUtils;
import com.education.common.utils.poi.ExcelUtil;
import com.education.edu.domain.School;
import com.education.edu.domain.Wish;
import com.education.edu.mapper.SchoolMapper;
import com.education.edu.service.ISchoolService;
import com.education.edu.service.IWishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

@RestController
@RequestMapping("/edu/wish")
public class WishController extends BaseController{

    @Autowired
    private IWishService wishService;

    @Autowired
    private ISchoolService schoolService;

    /**
     * 获取心愿列表
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:list')")
    @GetMapping("/list")
    public TableDataInfo list(Wish wish) {
        startPage();
        List<Wish> wishes = wishService.selectWishList(wish);
        return getDataTable(wishes);
    }

    /**
     * 根据心愿编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:query')")
    @GetMapping(value = {"/", "/{wishId}"})
    public AjaxResult getInfo(@PathVariable(value = "wishId", required = false) Long wishId) {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("schools",schoolService.selectSchoolAll());
        if(StringUtils.isNotNull(wishId)){
            Wish wish = wishService.selectWishById(wishId);
            ajax.put(AjaxResult.DATA_TAG, wish);
        }
        return ajax;
    }

    /**
     * 新增心愿信息
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:add')")
    @Log(title = "心愿详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Wish wish) {
        wish.setCreateBy(getUsername());
        return toAjax(wishService.insertWish(wish));
    }

    /**
     * 修改心愿信息
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:edit')")
    @Log(title = "学校概况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Wish wish) {
        wish.setUpdateBy(getUsername());
        return toAjax(wishService.updateWish(wish));
    }

    /**
     * 删除心愿信息
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:remove')")
    @Log(title = "心愿详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{wishIds}")
    public AjaxResult remove(@PathVariable Long[] wishIds) {
        return toAjax(wishService.deleteWishByIds(wishIds));
    }

    /**
     * 导出心愿信息
     */
    @Log(title = "心愿详情", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:wish:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Wish wish) {
        List<Wish> list = wishService.selectWishList(wish);
        ExcelUtil<Wish> util = new ExcelUtil<Wish>(Wish.class);
        util.exportExcel(response, list, "心愿数据");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:wish:edit')")
    @Log(title = "心愿详情", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, Wish wish) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            wish.setWishImg(wish.getApi() + avatar);
        }
        if (wish.getWishId() == null) {
            wish.setCreateBy(getUsername());
            return toAjax(wishService.insertWish(wish));
        }
        if (wish.getWishId() != null) {
            wish.setUpdateBy(getUsername());
            return toAjax(wishService.updateWish(wish));
        }
        return AjaxResult.error();
    }

}
