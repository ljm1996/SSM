package com.soecode.lyf.service;

import java.util.List;
import java.util.Map;
import com.soecode.lyf.entity.Admin;

public interface AdminService {

	List<Admin> selectUserByUserName(Map<String, Object>  map);
	
	int Countadmin(String adminName);
	
	int deletbyId(int id);
	
	public int insertAgent(Admin admin);
	
	//登入
	public Admin login(String account,String password);
	//用户判断
	int updateByPrimaryKey(Admin record);
	
	int updateAdmin(Admin admin);
	

  
	
}
