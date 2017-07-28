package com.bawei.interView.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bawei.interView.bean.Department;
import com.bawei.interView.dao.DepartmentMapper;

@Service
@Transactional(readOnly=true)
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> queryDep(){
		return departmentMapper.queryDep();
	}

}
