package com.education.edu.domain;

import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Advertisement extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 广告ID
     */
    @Excel(name = "广告序号", cellType = Excel.ColumnType.NUMERIC)
    private Long adId;

    /**
     * 广告信息
     */
    @Excel(name = "广告信息")
    private String advertisementInfo;

    /**
     * 广告图片
     */
    @Excel(name = "广告图片地址")
    private String adImg;

    /**
     * 使用标志（0代表使用 1代表隐藏）
     */
    @Excel(name = "广告状态", readConverterExp = "0=使用,1=隐藏")
    private String useFlag;

    /**
     * 图片本地接口前缀
     */
    private String api;

    public Long getAdId() {
        return adId;
    }

    public void setAdId(Long adId) {
        this.adId = adId;
    }

    public String getAdvertisementInfo() {
        return advertisementInfo;
    }

    public void setAdvertisementInfo(String advertisementInfo) {
        this.advertisementInfo = advertisementInfo;
    }

    public String getAdImg() {
        return adImg;
    }

    public void setAdImg(String adImg) {
        this.adImg = adImg;
    }

    public String getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(String useFlag) {
        this.useFlag = useFlag;
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
                .append("adId", getAdId())
                .append("adInfo", getAdvertisementInfo())
                .append("adImg", getAdImg())
                .append("useFlag", getUseFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
