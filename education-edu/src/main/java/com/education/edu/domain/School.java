package com.education.edu.domain;

import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class School extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 学校ID
     */
    @Excel(name = "学校序号", cellType = Excel.ColumnType.NUMERIC)
    private Long schoolId;

    /**
     * 学校名称
     */
    @Excel(name = "学校名称")
    private String schoolName;

    /**
     * 学校Logo地址
     */
    @Excel(name = "学校Logo地址")
    private String schoolImg;

    /**
     * 学校简介
     */
    @Excel(name = "学校简介")
    private String schoolInfo;

    /**
     * 学校联系方式
     */
    @Excel(name = "学校联系方式")
    private String schoolCif;

    /**
     * 学校地址
     */
    @Excel(name = "学校地址")
    private String schoolAddr;

    /**
     * 学校邮编
     */
    @Excel(name = "学校邮编")
    private String schoolPc;

    /**
     * 删除标志（0代表存在 1代表删除）
     */
    @Excel(name = "删除状态", readConverterExp = "0=正常,1=删除")
    private String delFlag;

    /**
     * 图片本地接口前缀
     */
    private String api;

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSchoolImg() {
        return schoolImg;
    }

    public void setSchoolImg(String schoolImg) {
        this.schoolImg = schoolImg;
    }

    public String getSchoolInfo() {
        return schoolInfo;
    }

    public void setSchoolInfo(String schoolInfo) {
        this.schoolInfo = schoolInfo;
    }

    public String getSchoolCif() {
        return schoolCif;
    }

    public void setSchoolCif(String schoolCif) {
        this.schoolCif = schoolCif;
    }

    public String getSchoolAddr() {
        return schoolAddr;
    }

    public void setSchoolAddr(String schoolAddr) {
        this.schoolAddr = schoolAddr;
    }

    public String getSchoolPc() {
        return schoolPc;
    }

    public void setSchoolPc(String schoolPc) {
        this.schoolPc = schoolPc;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
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
                .append("schoolId", getSchoolId())
                .append("schoolName", getSchoolName())
                .append("schoolImg", getSchoolImg())
                .append("schoolInfo", getSchoolInfo())
                .append("schoolCif", getSchoolCif())
                .append("schoolAddr", getSchoolAddr())
                .append("schoolPc", getSchoolPc())
                .append("delFlag ", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
