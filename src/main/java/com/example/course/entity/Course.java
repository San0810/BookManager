package com.example.course.entity;

import java.util.List;
public class Course {

    private Integer id;
    private String courseNum;//课程编号
    private String courseName;//课程名称
    private String teacher;//任课老师
    private Integer sum;//总量
    private Integer res;//剩余量
    private String limitGrade;//限制年级
    private String time;
    private List<College> list;

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", courseNum='" + courseNum + '\'' +
                ", courseName='" + courseName + '\'' +
                ", teacher='" + teacher + '\'' +
                ", sum=" + sum +
                ", res=" + res +
                ", limitGrade='" + limitGrade + '\'' +
                ", time='" + time + '\'' +
                ", list=" + list +
                '}';
    }

    public List<College> getList() {
        return list;
    }

    public void setList(List<College> list) {
        this.list = list;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseNum() {
        return courseNum;
    }

    public void setCourseNum(String courseNum) {
        this.courseNum = courseNum;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Integer getRes() {
        return res;
    }

    public void setRes(Integer res) {
        this.res = res;
    }

    public String getLimitGrade() {
        return limitGrade;
    }

    public void setLimitGrade(String limitGrade) {
        this.limitGrade = limitGrade;
    }
    public String show(){
        List<College> list = this.list;
        String str = "";
        for(College c:list){
            str = str+c.getCollegeName();
        }
        return str;
    }
}
