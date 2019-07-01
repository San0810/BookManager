package com.example.course.entity;

import javax.validation.constraints.NotBlank;

public class Admin {
    private Integer id;
    @NotBlank(message = "工号不能为空")
    private String workNum;//工号
    private String name;
    @NotBlank(message = "密码不能为空")
    private String password;

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", workNum='" + workNum + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWorkNum() {
        return workNum;
    }

    public void setWorkNum(String workNum) {
        this.workNum = workNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
