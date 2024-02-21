package com.education.edu.service.impl;

import com.education.edu.domain.Resource;
import com.education.edu.mapper.ResourceMapper;
import com.education.edu.service.IResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl implements IResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 查询资源列表
     *
     * @return 资源列表
     */
    @Override
    public List<Resource> selectResourceList(Resource r) {
        return resourceMapper.selectResourceList(r);
    }

    /**
     * 通过资源ID查询资源信息
     *
     * @param resourceId 资源ID
     * @return 资源对象信息
     */
    @Override
    public Resource selectResourceById(Long resourceId) {
        return resourceMapper.selectResourceById(resourceId);
    }

    /**
     * 新增保存资源信息
     *
     * @param r 资源信息
     * @return 结果
     */
    @Override
    public int insertResource(Resource r)
    {
        return resourceMapper.insertResource(r);
    }

    /**
     * 修改保存资源信息
     *
     * @param r 资源信息
     * @return 结果
     */
    @Override
    public int updateResource(Resource r)
    {
        return resourceMapper.updateResource(r);
    }

    /**
     * 批量删除资源信息
     *
     * @param resourceIds 需要删除的资源ID
     * @return 结果
     */
    @Override
    public int deleteResourceByIds(Long[] resourceIds)
    {
        return resourceMapper.deleteResourceByIds(resourceIds);
    }
}
