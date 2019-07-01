package com.example.course.service;

import com.example.course.dao.AdminDao;
import com.example.course.entity.Admin;
import com.example.course.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminService {
    @Autowired
    private AdminDao mapper;
    public Admin verify(String id, String password) {
        return mapper.verify(id,password);
    }

    public void updateInfo(String workNum, String name, String password) {
        mapper.updateInfo(workNum,name,password);
    }
    public Admin findAdminByWorkNum(String workNum) {
        return mapper.findAdminByWorkNum(workNum);
    }

    public void updateCourse(String courseNum, String courseName, String teacher, int sum, int res, String limitGrade, String time) {
        mapper.updateCourse(courseNum,courseName,teacher,sum,res,limitGrade,time);
    }

    public void deleteCollege(int id) {
        mapper.deleteCollege(id);
    }

    public int findIdByCollegeName(String collegeName) {
        return mapper.findIdByCollegeName(collegeName);
    }

    public void insertCollege(int collegeId, String collegeName, int id) {
        mapper.insertCollege(collegeId,collegeName,id);
    }

    public void deleteCoursed(String courseNum) {
        mapper.deleteCoursed(courseNum);
    }

    public void deleteCourse(String courseNum) {
        mapper.deleteCourse(courseNum);
    }

    public int insertCourse(Course course) {
        return mapper.insertCourse(course);
    }

}
