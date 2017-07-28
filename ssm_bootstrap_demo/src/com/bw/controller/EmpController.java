package com.bw.controller;

import java.util.List;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.bean.Dept;
import com.bw.bean.Emp;
import com.bw.service.EmpService;
import com.bw.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/emp")
public class EmpController {

	@Autowired
	private EmpService empService;
	
	
	@RequestMapping("/selectPageJson")
	@ResponseBody
	public Msg selectEmpsWithJson(
			@RequestParam(value="pageno",defaultValue="1")Integer pageno
			,@RequestParam(value="pagesize",defaultValue="2")Integer pagesize){
		
		//ָ����ѯ��ҳ���ÿҳ������
		PageHelper.startPage(pageno, pagesize);
		//��ѯ���е�Ա������
		List<Emp> empList = empService.selectAllEmps();
		//��Ա�����ݷ�װ��pageInfo��
		PageInfo pageInfo = new PageInfo(empList);
		
		//��ʽ����
		/*Msg msg = Msg.success();
		msg.add("pageInfo", pageInfo);*/
		
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("/selectEmpJson")
	@ResponseBody
	public Msg selectEmpById(@RequestParam(value="empId")Integer empId){
		Emp emp = empService.selectById(empId);
		return Msg.success().add("emp", emp);
	}
	
	
	@RequestMapping("/selectPage")
	public String selectEmpsByPage(@RequestParam(value="pageno",defaultValue="1")Integer pageno,@RequestParam(value="pagesize",defaultValue="2")Integer pagesize,Model model){
		
		//pageNum��ѯ��ҳ��
		//pageSizeÿҳ������
		PageHelper.startPage(pageno, pagesize);
		//��ѯ���е�Ա������
		List<Emp> empList = empService.selectAllEmps();
		
		//������Ա�����ݷ�װ��pageInfo��
		PageInfo pageInfo = new PageInfo(empList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "pagelist";
	}
	
	@RequestMapping("/select")
	public String selectEmps(Model model){
		//��ѯ���е�Ա������
		List<Emp> empList = empService.selectAllEmps();

		model.addAttribute("empList", empList);
		
		return "list";
	}
	
	@RequestMapping(value="/selectDepts",method=RequestMethod.GET)
	@ResponseBody
	public List<Dept> selectDepts(){
		return empService.selectAllDepts();
	}
	
	@RequestMapping(value="/selectEmp",method=RequestMethod.POST)
	@ResponseBody
	public List<Dept> selectEmp(){
		return empService.selectAllDepts();
	}
	
	
	
	
	@RequestMapping("/save")
	@ResponseBody
	public Msg saveEmp(Emp emp){
		empService.addEmp(emp);
		return Msg.success();
	}
	@RequestMapping("/update")
	public String updateEmp(Emp emp){
		empService.updateEmp(emp);
		return "redirect:/emp/select";
	}
	
}
