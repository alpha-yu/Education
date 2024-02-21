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
import com.education.edu.domain.Resource;
import com.education.edu.domain.Resource;
import com.education.edu.service.IResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/edu/resource")
public class ResourceController extends BaseController {

    @Autowired
    private IResourceService resourceService;

    /**
     * 获取资源列表
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:list')")
    @GetMapping("/list")
    public TableDataInfo list(Resource resource) {
        startPage();
        List<Resource> resources = resourceService.selectResourceList(resource);
        return getDataTable(resources);
    }

    /**
     * 根据资源编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:query')")
    @GetMapping(value = "/{resourceId}")
    public AjaxResult getInfo(@PathVariable Long resourceId) {
        return success(resourceService.selectResourceById(resourceId));
    }
    
    /**
     * 新增资源信息
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:add')")
    @Log(title = "资源概况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Resource r) {
        r.setCreateBy(getUsername());
        return toAjax(resourceService.insertResource(r));
    }

    /**
     * 修改资源信息
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:edit')")
    @Log(title = "资源信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Resource r) {
        r.setUpdateBy(getUsername());
        return toAjax(resourceService.updateResource(r));
    }

    /**
     * 删除资源信息
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:remove')")
    @Log(title = "资源信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{resourceIds}")
    public AjaxResult remove(@PathVariable Long[] resourceIds) {
        return toAjax(resourceService.deleteResourceByIds(resourceIds));
    }

    /**
     * 导出资源信息
     */
    @Log(title = "资源信息", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:resource:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Resource r) {
        List<Resource> list = resourceService.selectResourceList(r);
        ExcelUtil<Resource> util = new ExcelUtil<Resource>(Resource.class);
        util.exportExcel(response, list, "资源信息");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:resource:edit')")
    @Log(title = "资源信息", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, Resource r) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            r.setResourceImg(r.getApi() + avatar);
        }
        if (r.getResourceId() == null) {
            r.setCreateBy(getUsername());
            return toAjax(resourceService.insertResource(r));
        }
        if (r.getResourceId() != null) {
            r.setUpdateBy(getUsername());
            return toAjax(resourceService.updateResource(r));
        }
        return AjaxResult.error();
    }
}
