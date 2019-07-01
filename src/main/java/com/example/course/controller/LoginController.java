package com.example.course.controller;

import com.example.course.entity.Admin;
import com.example.course.entity.Student;
import com.example.course.service.AdminService;
import com.example.course.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;

    @RequestMapping({"/","index.html"})
    public String index(){
        return "login/login";
    }//首页跳转

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public String login(@RequestParam String id, @RequestParam String password, HttpSession session, Map model){
        String pattern ="\\d{11}";//正则表达式判断账号类别
        boolean flag = Pattern.matches(pattern,id);//判断登录的是否是学生学号
        if(flag){//是学生
            Student student = studentService.verify(id,password);//数据库校验
            if(student!=null){
                System.out.println("学生登录");
                session.setAttribute("student",student);
                return "redirect:/login/student.do";
            }else{
                model.put("errorInfo","账号或者密码错误");
                return "/login/login";
            }
        }else {//是管理员
            Admin admin = adminService.verify(id,password);
            if(admin!=null){
                session.setAttribute("admin",admin);
                return "redirect:/login/admin.do";
            }else{
                model.put("errorInfo","账号或者密码错误");
                return "/login/login";
            }
        }

    }
    //学生首页
    @RequestMapping("/student.do")
    public String excuteStudent(){
        return "/student/index";
    }//校验成功进入首页
    //管理员首页
    @RequestMapping("/admin.do")
    public String excuteAdmin(){
        return "/admin/index";
    }

    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login/";
    }
}
