package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bw.bean.Email;
import com.bw.bean.EmailExample;
import com.bw.bean.EmailExample.Criteria;
import com.bw.dao.EmailMapper;
import com.bw.service.EmailService;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {
	
	@Autowired
	private EmailMapper dao;

	@Override
	public void batchSetRead(int[] eids) {
		dao.batchSetRead(eids);
		
	}

	@Override
	public void batchDelete(int[] eids) {
		dao.batchDelete(eids);
	}

	/**
	 * status默认的阅读状态:  0---全部，1----未读,2----已读
	 * orderFlag默认的排序： 0---不排序，1----按时间升序,2----按时间排序
	 */
	@Override
	public List<Email> selectByExample(Integer status, Integer orderFlag) {
		if(status ==0 && orderFlag == 0){
			
			return dao.selectByExample(null);
		}else{
			EmailExample example = new EmailExample();
			
			//阅读状态的条件处理
			if(status != 0){
				Criteria cri = example.createCriteria();
				cri.andStatusEqualTo(status);
			}
			
			if(orderFlag != 0){
				if(orderFlag == 1){
					//按时间升序
					example.setOrderByClause(" createtime asc");
				}else{
					//按时间升序
					example.setOrderByClause(" createtime desc");
				}
				
			}
			
			return dao.selectByExample(example);
		}
	}

	/*@Override
	public List<Email> selectByExample(EmailExample example) {
		return dao.selectByExample(example);
	}*/
	
	
}
