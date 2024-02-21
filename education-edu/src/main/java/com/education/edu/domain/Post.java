package com.education.edu.domain;

import com.education.common.annotation.Excel;
import com.education.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Post extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /**
     * 志愿岗位ID
     */
    @Excel(name = "志愿岗位序号", cellType = Excel.ColumnType.NUMERIC)
    private Long postId;

    /**
     * 需求来源学校序号
     */
    @Excel(name = "需求来源学校序号", cellType = Excel.ColumnType.NUMERIC)
    private Long schoolId;

    /**
     * 志愿岗位内容
     */
    @Excel(name = "志愿岗位内容")
    private String postInfo;

    /**
     * 完成标志
     */
    @Excel(name = "完成标志")
    private String comFlag;

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public String getPostInfo() {
        return postInfo;
    }

    public void setPostInfo(String postInfo) {
        this.postInfo = postInfo;
    }

    public String getComFlag() {
        return comFlag;
    }

    public void setComFlag(String comFlag) {
        this.comFlag = comFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("postId", getPostId())
                .append("schoolId", getSchoolId())
                .append("postInfo", getPostInfo())
                .append("comFlag", getComFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
