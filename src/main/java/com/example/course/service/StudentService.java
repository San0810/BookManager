package com.example.course.service;

import com.example.course.dao.StudentDao;
import com.example.course.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional

public class StudentService {
    @Autowired
    StudentDao mapper;
    public Student verify(String id, String password) {
        return mapper.verify(id,password);
    }

    public void update(Integer id, String studentNum, String studentName, String password, String grade, String college) {
         mapper.update(id,studentNum,studentName,password,grade,college);
    }
    public Student findById(int id) {
        System.out.println("1111111111");
        return mapper.findById(id);
    }
}
