package com.education.edu.mapper;

import com.education.edu.domain.School;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SchoolMapper {

    /**
     * 根据条件分页查询学校列表
     *
     * @param school 学校信息
     * @return 学校信息集合信息
     */
    public List<School> selectSchoolList(School school);

    /**
     * 通过学校ID查询学校信息
     *
     * @param schoolId 学校ID
     * @return 学校对象信息
     */
    public School selectSchoolById(Long schoolId);


    /**
     * 修改学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    public int updateSchool(School s);

    /**
     * 新增学校信息
     *
     * @param s 学校信息
     * @return 结果
     */
    public int insertSchool(School s);

    /**
     * 批量删除学校信息
     *
     * @param schoolIds 需要删除的学校ID
     * @return 结果
     */
    public int deleteSchoolByIds(Long[] schoolIds);
}
