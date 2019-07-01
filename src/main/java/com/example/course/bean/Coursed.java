package com.example.course.bean;

public class Coursed {
    private Integer id;
    private String studentNum;
    private String studentName;
    private String courseNum;
    private String courseName;
    private String teacher;

    public Coursed(Integer id, String studentNum, String studentName, String courseNum, String courseName, String teacher) {
        this.id = id;
        this.studentNum = studentNum;
        this.studentName = studentName;
        this.courseNum = courseNum;
        this.courseName = courseName;
        this.teacher = teacher;
    }

    public Coursed(String studentNum, String studentName, String courseNum, String courseName, String teacher) {
        this.studentNum = studentNum;
        this.studentName = studentName;
        this.courseNum = courseNum;
        this.courseName = courseName;
        this.teacher = teacher;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
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
}
