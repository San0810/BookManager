package com.example.course.dao;

import com.example.course.bean.Coursed;
import com.example.course.entity.Course;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CourseDao {

    int getAll();

    List<Course> listByPage(Map map);


    Course findByCourseNum(String courseNum);

    void insert(Coursed cd);

    void update(String courseNum);

    Coursed findByCourseNum1(String courseNum,String studentNum);

    List<Course> listByStudentNum(String studentNum);

    void remove(String studentNum, String courseNum);

    int findResByCourseNum(String courseNum);

    void updateCut(String courseNum);
}
