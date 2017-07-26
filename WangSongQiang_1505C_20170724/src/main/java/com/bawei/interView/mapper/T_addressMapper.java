package com.bawei.interView.mapper;

import com.bawei.interView.bean.T_address;
import com.bawei.interView.bean.T_addressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface T_addressMapper {
	 //下拉框
    List<T_address> querySelects();
    
    long countByExample(T_addressExample example);

    int deleteByExample(T_addressExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(T_address record);

    int insertSelective(T_address record);

    List<T_address> selectByExample(T_addressExample example);

    T_address selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") T_address record, @Param("example") T_addressExample example);

    int updateByExample(@Param("record") T_address record, @Param("example") T_addressExample example);

    int updateByPrimaryKeySelective(T_address record);

    int updateByPrimaryKey(T_address record);
}