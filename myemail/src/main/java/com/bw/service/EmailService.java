package com.bw.service;

import java.util.List;

import com.bw.bean.Email;


public interface EmailService {
	
    
    //批量设为已读
    void batchSetRead(int[] eids);
    
    //批量删除
    void batchDelete(int[] eids);
	
    //多条件查询
	List<Email> selectByExample(Integer status, Integer orderFlag);
	
}
