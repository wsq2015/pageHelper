package com.bw.util;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	private int code;//״̬�룺100��ʾ�ɹ���200��ʾʧ��
	private String result;//�����ɹ�������ʧ��
	private Map<String, Object> data = new HashMap<String, Object>();
	
	
	//���سɹ�����ķ���
	public static Msg success(){
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setResult("�����ɹ�");
		return msg;
	}
	//����ʧ�ܽ���ķ���
	public static Msg fail(){
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setResult("����ʧ��");
		return msg;
	}
	
	//������ݣ�֧����ʽ����
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
