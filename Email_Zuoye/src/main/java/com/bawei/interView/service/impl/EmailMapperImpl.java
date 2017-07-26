package com.bawei.interView.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bawei.interView.bean.Email;
import com.bawei.interView.bean.EmailExample;
import com.bawei.interView.bean.EmailExample.Criteria;
import com.bawei.interView.mapper.EmailMapper;

@Service
@Transactional(readOnly=true)
public class EmailMapperImpl implements EmailMapperInter {
	
	@Autowired
	private EmailMapper emailMapper;
	@Transactional(readOnly=false)
	@Override
	public void deleteByExample(Integer sendId) {
		// TODO Auto-generated method stub
		emailMapper.selectByExample();
		emailMapper.deleteByExample(sendId);
	}
	@Override
	public List<Email> selectByExample() {
		// TODO Auto-generated method stub
		return emailMapper.selectByExample();
	}
	@Transactional(readOnly=false)
	@Override
	public void readAll(Integer parseInt, Integer sendRead) {
		// TODO Auto-generated method stub
			emailMapper.readAll(parseInt, sendRead);
	}
	@Override
	public List<Email> selectByExample(Integer status, Integer orderFlag) {
		// TODO Auto-generated method stub
		if(status==0 && orderFlag ==0){
			return emailMapper.selectByExample(null);
		}else{
			EmailExample emailExample = new EmailExample();
			if(status !=0){
				Criteria criteria = emailExample.createCriteria();
				criteria.andSendReadEqualTo(status);
			}if(orderFlag!=0){
				if(orderFlag == 1){
					emailExample.setOrderByClause("sendTime asc");
				}else{
					emailExample.setOrderByClause("sendTime desc");
				}
			}
			return emailMapper.selectByExample();
		}
		
	}

}
