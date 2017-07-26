package com.bw.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bw.bean.Email;
import com.bw.bean.EmailExample;
import com.bw.bean.EmailExample.Criteria;
import com.bw.dao.EmailMapper;

/**
 * 1.导入spring-test的jar包
 * 2.使用ContextConfiguration注解指定spring的配置文件位置
 * 3.使用RunWith注解
 * @author Administrator
 *
 */
@RunWith(value=SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestDao {
	
	@Autowired
	private EmailMapper dao;
	
	
	//测试DAo
	@Test
	public void testDao(){
		
		/*//查询所有已读邮件
		EmailExample example = new EmailExample();
		Criteria cri = example.createCriteria();
		
		//增加约束条件
		cri.andStatusEqualTo(0);
		List<Email> list = dao.selectByExample(null);
		
		
		//遍历
		for (Email email : list) {
			System.out.println(email);
		}*/
		
		//批量设为已读
		//dao.batchSetRead(new int[]{4,5});
		
		//dao.batchDelete(new int[]{7,8});
		
		
		EmailExample example = new EmailExample();
		example.setOrderByClause(" createtime desc");
		List<Email> list = dao.selectByExample(example);
		//遍历
		for (Email email : list) {
			System.out.println(email);
		}
	}
	
	

}
