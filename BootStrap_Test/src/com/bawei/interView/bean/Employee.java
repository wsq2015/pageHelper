package com.bawei.interView.bean;


import org.springframework.stereotype.Component;
@Component
public class Employee {
	private Integer eid;
	private String ename;
	private String gender;
	private String email;
	private String ebirthday;
	private Department Department;//ËùÊô²¿ÃÅ
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
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
	public String getEbirthday() {
		return ebirthday;
	}
	public void setEbirthday(String ebirthday) {
		this.ebirthday = ebirthday;
	}
	public Department getDepartment() {
		return Department;
	}
	public void setDepartment(Department department) {
		Department = department;
	}
	public Employee(Integer eid, String ename, String gender, String email,
			String ebirthday, com.bawei.interView.bean.Department department) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.gender = gender;
		this.email = email;
		this.ebirthday = ebirthday;
		Department = department;
	}
	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", ename=" + ename + ", gender="
				+ gender + ", email=" + email + ", ebirthday=" + ebirthday
				+ ", Department=" + Department + "]";
	}

	

}
