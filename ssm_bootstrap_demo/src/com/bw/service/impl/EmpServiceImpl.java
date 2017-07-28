package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bw.bean.Dept;
import com.bw.bean.Emp;
import com.bw.dao.EmpDaoMapper;
import com.bw.service.EmpService;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpDaoMapper empDao;

	@Override
	public void addEmp(Emp emp) {
		empDao.addEmp(emp);

	}

	@Override
	public void deleteById(Integer empId) {
		empDao.deleteById(empId);
	}

	@Override
	public List<Emp> selectAllEmps() {
		return empDao.selectAllEmps();
	}

	@Override
	public Emp selectById(Integer empId) {
		return empDao.selectById(empId);
	}

	@Override
	public void updateEmp(Emp emp) {
		empDao.updateEmp(emp);
	}

	@Override
	public List<Dept> selectAllDepts() {
		return empDao.selectAllDepts();
	}

}
