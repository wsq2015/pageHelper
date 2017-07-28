package com.bw.dao;

import java.util.List;

import com.bw.bean.Dept;
import com.bw.bean.Emp;

public interface EmpDaoMapper {
	
	//���
	public void addEmp(Emp emp);
	
	//����idɾ��
	public void deleteById(Integer empId);
	
	//��ѯ����
	public List<Emp> selectAllEmps();

	//����id��ѯԱ��
	public Emp selectById(Integer empId);
	
	//�޸�
	public void updateEmp(Emp emp);
	
	//��ѯ���в���
	public List<Dept> selectAllDepts();
}
