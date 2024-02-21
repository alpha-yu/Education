package com.education.edu.service;

import com.education.edu.domain.Resource;

import java.util.List;

public interface IResourceService {

    /**
     * 查询资源列表
     *
     * @return 资源列表
     */
    public List<Resource> selectResourceList(Resource r);

    /**
     * 通过资源ID查询资源信息
     *
     * @param resourceId 资源ID
     * @return 资源对象信息
     */
    public Resource selectResourceById(Long resourceId);

    /**
     * 新增资源信息
     *
     * @param r 资源信息
     * @return 结果
     */
    public int insertResource(Resource r);

    /**
     * 修改资源信息
     *
     * @param r 资源信息
     * @return 结果
     */
    public int updateResource(Resource r);


    /**
     * 批量删除资源信息
     *
     * @param resourceIds 需要删除的资源ID
     * @return 结果
     */
    public int deleteResourceByIds(Long[] resourceIds);

}
