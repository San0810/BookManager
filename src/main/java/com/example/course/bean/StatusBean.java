package com.example.course.bean;

public class StatusBean {
	boolean success;
	String message;
	public StatusBean(boolean success) {
		this.success = success;
	}

	public StatusBean(boolean success, String message) {
		this.success = success;
		this.message = message;
	}

	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
