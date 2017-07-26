package com.bawei.interView.mapper;

import com.bawei.interView.bean.Email;
import com.bawei.interView.bean.EmailExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface EmailMapper {
    long countByExample(EmailExample example);

    void deleteByExample(Integer sendId);

    int deleteByPrimaryKey(Integer sendId);

    int insert(Email record);

    int insertSelective(Email record);

    List<Email> selectByExample(EmailExample example);
    
    List<Email> selectByExample();

    Email selectByPrimaryKey(Integer sendId);

    int updateByExampleSelective(@Param("record") Email record, @Param("example") EmailExample example);

    int updateByExample(@Param("record") Email record, @Param("example") EmailExample example);

    int updateByPrimaryKeySelective(Email record);

    int updateByPrimaryKey(Email record);
    
    void readAll(@Param("parseInt")Integer parseInt,@Param("sendRead")Integer sendRead);
}