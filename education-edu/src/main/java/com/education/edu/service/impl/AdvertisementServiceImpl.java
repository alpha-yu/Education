package com.education.edu.service.impl;

import com.education.edu.domain.Advertisement;
import com.education.edu.mapper.AdvertisementMapper;
import com.education.edu.service.IAdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvertisementServiceImpl implements IAdvertisementService {

    @Autowired
    private AdvertisementMapper advertisementMapper;

    /**
     * 查询广告列表
     *
     * @param advertisement 广告信息
     * @return 广告列表
     */
    @Override
    public List<Advertisement> selectAdvertisementList(Advertisement advertisement) {
        return advertisementMapper.selectAdvertisementList(advertisement);
    }

    /**
     * 通过广告ID查询广告信息
     *
     * @param advertisementId 广告ID
     * @return 广告对象信息
     */
    @Override
    public Advertisement selectAdvertisementById(Long advertisementId) {
        return advertisementMapper.selectAdvertisementById(advertisementId);
    }

    /**
     * 新增保存广告信息
     *
     * @param advertisement 广告信息
     * @return 结果
     */
    @Override
    public int insertAdvertisement(Advertisement advertisement) {
        return advertisementMapper.insertAdvertisement(advertisement);
    }

    /**
     * 修改保存广告信息
     *
     * @param advertisement 广告信息
     * @return 结果
     */
    @Override
    public int updateAdvertisement(Advertisement advertisement) {
        return advertisementMapper.updateAdvertisement(advertisement);
    }

    /**
     * 批量删除广告信息
     *
     * @param advertisementIds 需要删除的广告ID
     * @return 结果
     */
    @Override
    public int deleteAdvertisementByIds(Long[] advertisementIds) {
        return advertisementMapper.deleteAdvertisementByIds(advertisementIds);
    }
}
