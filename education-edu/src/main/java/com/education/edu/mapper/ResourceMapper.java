package com.education.edu.mapper;

import com.education.edu.domain.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ResourceMapper {

    /**
     * 根据条件分页查询资源列表
     *
     * @param resource 资源信息
     * @return 资源信息集合信息
     */
    public List<Resource> selectResourceList(Resource resource);

    /**
     * 通过资源ID查询资源信息
     *
     * @param resourceId 资源ID
     * @return 资源对象信息
     */
    public Resource selectResourceById(Long resourceId);


    /**
     * 修改资源信息
     *
     * @param s 资源信息
     * @return 结果
     */
    public int updateResource(Resource s);

    /**
     * 新增资源信息
     *
     * @param s 资源信息
     * @return 结果
     */
    public int insertResource(Resource s);

    /**
     * 批量删除资源信息
     *
     * @param resourceIds 需要删除的资源ID
     * @return 结果
     */
    public int deleteResourceByIds(Long[] resourceIds);
}
