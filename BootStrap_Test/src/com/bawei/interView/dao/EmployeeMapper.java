package com.bawei.interView.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.interView.bean.Employee;

public interface EmployeeMapper {
	
	//ע��ҳ��
	public void zhuce(Employee employee);
	//��½ҳ��
	public Employee login(Employee employee);
	//��ѯҳ��
	public List<Employee> queryEmp();
	//ɾ������
	public void deleteEmp(@Param("eid") int eid);
	
	//�޸ķ���
	public void updateEmp(Employee employee);
	
	

}
