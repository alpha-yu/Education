package com.education.edu.mapper;


import com.education.edu.domain.Wish;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface WishMapper {
    /**
     * 根据条件分页查询心愿信息
     * @param wish 心愿信息
     * @return 心愿信息集合
     */
    public List<Wish> selectWishList(Wish wish);

    /**
     * 通过心愿ID查询心愿信息
     *
     * @param wishId 学校ID
     * @return 心愿对象信息
     */
    public Wish selectWishById(Long wishId);

    /**
     * 修改心愿信息
     *
     * @param wish 心愿信息
     * @return 结果
     */
    public int updateWish(Wish wish);

    /**
     * 新增心愿信息
     *
     * @param wish 心愿信息
     * @return 结果
     */
    public int insertWish(Wish wish);

    /**
     * 批量删除心愿信息
     *
     * @param wishIds 需要删除的心愿ID
     * @return 结果
     */
    public int deleteWishByIds(Long[] wishIds);


}
