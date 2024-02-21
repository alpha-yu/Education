package com.education.edu.service.impl;

import com.education.edu.domain.School;
import com.education.edu.mapper.SchoolMapper;
import com.education.edu.service.ISchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolServiceImpl implements ISchoolService
{

    @Autowired
    private SchoolMapper schoolMapper;

    /**
     * 查询学校列表
     *
     * @return 学校列表
     */
    @Override
    public List<School> selectSchoolList(School s) {
        return schoolMapper.selectSchoolList(s);
    }

    /**
     * 通过学校ID查询学校信息
     *
     * @param schoolId 学校ID
     * @return 学校对象信息
     */
    @Override
    public School selectSchoolById(Long schoolId) {
        return schoolMapper.selectSchoolById(schoolId);
    }

    /**
     * 新增保存学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    @Override
    public int insertSchool(School s)
    {
        return schoolMapper.insertSchool(s);
    }

    /**
     * 修改保存学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    @Override
    public int updateSchool(School s)
    {
        return schoolMapper.updateSchool(s);
    }

    /**
     * 批量删除学校信息
     *
     * @param schoolIds 需要删除的学校ID
     * @return 结果
     */
    @Override
    public int deleteSchoolByIds(Long[] schoolIds)
    {
        return schoolMapper.deleteSchoolByIds(schoolIds);
    }
}
