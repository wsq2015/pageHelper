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
		
	    //ע��ҳ��
		@Transactional(readOnly=false)
		public void zhuce(Employee employee){
			employeeMapper.zhuce(employee);
		}
		//��½ҳ��
		public Employee login(Employee employee){
			return employeeMapper.login(employee);
			
		}
		//��ѯҳ��
		public List<Employee> queryEmp(){
			return employeeMapper.queryEmp();
		}
		//ɾ������
		public void deleteEmp(int eid){
			employeeMapper.deleteEmp(eid);
		}
		
		//�޸ķ���
		public void updateEmp(Employee employee){
			employeeMapper.updateEmp(employee);
		}

}
