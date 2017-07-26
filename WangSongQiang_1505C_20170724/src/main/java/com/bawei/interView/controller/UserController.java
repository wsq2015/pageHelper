package com.bawei.interView.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.interView.bean.T_address;
import com.bawei.interView.bean.T_user;
import com.bawei.interView.service.userImpl.UserMapperInter;

@Controller
@RequestMapping("test")
public class UserController {
	
	@Autowired
	private UserMapperInter mapperInter;
	
	@RequestMapping("selectByExample")
	@ResponseBody
	public T_user selectByExample(@RequestParam("username")String username) {
		// TODO Auto-generated method stub
		T_user selectByExample = mapperInter.selectByExample(username);
		return selectByExample;
	}
	@RequestMapping("show")
	public String show(T_user t_user,Model model) {
		// TODO Auto-generated method stub
		List<T_user> show = mapperInter.show();
		model.addAttribute("list", show);
		return "show";
	}
	@RequestMapping(value="/zhuce",method=RequestMethod.POST)
	public String zhuce(T_user t_user,Model model) {
		// TODO Auto-generated method stub
		System.out.println("111111111111111111111111111111");
		System.out.println(t_user);
		model.addAttribute("usernameShow", t_user.getUsername());
		mapperInter.zhuce(t_user);
		return "dl";
	}
	@RequestMapping("querySelects")
	@ResponseBody
	public List<T_address> querySelects() {
		// TODO Auto-generated method stub
		List<T_address> querySelects = mapperInter.querySelects();
		return querySelects;
	}
	
	

}
