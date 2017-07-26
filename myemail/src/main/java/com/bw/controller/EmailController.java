package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.bean.Email;
import com.bw.service.EmailService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("user")
public class EmailController {
	
	@Autowired
	private EmailService service;
	
	@RequestMapping("select")
	@ResponseBody
	public PageInfo selectDefault(
			@RequestParam(value="pageno",defaultValue="1")Integer pageno,
			@RequestParam(value="pagesize",defaultValue="3")Integer pagesize,
			@RequestParam(value="status",defaultValue="0")Integer status,
			@RequestParam(value="orderFlag",defaultValue="0")Integer orderFlag
			){
		
		PageHelper.startPage(pageno, pagesize);
		//查询所有数据
		List<Email> list = service.selectByExample(status,orderFlag);
		
		PageInfo pageInfo = new PageInfo(list);
		
		return pageInfo;	
	}
	
	@RequestMapping("batchRead")
	@ResponseBody
	public Map<String,String> batchSetRead(@RequestParam(value="eids")String eids){
		
		String[] arr = eids.split(",");
		int[] eidArr = new int[arr.length];
		
		for (int i = 0; i < eidArr.length; i++) {
			eidArr[i] = Integer.parseInt(arr[i]);
		}
		
		
		service.batchSetRead(eidArr);
		Map<String,String> map = new HashMap<>();
		map.put("result", "ok");
		return map;
	}
	
	
	
	

	
	
}
