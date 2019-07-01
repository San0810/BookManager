package com.example.course.dao;

import com.example.course.entity.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentDao {
    Student verify(String id, String password);

    void update(@Param("id") Integer id, @Param("studentNum") String studentNum,
                @Param("studentName") String studentName,
                @Param("password") String password, @Param("grade") String grade,
                @Param("college") String college);

    Student findById(int id);
}
