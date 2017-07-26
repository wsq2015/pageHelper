package com.bawei.interView.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.interView.bean.Email;
import com.bawei.interView.service.impl.EmailMapperInter;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("test")
public class EmailController {
	
	@Autowired
	private EmailMapperInter emailMapperInter;
	
	@RequestMapping("pageHelper")
	@ResponseBody
	public PageInfo<Email> pageHelper(@RequestParam(value="pageNo",defaultValue="1")
			Integer pageNo,@RequestParam(value="pageSize",defaultValue="1")Integer pageSize,
			@RequestParam(value="status",defaultValue="0") Integer status,
			@RequestParam(value="orderFlag",defaultValue="0") Integer orderFlag
			){
		PageHelper.startPage(pageNo, pageSize);
		List<Email> selectByExample = emailMapperInter.selectByExample(status, orderFlag);
		PageInfo<Email> pageInfo = new PageInfo<Email>(selectByExample);
		return pageInfo;
		
		
	}
	
	
	
	@RequestMapping(value="selectByExample",method=RequestMethod.GET)
	@ResponseBody
	public List<Email> selectByExample(){
		List<Email> selectByExample = emailMapperInter.selectByExample();
		return selectByExample;
	}
	
	@RequestMapping("deleteAll")
	public String deleteAll(@RequestParam("sendId") String sendId){
		String[] split = sendId.split(",");
		for (int i = 0; i < split.length; i++) {
			int parseInt = Integer.parseInt(split[i]);
			emailMapperInter.deleteByExample(parseInt);
		}
		return "index";
	}
	@RequestMapping("readAll")
	public String readAll(@RequestParam("sendId") String sendId,
			   @RequestParam("sendRead") String sendRead){
	      String[] split = sendId.split(",");
	      String[] sendReads = sendRead.split(",");
	   
		for (int i = 0; i < split.length; i++) {
			int parseInt = Integer.parseInt(split[i]);
			for (int j = 0; j < sendReads.length; j++) {
				int ss = Integer.parseInt(sendReads[j]);
				
				if(ss==1)
				     {ss = 0;emailMapperInter.readAll(parseInt, ss);}
				else if(ss==0)
				     {ss = 1;emailMapperInter.readAll(parseInt, ss);}
			}
			
		}
		return "index";
	}
	
	
	

}
