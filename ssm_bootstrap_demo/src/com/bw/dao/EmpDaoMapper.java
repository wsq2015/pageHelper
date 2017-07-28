package com.bw.dao;

import java.util.List;

import com.bw.bean.Dept;
import com.bw.bean.Emp;

public interface EmpDaoMapper {
	
	//添加
	public void addEmp(Emp emp);
	
	//根据id删除
	public void deleteById(Integer empId);
	
	//查询所有
	public List<Emp> selectAllEmps();

	//根据id查询员工
	public Emp selectById(Integer empId);
	
	//修改
	public void updateEmp(Emp emp);
	
	//查询所有部门
	public List<Dept> selectAllDepts();
}
