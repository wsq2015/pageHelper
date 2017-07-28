package com.bw.bean;

public class Dept {

	private Integer dept_id;//部门id
	private String dept_name;//部门名称
	
	public Dept() {
		super();
	}
	public Dept(Integer dept_id, String dept_name) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
	}
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	@Override
	public String toString() {
		return "Dept [dept_id=" + dept_id + ", dept_name=" + dept_name + "]";
	}
	
	
	
}
