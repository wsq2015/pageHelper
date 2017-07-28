package com.bawei.interView.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.interView.bean.Employee;

public interface EmployeeMapper {
	
	//注册页面
	public void zhuce(Employee employee);
	//登陆页面
	public Employee login(Employee employee);
	//查询页面
	public List<Employee> queryEmp();
	//删除方法
	public void deleteEmp(@Param("eid") int eid);
	
	//修改方法
	public void updateEmp(Employee employee);
	
	

}
