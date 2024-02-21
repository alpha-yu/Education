package com.education.edu.service.impl;

import com.education.edu.domain.Wish;
import com.education.edu.mapper.WishMapper;
import com.education.edu.service.IWishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishServiceImpl implements IWishService{


    @Autowired
    private WishMapper wishMapper;

    /**
     * 查询心愿列表
     *
     * @return 心愿列表
     */
    @Override
    public List<Wish> selectWishList(Wish wish)
    {
        return wishMapper.selectWishList(wish);
    }

    /**
     * 通过心愿ID查询心愿信息
     *
     * @param wishId 心愿ID
     * @return 心愿对象信息
     */
    @Override
    public Wish selectWishById(Long wishId)
    {
        return wishMapper.selectWishById(wishId);
    }

    /**
     * 修改心愿信息
     *
     * @param wish 心愿信息
     * @return 结果
     */
    @Override
    public int updateWish(Wish wish)
    {
        return wishMapper.updateWish(wish);
    }

    /**
     * 新增心愿信息
     *
     * @param wish 心愿信息
     * @return 结果
     */
    @Override
    public int insertWish(Wish wish)
    {
        return wishMapper.insertWish(wish);
    }

    /**
     * 批量删除心愿信息
     *
     * @param wishIds 需要删除的心愿ID
     * @return 结果
     */
    @Override
    public int deleteWishByIds(Long[] wishIds)
    {
        return wishMapper.deleteWishByIds(wishIds);
    }
}
