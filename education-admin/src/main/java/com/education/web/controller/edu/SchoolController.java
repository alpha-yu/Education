package com.education.web.controller.edu;

import com.education.common.annotation.Log;
import com.education.common.config.RuoYiConfig;
import com.education.common.constant.Constants;
import com.education.common.core.controller.BaseController;
import com.education.common.core.domain.AjaxResult;
import com.education.common.core.page.TableDataInfo;
import com.education.common.enums.BusinessType;
import com.education.common.utils.file.FileUploadUtils;
import com.education.common.utils.file.MimeTypeUtils;
import com.education.common.utils.poi.ExcelUtil;
import com.education.edu.domain.School;
import com.education.edu.service.ISchoolService;
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
@RequestMapping("/edu/school")
public class SchoolController extends BaseController {

    @Autowired
    private ISchoolService schoolService;

    /**
     * 获取学校列表
     */
    @PreAuthorize("@ss.hasPermi('edu:school:list')")
    @GetMapping("/list")
    public TableDataInfo list(School school) {
        startPage();
        List<School> schools = schoolService.selectSchoolList(school);
        return getDataTable(schools);
    }

    /**
     * 根据学校编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:school:query')")
    @GetMapping(value = "/{schoolId}")
    public AjaxResult getInfo(@PathVariable Long schoolId) {
        return success(schoolService.selectSchoolById(schoolId));
    }

    /**
     * 新增学校信息
     */
    @PreAuthorize("@ss.hasPermi('edu:school:add')")
    @Log(title = "学校概况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody School s) {
        s.setCreateBy(getUsername());
        return toAjax(schoolService.insertSchool(s));
    }

    /**
     * 修改学校信息
     */
    @PreAuthorize("@ss.hasPermi('edu:school:edit')")
    @Log(title = "学校概况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody School s) {
        s.setUpdateBy(getUsername());
        return toAjax(schoolService.updateSchool(s));
    }

    /**
     * 删除学校信息
     */
    @PreAuthorize("@ss.hasPermi('edu:school:remove')")
    @Log(title = "学校概况", businessType = BusinessType.DELETE)
    @DeleteMapping("/{schoolIds}")
    public AjaxResult remove(@PathVariable Long[] schoolIds) {
        return toAjax(schoolService.deleteSchoolByIds(schoolIds));
    }

    /**
     * 导出学校信息
     */
    @Log(title = "学校概况", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:school:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, School s) {
        List<School> list = schoolService.selectSchoolList(s);
        ExcelUtil<School> util = new ExcelUtil<School>(School.class);
        util.exportExcel(response, list, "学校信息");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:school:edit')")
    @Log(title = "学校概况", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, School s) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            s.setSchoolImg(s.getApi() + avatar);
        }
        if (s.getSchoolId() == null) {
            s.setCreateBy(getUsername());
            return toAjax(schoolService.insertSchool(s));
        }
        if (s.getSchoolId() != null) {
            s.setUpdateBy(getUsername());
            return toAjax(schoolService.updateSchool(s));
        }
        return AjaxResult.error();
    }
}
