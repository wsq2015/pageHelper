package com.bawei.interView.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.interView.bean.Email;

public interface EmailMapperInter {
	

	    void deleteByExample(@Param("sendId") Integer sendId);
        List<Email> selectByExample();
        void readAll(@Param("parseInt")Integer parseInt,@Param("sendRead")Integer sendRead);
       //多条件查询
		List<Email> selectByExample(Integer status, Integer orderFlag);


}
