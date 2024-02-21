package com.education.edu.service.impl;

import com.education.edu.domain.Post;
import com.education.edu.mapper.PostMapper;
import com.education.edu.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements IPostService{

    @Autowired
    private PostMapper postMapper;

    /**
     * 根据条件分页查询志愿岗位列表
     *
     * @param post 志愿岗位信息
     * @return 志愿岗位信息集合
     */
    @Override
    public List<Post> selectPostList(Post post)
    {
        return postMapper.selectPostList(post);
    }

    /**
     * 通过岗位ID查询岗位信息
     * @param postId 学校ID
     * @return 学校对象信息
     */

    @Override
    public Post selectPostById(Long postId)
    {
        return postMapper.selectPostById(postId);
    }

    /**
     * 修改志愿岗位信息
     *
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public int updatePost(Post post)
    {
        return postMapper.updatePost(post);
    }

    /**
     * 新增志愿岗位信息
     *
     * @param post 岗位信息
     * @return 结果
     */
    public int insertPost(Post post)
    {
        return postMapper.insertPost(post);
    }

    /**
     * 批量删除志愿岗位信息
     *
     * @param postIds 需要删除的志愿岗位ID
     * @return 结果
     */
    public int deletePostByIds(Long[] postIds)
    {
        return postMapper.deletePostByIds(postIds);
    }

}
