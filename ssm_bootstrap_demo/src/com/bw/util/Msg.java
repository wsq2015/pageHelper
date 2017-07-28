package com.bw.util;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	private int code;//状态码：100表示成功，200表示失败
	private String result;//操作成功、操作失败
	private Map<String, Object> data = new HashMap<String, Object>();
	
	
	//返回成功结果的方法
	public static Msg success(){
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setResult("操作成功");
		return msg;
	}
	//返回失败结果的方法
	public static Msg fail(){
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setResult("操作失败");
		return msg;
	}
	
	//存放数据，支持链式操作
	public Msg add(String key,Object value){
		this.getData().put(key, value);
		return this;		
	}
	
	
	public Msg() {
		super();
	}
	public Msg(int code, String result, Map<String, Object> data) {
		super();
		this.code = code;
		this.result = result;
		this.data = data;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	
	
}
