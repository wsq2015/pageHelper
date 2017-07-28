package com.bawei.interView.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bawei.interView.bean.Employee;
import com.bawei.interView.dao.EmployeeMapper;

@Transactional(readOnly=true)
@Service
public class EmployeeService {
	
		@Autowired
		private EmployeeMapper employeeMapper;
		
	    //注册页面
		@Transactional(readOnly=false)
		public void zhuce(Employee employee){
			employeeMapper.zhuce(employee);
		}
		//登陆页面
		public Employee login(Employee employee){
			return employeeMapper.login(employee);
			
		}
		//查询页面
		public List<Employee> queryEmp(){
			return employeeMapper.queryEmp();
		}
		//删除方法
		public void deleteEmp(int eid){
			employeeMapper.deleteEmp(eid);
		}
		
		//修改方法
		public void updateEmp(Employee employee){
			employeeMapper.updateEmp(employee);
		}

}
