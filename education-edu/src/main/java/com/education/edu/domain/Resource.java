package com.education.edu.domain;

import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Resource extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 资源ID
     */
    @Excel(name = "资源序号", cellType = Excel.ColumnType.NUMERIC)
    private Long resourceId;

    /**
     * 资源名称
     */
    @Excel(name = "资源名称")
    private String resourceName;

    /**
     * 资源展示图片地址
     */
    @Excel(name = "资源展示图片地址")
    private String resourceImg;

    /**
     * 资源简介
     */
    @Excel(name = "资源简介")
    private String resourceInfo;

    /**
     * 资源地址
     */
    @Excel(name = "资源地址")
    private String resourceUrl;

    /**
     * 资源类型
     */
    @Excel(name = "资源类型", readConverterExp = "0=未分类,1=音频,2=电子教材,3=电子课件")
    private String resourceType;

    /**
     * 资源适用年级
     */
    @Excel(name = "资源适用年级", readConverterExp = "0=未分类,1=一年级,2=二年级,3=三年级,4=四年级,5=五年级,6=六年级,7=初一,8=初二,9=初三,10=高一,11=高二,12=高三")
    private String resourceGrade;

    /**
     * 资源适用学科
     */
    @Excel(name = "资源适用学科", readConverterExp = "0=未分类,1=语文,2=数学,3=英语,4=物理,5=历史,6=化学,7=地理,8=政治,9=生物,10=科学")
    private String resourceObject;

    /**
     * 资源版本
     */
    @Excel(name = "资源版本")
    private String resourceVer;

    /**
     * 正常标志（0为正常，1为失效）
     */
    @Excel(name = "正常状态", readConverterExp = "0=正常,1=失效")
    private String norFlag;

    /**
     * 图片本地接口前缀
     */
    private String api;

    public Long getResourceId() {
        return resourceId;
    }

    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getResourceImg() {
        return resourceImg;
    }

    public void setResourceImg(String resourceImg) {
        this.resourceImg = resourceImg;
    }

    public String getResourceInfo() {
        return resourceInfo;
    }

    public void setResourceInfo(String resourceInfo) {
        this.resourceInfo = resourceInfo;
    }

    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public String getResourceGrade() {
        return resourceGrade;
    }

    public void setResourceGrade(String resourceGrade) {
        this.resourceGrade = resourceGrade;
    }

    public String getResourceObject() {
        return resourceObject;
    }

    public void setResourceObject(String resourceObject) {
        this.resourceObject = resourceObject;
    }

    public String getResourceVer() {
        return resourceVer;
    }

    public void setResourceVer(String resourceVer) {
        this.resourceVer = resourceVer;
    }

    public String getNorFlag() {
        return norFlag;
    }

    public void setNorFlag(String norFlag) {
        this.norFlag = norFlag;
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
                .append("resourceId", getResourceId())
                .append("resourceName", getResourceName())
                .append("resourceImg", getResourceImg())
                .append("resourceInfo", getResourceInfo())
                .append("resourceUrl", getResourceUrl())
                .append("resourceType", getResourceType())
                .append("resourceGrade", getResourceGrade())
                .append("resourceObject", getResourceObject())
                .append("resourceVer", getResourceVer())
                .append("norFlag ", getNorFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}