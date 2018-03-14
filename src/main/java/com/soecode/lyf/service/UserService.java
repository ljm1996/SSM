package com.soecode.lyf.service;

import com.soecode.lyf.entity.Admin;


public interface UserService {
	public boolean login(String username,String password);
	
	public int insertAgent(Admin admin);
	
	
}
