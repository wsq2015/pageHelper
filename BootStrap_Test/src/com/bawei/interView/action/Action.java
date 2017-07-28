package com.bawei.interView.action;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.interView.bean.Department;
import com.bawei.interView.bean.Employee;
import com.bawei.interView.service.DepartmentService;
import com.bawei.interView.service.EmployeeService;
import com.bawei.interView.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("/test")
@Controller
public class Action {  
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/zhuce",method=RequestMethod.POST)
	public String zhuce(Employee employee) throws ParseException{
		employeeService.zhuce(employee);
		return "dl";
	}
	@RequestMapping(value="/queryDep",method=RequestMethod.POST)
	@ResponseBody
	public List<Department> queryDep(){
		List<Department> queryDep = departmentService.queryDep();
		return queryDep;
	}
	@RequestMapping("dl")
	public String dl(){
		return "dl";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Employee employee,Map<String, Object> map){
		System.out.println(employee);
		Employee emp = employeeService.login(employee);
		map.put("empdl", emp);
		if(emp!=null){
			return "show";
		}
		return "dl";
	}
	//http://lenovo-pc:8080/BootStrap_Test/test/show
	@RequestMapping(value="/show",method=RequestMethod.GET)
	@ResponseBody
	public Message show(@RequestParam(value="pageno",defaultValue="1") Integer pageno,
			@RequestParam(value="pagesize",defaultValue="2") Integer pagesize){
		 
		PageHelper.startPage(pageno, pagesize);
		List<Employee> queryEmp = employeeService.queryEmp();
		
		PageInfo pageInfo = new PageInfo(queryEmp);
		System.out.println("0000000000000000000000000000000000000000"+pageInfo.getList());
		return Message.success().add("pageInfo", pageInfo);
	}
	
	

}
