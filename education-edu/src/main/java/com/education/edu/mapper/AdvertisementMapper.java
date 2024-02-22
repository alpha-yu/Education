package com.education.edu.mapper;

import com.education.edu.domain.Advertisement;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AdvertisementMapper {

    /**
     * 根据条件分页查询广告列表
     *
     * @param advertisement 广告信息
     * @return 广告信息集合信息
     */
    List<Advertisement> selectAdvertisementList(Advertisement advertisement);

    /**
     * 通过广告ID查询广告信息
     *
     * @param advertisementId 广告ID
     * @return 广告对象信息
     */
    Advertisement selectAdvertisementById(Long advertisementId);

    /**
     * 修改广告信息
     *
     * @param advertisement 广告信息
     * @return 结果
     */
    int updateAdvertisement(Advertisement advertisement);

    /**
     * 新增广告信息
     *
     * @param advertisement 广告信息
     * @return 结果
     */
    int insertAdvertisement(Advertisement advertisement);

    /**
     * 批量删除广告信息
     *
     * @param advertisementIds 需要删除的广告ID
     * @return 结果
     */
    int deleteAdvertisementByIds(Long[] advertisementIds);
}
