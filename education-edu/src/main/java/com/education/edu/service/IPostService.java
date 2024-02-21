package com.education.edu.service;

import com.education.edu.domain.Post;

import java.util.List;

public interface IPostService {
    /**
     * 根据条件分页查询志愿岗位列表
     *
     * @param post 志愿岗位信息
     * @return 志愿岗位信息集合
     */
    public List<Post> selectPostList(Post post);

    /**
     * 通过岗位ID查询岗位信息
     * @param postId 学校ID
     * @return 学校对象信息
     */
    public Post selectPostById(Long postId);

    /**
     * 修改志愿岗位信息
     *
     * @param post 岗位信息
     * @return 结果
     */
    public int updatePost(Post post);

    /**
     * 新增志愿岗位信息
     *
     * @param post 岗位信息
     * @return 结果
     */
    public int insertPost(Post post);

    /**
     * 批量删除志愿岗位信息
     *
     * @param postIds 需要删除的志愿岗位ID
     * @return 结果
     */
    public int deletePostByIds(Long[] postIds);
}
