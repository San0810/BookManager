package com.example.course.controller;

import com.example.course.bean.Coursed;
import com.example.course.bean.StatusBean;
import com.example.course.entity.Course;
import com.example.course.entity.Student;
import com.example.course.service.CourseService;
import com.example.course.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    //请求访问学生首页index
    @RequestMapping("/studentIndex")
    public String studentIndex(){
        return "/student/index";
    }

    //修改个人信息
    @RequestMapping("/studentInfo")
    public String studentInfo(){
        return "/student/info";
    }

    //学生修改提交
    @RequestMapping(value = "/updateStudentInfo",method = RequestMethod.POST)
    @ResponseBody
    public StatusBean save(@RequestParam("studentNum") String studentNum,
                           @RequestParam("studentName") String studentName,
                           @RequestParam("password") String password,
                           @RequestParam("grade") String grade,
                           @RequestParam("college") String college, HttpSession session) {
        int id = ((Student) session.getAttribute("student")).getId();//根据id修改学生信息,也可以根据学号
        studentService.update(id, studentNum, studentName, password, grade, college);
        session.removeAttribute("student");
        Student student = studentService.findById(id);
        session.setAttribute("student",student);//更新session
        return new StatusBean(true);
    }

    //学生选课
    //1.插入一条记录2.相应课程的res减1  3.按钮变化4.刷新页面
    @RequestMapping("/selectCourse")
    @ResponseBody
    public StatusBean selectCourse(@RequestParam(value = "courseNum") String courseNum,
                                   @RequestParam("limitgrade") String limitGrade,
                                   @RequestParam("college") String college, HttpSession session){
        Student st = (Student) session.getAttribute("student");
        Course course = courseService.findByCourseNum(courseNum);//根据课程号查询相应课程信息
        //1.查询选课余量是否为0
        int res = courseService.findResByCourseNum(courseNum);
        if(res==0){
            return new StatusBean(false,"已满,请回");
        }
        //2.判断是否符合年级
        if(!st.getGrade().equals(limitGrade)){
            return new StatusBean(false,"年级不符合");
        }
        //3.学院判断
        String str = college.trim();
        boolean flag =false;
        if(str==null||str.equals("")||str.matches("\\s*")){//某些课程没有学院限制
            flag=true;
        }else{
            String pattern=".*"+st.getCollege()+".*";
             flag= Pattern.matches(pattern,str);
        }
        if(!flag){//如果没有一个学院匹配
            return new StatusBean(false,"学院不符合");
        }
        //4.判断是否已选
        Coursed course1 = courseService.findByCourseNum1(courseNum,st.getStudentNum());//在已选课表里查看你是否存在
        if (course1 != null) {
            return new StatusBean(false,"课表已存在");
        }
        //5..插入选课记录
        Coursed cd = new Coursed(st.getStudentNum(),st.getStudentName(),course.getCourseNum(),course.getCourseName(),course.getTeacher());
        courseService.insert(cd);//插入记录
        //4.更新res余量
        courseService.update(courseNum);//更新课表

        return new StatusBean(true);
    }

    //查询学生已选课程
    //1.获取学生个人信息 2.根据学生学号查询已选课表中存在的记录,存在一个list  3.返回给前端
    @RequestMapping("/selected.do")
    public String listSelected(HttpSession session,Map model){
        Student st = (Student) session.getAttribute("student");//先获取学生个人信息
        List<Course> list = courseService.listByStudentNum(st.getStudentNum());
        model.put("selectList",list);
        return "/student/selected";
    }
    //退课
    @RequestMapping("/remove")
    @ResponseBody
    public StatusBean  remove(@RequestParam("courseNum") String courseNum,HttpSession session){
        System.out.println("courseNum="+courseNum);
        Student st = (Student) session.getAttribute("student");//先获取学生个人信息
        courseService.remove(st.getStudentNum(),courseNum);//从已选课表中删除相关记录
        //相应课程res+1
        courseService.updateCut(courseNum);
        return new StatusBean(true);
    }

    //时间校验
    @RequestMapping("/check")
@ResponseBody
public StatusBean check(@RequestParam String date) throws ParseException {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date cr = sdf.parse(date);//将前端传来的时间字符串转换成时间类型
    Date now = new Date();
    if(now.getTime()>=cr.getTime()){//转换成long作比较
        return new StatusBean(true);
    }else {
        return new StatusBean(false);
    }
}
}
