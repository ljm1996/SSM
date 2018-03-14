package com.soecode.lyf.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.soecode.lyf.entity.Admin;

public interface AdminMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    //登入
    Admin selectadminByaccount(@Param("account")String account,@Param("passwrod")String passwrod);
    
    //根据admin表的name查询所有
	List<Admin> selectAdminByAdminName(Map<String, Object> map);
	
	int coonutadmin(@Param("name") String adminName);
	
}