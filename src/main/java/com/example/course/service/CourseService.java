package com.example.course.service;

import com.example.course.bean.Coursed;
import com.example.course.dao.CourseDao;
import com.example.course.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
//@CacheConfig(cacheNames = "Course")
public class CourseService {
    @Autowired
    private CourseDao mapper;
    public int getTotal() {
        int sum = mapper.getAll();
        return getPage(sum);

    }
    @Cacheable(value = "CourseList",keyGenerator = "simpleKeyGenerator")
    public List<Course> listByPage(int page, Map map) {
        System.out.println("3333333333333");
        List<Course> list = null;
        List<Course> newList = new ArrayList<>();
        try {
            list=mapper.listByPage(map);
            int start = (page-1)*5;//计算当前开始记录数
            for(int i = start;i<start+5;i++){
                if(i>list.size()-1){
                    break;
                }
                newList.add(list.get(i));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return newList;
    }

    public Course findByCourseNum(String courseNum) {
        return mapper.findByCourseNum(courseNum);
    }

    public void insert(Coursed cd) {
        mapper.insert(cd);
    }

    public void update(String courseNum) {
        mapper.update(courseNum);
    }

    public Coursed findByCourseNum1(String courseNum,String studentNum) {
        return mapper.findByCourseNum1(courseNum,studentNum);
    }

    public List<Course> listByStudentNum(String studentNum) {
        return mapper.listByStudentNum(studentNum);
    }

    public void remove(String studentNum, String courseNum) {
        mapper.remove(studentNum,courseNum);
    }

    public int findResByCourseNum(String courseNum) {
        return mapper.findResByCourseNum(courseNum);
    }

    private int getPage(int sum) {
        if(sum<=5){
            return 1;
        }else if((sum%5)==0){
            return sum/5;
        }else {
            return sum/5 + 1;
        }
    }

    public void updateCut(String courseNum) {
        mapper.updateCut(courseNum);
    }
}
