package com.bawei.interView.util;

import java.util.HashMap;
import java.util.Map;

public class Message {
	
	private int code;
	private String result;
	private Map<String, Object> data = new HashMap<String, Object>();
	
	public static Message success(){
		
		Message message = new Message();
		message.setCode(100);
		message.setResult("success");
		
		return message;
		
	}
	public static Message fail(){
		
		Message message = new Message();
		message.setCode(200);
		message.setResult("fail");
		return message;
		
	}
	public Message add(String key,Object value){
		this.getData().put(key, value);
		return this;
		
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(int code, String result, Map<String, Object> data) {
		super();
		this.code = code;
		this.result = result;
		this.data = data;
	}

	@Override
	public String toString() {
		return "Message [code=" + code + ", result=" + result + ", data="
				+ data + "]";
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
