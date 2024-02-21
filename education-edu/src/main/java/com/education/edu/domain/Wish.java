package com.education.edu.domain;


import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Wish extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /**
     * 心愿ID
     */
    @Excel(name = "心愿序号", cellType = Excel.ColumnType.NUMERIC)
    private Long wishId;

    /**
     * 心愿名称
     */
    @Excel(name = "心愿名称")
    private String wishName;

    /**
     * 心愿详细信息
     */
    @Excel(name = "心愿详细信息")
    private String wishInfo;

    /**
     * 心愿图片
     */
    @Excel(name = "心愿图片")
    private String wishImg;

    /**
     * 心愿发起学校ID
     */
    @Excel(name = "心愿发起学校ID", cellType = Excel.ColumnType.NUMERIC)
    private Long wisherSchool;

    /**
     * 心愿发起人名称
     */
    @Excel(name = "心愿发起人名称")
    private String wisherName;

    /**
     * 心愿认领者名称
     */
    @Excel(name = "心愿认领者名称")
    private String claimantName;

    /**
     * 认领标志
     */
    @Excel(name = "认领标志")
    private String claimFlag;

    /**
     * 图片本地接口前缀
      */
    private String api;

    public Long getWishId() {
        return wishId;
    }

    public void setWishId(Long wishId) {
        this.wishId = wishId;
    }

    public Long getWisherSchool() {
        return wisherSchool;
    }

    public void setWisherId(Long wisherSchool) {
        this.wisherSchool = wisherSchool;
    }

    public String getWishInfo() {
        return wishInfo;
    }

    public void setWishInfo(String wishInfo) {
        this.wishInfo = wishInfo;
    }


    public String getWishName() {
        return wishName;
    }

    public void setWishName(String wishName) {
        this.wishName = wishName;
    }


    public String getWishImg() {
        return wishImg;
    }

    public void setWishImg(String wishImg) {
        this.wishImg = wishImg;
    }

    public String getClaimantName() {
        return claimantName;
    }

    public void setClaimantName(String claimantName) {
        this.claimantName = claimantName;
    }

    public String getClaimFlag() {
        return claimFlag;
    }

    public void setClaimFlag(String claimFlag) {
        this.claimFlag = claimFlag;
    }

    public String getApi() {
        return api;
    }

    public void setApi(String api) {
        this.api = api;
    }

    public String getWisherName() {
        return wisherName;
    }

    public void setWisherName(String wisherName) {
        this.wisherName = wisherName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("wishId", getWishId())
                .append("wishName", getWishName())
                .append("wishInfo", getWishInfo())
                .append("wishImg", getWishImg())
                .append("wisherSchool", getWisherSchool())
                .append("wisherName", getWisherName())
                .append("claimantName", getClaimantName())
                .append("claimFlag", getClaimFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
