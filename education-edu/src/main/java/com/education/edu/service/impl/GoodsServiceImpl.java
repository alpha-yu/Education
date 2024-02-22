package com.education.edu.service.impl;

import com.education.edu.domain.Goods;
import com.education.edu.mapper.GoodsMapper;
import com.education.edu.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements IGoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * 查询商品列表
     *
     * @return 商品列表
     */
    @Override
    public List<Goods> selectGoodsList(Goods goods) {
        return goodsMapper.selectGoodsList(goods);
    }

    /**
     * 通过商品ID查询商品信息
     *
     * @param goodsId 商品ID
     * @return 商品对象信息
     */
    @Override
    public Goods selectGoodsById(Long goodsId) {
        return goodsMapper.selectGoodsById(goodsId);
    }

    /**
     * 新增保存商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    @Override
    public int insertGoods(Goods goods) {
        return goodsMapper.insertGoods(goods);
    }

    /**
     * 修改保存商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    @Override
    public int updateGoods(Goods goods) {
        return goodsMapper.updateGoods(goods);
    }

    /**
     * 批量删除商品信息
     *
     * @param goodsIds 需要删除的商品ID
     * @return 结果
     */
    @Override
    public int deleteGoodsByIds(Long[] goodsIds) {
        return goodsMapper.deleteGoodsByIds(goodsIds);
    }
}
