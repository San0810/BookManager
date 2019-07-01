package com.example.course.dao;

import com.example.course.entity.Admin;

import com.example.course.entity.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {

    Admin verify(String id, String password);


    void updateInfo(String workNum, String name, String password);

    Admin findAdminByWorkNum(String workNum);

    void updateCourse(String courseNum, String courseName, String teacher, int sum, int res, String limitGrade, String time);

    void deleteCollege(int id);

    int findIdByCollegeName(String collegeName);

    void insertCollege(int collegeId, String collegeName, int id);

    void deleteCoursed(String courseNum);

    void deleteCourse(String courseNum);

    int insertCourse(Course course);

    int findIdByCourseNum(String courseNum);
}
