package com.education.edu.service;

import com.education.edu.domain.School;

import java.util.List;

public interface ISchoolService {

    /**
     * 查询学校列表
     *
     * @return 学校列表
     */
    public List<School> selectSchoolList(School s);

    /**
     * 通过学校ID查询学校信息
     *
     * @param schoolId 学校ID
     * @return 学校对象信息
     */
    public School selectSchoolById(Long schoolId);

    /**
     * 新增学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    public int insertSchool(School s);

    /**
     * 修改学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    public int updateSchool(School s);


    /**
     * 批量删除学校信息
     *
     * @param schoolIds 需要删除的学校ID
     * @return 结果
     */
    public int deleteSchoolByIds(Long[] schoolIds);

    /**
     * 查询学校岗位
     *
     * @return 学校列表
     */
    public List<School> selectSchoolAll();
}
