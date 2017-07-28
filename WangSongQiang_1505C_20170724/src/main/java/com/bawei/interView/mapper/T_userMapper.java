package com.bawei.interView.mapper;

import com.bawei.interView.bean.T_user;
import com.bawei.interView.bean.T_userExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface T_userMapper {
    long countByExample(T_userExample example);

    int deleteByExample(T_userExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(T_user record);

    int insertSelective(T_user record);
    
    //查询姓名，实现用户注册功能,axaj验证用户名唯一

    T_user selectByExample(@Param("username") String username);
    
   
    //注册
     void zhuce(T_user t_user);
	   //显示
	   List<T_user> show();
    

    T_user selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") T_user record, @Param("example") T_userExample example);

    int updateByExample(@Param("record") T_user record, @Param("example") T_userExample example);

    int updateByPrimaryKeySelective(T_user record);

    int updateByPrimaryKey(T_user record);
}