package com.example.course.controller;

import com.example.course.bean.StatusBean;
import com.example.course.entity.Admin;
import com.example.course.entity.Course;
import com.example.course.service.AdminService;
import com.example.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private CourseService courseService;
    @RequestMapping("/index")
    public  String index(){
        return "/admin/index";
    }
    @RequestMapping("/info")
    public String info(){
        return "/admin/info";
    }
    @RequestMapping("/updateInfo")
    @ResponseBody
    public StatusBean updateInfo(@RequestParam(value = "name") String name,
                                 @RequestParam(value = "password") String password,
                                 @RequestParam String workNum, HttpSession session){

        adminService.updateInfo(workNum,name,password);
        //更新当前session
        session.removeAttribute("admin");
        Admin ad = adminService.findAdminByWorkNum(workNum);
        session.setAttribute("admin",ad);
        return new StatusBean(true);
    }
    //修改or添加课程
    @RequestMapping("/updateCourse")
    @ResponseBody
    public StatusBean updateCourse(@RequestParam String courseNum,@RequestParam String courseName,
                               @RequestParam String teacher,@RequestParam String sum,
                               @RequestParam String res,@RequestParam String limitGrade,
                               @RequestParam String time,@RequestParam(required = false) String college,
                                   @RequestParam String flag){
        int summ=Integer.parseInt(sum);
        int ress=Integer.parseInt(res);
        int length = college.length();//空为"[]",非空为"["信息学院","数统学院"]"
        if(flag.equals("添加")){//添加
            Course course = new Course();
            course.setCourseNum(courseNum);
            course.setCourseName(courseName);
            course.setTeacher(teacher);
            course.setSum(summ);
            course.setRes(ress);
            course.setLimitGrade(limitGrade);
            course.setTime(time);
            int success = adminService.insertCourse(course);//插入成功返回1
            int id = course.getId();//回填id
            //获取插入的course_id
            if(college.equals("[]")){
                return new StatusBean(true,",添加成功,无学院限制");
            }else {
                String str = college.substring(1,length-1);//"信息学院","数统学院"
                String[] colleges = str.split(",");//["信息学院","数统学院"]
                insertColleged(colleges,id);
                return new StatusBean(true,"添加成功,有学院限制");
            }
        }else {//修改
            //更新与该课程相关的表course,colleged
            //更新colleged直接把原来限制的都删掉
            Course course = courseService.findByCourseNum(courseNum);//查找该课程信息
            int id = course.getId();
            adminService.deleteCollege(id);
            if(college.equals("[]")){
                System.out.println("无学院限制");
            }else {
                String str = college.substring(1,length-1);
                String[] colleges = str.split(",");
                insertColleged(colleges,id);
            }
            //更新course
            adminService.updateCourse(courseNum,courseName,teacher,summ,ress,limitGrade,time);
            return new StatusBean(true);
        }
    }

    private void insertColleged(String[] colleges, int id) {
        for(int i = 0;i<colleges.length;i++){
            int length1 = colleges[i].length();
            String collegeName = colleges[i].substring(1,length1-1);//信息学院
            int collegeId = adminService.findIdByCollegeName(collegeName);//查询该学院id
            adminService.insertCollege(collegeId,collegeName,id);//插入学院限制表
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public StatusBean delete(@RequestParam String courseNum){
        //先删除colleged
        Course course = courseService.findByCourseNum(courseNum);

        if(course.getList()!=null){//有学院限制才删除
            int id = course.getId();
           adminService.deleteCollege(id);//根据课程id删除相关学院限制记录
        }
        //再删除coursed
        adminService.deleteCoursed(courseNum);//根据课程号删除相关已选记录
        //最后删除course
        adminService.deleteCourse(courseNum);
        return new StatusBean(true);
    }
}
