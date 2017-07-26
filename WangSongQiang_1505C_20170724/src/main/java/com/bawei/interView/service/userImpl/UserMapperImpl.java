package com.bawei.interView.service.userImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bawei.interView.bean.T_address;
import com.bawei.interView.bean.T_user;
import com.bawei.interView.bean.T_userExample;
import com.bawei.interView.mapper.T_addressMapper;
import com.bawei.interView.mapper.T_userMapper;

@Service
@Transactional(readOnly=true)
public class UserMapperImpl implements UserMapperInter {

	@Autowired
	private T_userMapper t_userMapper;
	@Autowired
	private T_addressMapper t_addressMapper;
	
	@Override
	public long countByExample(T_userExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(T_userExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(T_user record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(T_user record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public T_user selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByExampleSelective(T_user record, T_userExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(T_user record, T_userExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(T_user record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(T_user record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public T_user selectByExample(String username) {
		// TODO Auto-generated method stub
		return t_userMapper.selectByExample(username);
	}
	@Transactional(readOnly=false)
	@Override
	public void zhuce(T_user t_user) {
		// TODO Auto-generated method stub
		t_userMapper.zhuce(t_user);
		
	}

	@Override
	public List<T_user> show() {
		// TODO Auto-generated method stub
		return t_userMapper.show();
	}

	@Override
	public  List<T_address> querySelects() {
		// TODO Auto-generated method stub
		return t_addressMapper.querySelects();
	}

}
