package com.education.edu.domain;

import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Goods extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
    @Excel(name = "商品序号", cellType = Excel.ColumnType.NUMERIC)
    private Long goodsId;

    /**
     * 商品来源学校id
     */
    @Excel(name = "商品来源学校ID")
    private Long SchoolId;

    /**
     * 商品来源学校名称
     */
    @Excel(name = "商品来源学校名称")
    private String schoolName;

    /**
     * 商品名称
     */
    @Excel(name = "商品名称")
    private String goodsName;

    /**
     * 商品图片地址
     */
    @Excel(name = "商品图片地址")
    private String goodsImg;

    /**
     * 商品描述
     */
    @Excel(name = "商品介绍")
    private String goodsInfo;

    /**
     * 商品价格
     */
    @Excel(name = "商品价格")
    private Double goodsPrice;

    /**
     * 购买者名称
     */
    @Excel(name = "购买者名称")
    private String buyerName;

    /**
     * 售出标志（0代表待售 1代表售出）
     */
    @Excel(name = "商品状态", readConverterExp = "0=待售,1=售出")
    private String soldFlag;

    /**
     * 图片本地接口前缀
     */
    private String api;

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Long getSchoolId() {
        return SchoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.SchoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public String getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(String goodsInfo) {
        this.goodsInfo = goodsInfo;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

//    public String getGoodsType() {
//        return goodsType;
//    }
//
//    public void setGoodsType(String goodsType) {
//        this.goodsType = goodsType;
//    }

    public String getSoldFlag() {
        return soldFlag;
    }

    public void setSoldFlag(String soldFlag) {
        this.soldFlag = soldFlag;
    }

    public String getApi() {
        return api;
    }

    public void setApi(String api) {
        this.api = api;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("goodsId", getGoodsId())
                .append("SchoolId", getSchoolId())
                .append("SchoolName", getSchoolName())
                .append("goodsName", getGoodsName())
                .append("goodsImg", getGoodsImg())
                .append("goodsInfo", getGoodsInfo())
                .append("goodsPrice", getGoodsPrice())
                .append("goodsBuyerName", getBuyerName())
//                .append("goodsType", getGoodsType())
                .append("SoldFlag ", getSoldFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
