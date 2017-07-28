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
		
		//指定查询的页码和每页的条数
		PageHelper.startPage(pageno, pagesize);
		//查询所有的员工数据
		List<Emp> empList = empService.selectAllEmps();
		//将员工数据封装在pageInfo中
		PageInfo pageInfo = new PageInfo(empList);
		
		//链式操作
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
		
		//pageNum查询的页码
		//pageSize每页的条数
		PageHelper.startPage(pageno, pagesize);
		//查询所有的员工数据
		List<Emp> empList = empService.selectAllEmps();
		
		//将所有员工数据封装到pageInfo中
		PageInfo pageInfo = new PageInfo(empList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "pagelist";
	}
	
	@RequestMapping("/select")
	public String selectEmps(Model model){
		//查询所有的员工数据
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
