package com.education.edu.mapper;

import com.education.edu.domain.Goods;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GoodsMapper {

    /**
     * 根据条件分页查询商品列表
     *
     * @param goods 商品信息
     * @return 商品信息集合信息
     */
    List<Goods> selectGoodsList(Goods goods);

    /**
     * 根据商品ID查询商品信息
     *
     * @param goodsId 商品ID
     * @return 商品对象信息
     */
    Goods selectGoodsById(Long goodsId);

    /**
     * 修改商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    int updateGoods(Goods goods);

    /**
     * 新增商品信息
     *
     * @param goods 商品信息
     * @return 结果
     */
    int insertGoods(Goods goods);

    /**
     * 批量删除商品信息
     *
     * @param goodsIds 需要删除的商品ID
     * @return 结果
     */
    int deleteGoodsByIds(Long[] goodsIds);
}
