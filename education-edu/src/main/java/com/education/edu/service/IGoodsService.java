package com.education.edu.service;

import com.education.edu.domain.Goods;

import java.util.List;

public interface IGoodsService {

    /**
     * 查询商品列表
     *
     * @return 商品列表
     */
    List<Goods> selectGoodsList(Goods p);

    /**
     * 通过商品ID查询商品信息
     *
     * @param goodsId 商品ID
     * @return 商品对象信息
     */
    Goods selectGoodsById(Long goodsId);

    /**
     * 新增商品信息
     *
     * @param p 商品信息
     * @return 结果
     */
    int insertGoods(Goods p);

    /**
     * 修改商品信息
     *
     * @param p 商品信息
     * @return 结果
     */
    int updateGoods(Goods p);

    /**
     * 批量删除商品信息
     *
     * @param goodsIds 需要删除的商品ID
     * @return 结果
     */
    int deleteGoodsByIds(Long[] goodsIds);
}
