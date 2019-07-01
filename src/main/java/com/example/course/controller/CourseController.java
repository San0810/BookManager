package com.example.course.controller;
import com.example.course.entity.Course;
import com.example.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CourseController {
    @Autowired
    private  CourseService courseService;
    //学生请求分页
    @RequestMapping("/course")
    public String list(@RequestParam int page, Map model){
        Map<String,String> map = new HashMap<>();
        setPage(model, courseService.listByPage(page,map), courseService.getTotal(), "0");
        return "/student/course";
    }

    //管理员请求分页
    @RequestMapping("/coursee")
    public String list1(@RequestParam int page, Map model){
        Map<String,String> map = new HashMap<>();
        setPage(model, courseService.listByPage(page,map), courseService.getTotal(), "0");
        return "/admin/course";
    }

    //学生条件查询
    @RequestMapping("/course/listByPage")
    public String listByPage(@RequestParam int page,@RequestParam(required = false) String teacher,
                             @RequestParam(required = false) String college,
                             @RequestParam(required = false,value = "coursenum") String courseNum,
                             Map model){
        geiPageByConditions(page, teacher, college, courseNum, model);
        return "/student/course";
    }

    //管理员条件查询
    @RequestMapping("/coursee/listByPagee")
    public String listByPagee(@RequestParam int page,@RequestParam(required = false) String teacher,
                             @RequestParam(required = false) String college,
                             @RequestParam(required = false,value = "coursenum") String courseNum,
                             Map model){
        geiPageByConditions(page, teacher, college, courseNum, model);
        return "/admin/course";
    }

    @RequestMapping("/course/findByCourseNum")
    @ResponseBody
    public Course findByCourseNum(@RequestParam("coursenum") String courseNum){
        Course course =courseService.findByCourseNum(courseNum);
        return  course;
    }
    private void setPage(Map model, List<Course> courses, int total2, String i) {
        List<Course> list = courses;//查出page所在页的course
        int total = total2;
        model.put("courseList", list);//当前页的课程
        model.put("total", total);//总页数
        model.put("list", i);
    }
    private void geiPageByConditions(@RequestParam int page, @RequestParam(required = false) String teacher,
                                     @RequestParam(required = false) String college,
                                     @RequestParam(required = false, value = "coursenum") String courseNum, Map model) {
        Map<String, String> map = new HashMap<>();
        map.put("teacher", teacher);//不管有没有都把参数丢进map,map里面可以为null值,到时在sql中判断查询即可
        map.put("college", college);
        map.put("courseNum", courseNum);
        List<Course> list = courseService.listByPage(page, map);
        int total = courseService.getTotal();
        model.put("courseList", list);
        model.put("total", total);
        model.put("list", 1);
    }
}
