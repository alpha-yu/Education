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
import com.education.edu.domain.Post;
import com.education.edu.domain.Resource;
import com.education.edu.domain.School;
import com.education.edu.service.IPostService;
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
@RequestMapping("/edu/post")
public class PostController  extends BaseController{

    @Autowired private IPostService postService;

    /**
     * 获取岗位列表
     */
    @PreAuthorize("@ss.hasPermi('edu:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(Post post) {
        startPage();
        List<Post> posts = postService.selectPostList(post);
        return getDataTable(posts);
    }

    /**
     * 根据岗位编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:post:query')")
    @GetMapping(value = "/{postId}")
    public AjaxResult getInfo(@PathVariable Long postId) {
        return success(postService.selectPostById(postId));
    }

    /**
     * 新增岗位信息
     */
    @PreAuthorize("@ss.hasPermi('edu:post:add')")
    @Log(title = "岗位概况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Post post) {
        post.setCreateBy(getUsername());
        return toAjax(postService.insertPost(post));
    }

    /**
     * 修改岗位信息
     */
    @PreAuthorize("@ss.hasPermi('edu:post:edit')")
    @Log(title = "岗位概况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Post post) {
        post.setUpdateBy(getUsername());
        return toAjax(postService.updatePost(post));
    }

    /**
     * 删除岗位信息
     */
    @PreAuthorize("@ss.hasPermi('edu:post:remove')")
    @Log(title = "岗位概况", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postIds}")
    public AjaxResult remove(@PathVariable Long[] postIds) {
        return toAjax(postService.deletePostByIds(postIds));
    }

    /**
     * 导出志愿岗位信息
     */
    @Log(title = "志愿岗位概况", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('edu:post:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Post post) {
        List<Post> list = postService.selectPostList(post);
        ExcelUtil<Post> util = new ExcelUtil<Post>(Post.class);
        util.exportExcel(response, list, "志愿岗位数据");
    }

    /**
     * 处理带有文件的表单
     */
    @PreAuthorize("@ss.hasPermi('edu:post:edit')")
    @Log(title = "资源信息", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file, Post post) throws Exception {
//        if (!file.isEmpty()) {
//            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
//            post.setResourceImg(post.getApi() + avatar);
//        }
        if (post.getPostId() == null) {
            post.setCreateBy(getUsername());
            return toAjax(postService.insertPost(post));
        }
        if (post.getPostId() != null) {
            post.setUpdateBy(getUsername());
            return toAjax(postService.updatePost(post));
        }
        return AjaxResult.error();
    }
}
