package com.bw.bean;

public class Emp {
	
	private Integer emp_id;
	private String emp_name;
	private String gender;
	private String email;
	private Dept dept;//À˘ Ù≤ø√≈
	public Emp() {
		super();
	}
	public Emp(Integer emp_id, String emp_name, String gender, String email,
			Dept dept) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.gender = gender;
		this.email = email;
		this.dept = dept;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Emp [emp_id=" + emp_id + ", emp_name=" + emp_name + ", gender="
				+ gender + ", email=" + email + ", dept=" + dept + "]";
	}
	
	

}
