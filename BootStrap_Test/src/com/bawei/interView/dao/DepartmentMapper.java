package com.bawei.interView.dao;

import java.util.List;

import com.bawei.interView.bean.Department;
public interface DepartmentMapper {
	
	//ajax获取下拉框
	public List<Department> queryDep();

}
