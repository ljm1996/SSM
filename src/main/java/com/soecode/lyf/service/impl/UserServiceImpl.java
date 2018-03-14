package com.soecode.lyf.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.AdminMapper;
import com.soecode.lyf.dao.IUserDao;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.entity.User;
import com.soecode.lyf.service.UserService;

//@Service("UserService") 注解用于标示此类为业务层组件,在使用时会被注解的类会自动由
//spring进行注入,无需我们创建实例
@Service("UserService")
public class UserServiceImpl implements UserService {
	//自动注入iuserdao 用于访问数据库
    @Resource
    IUserDao userDao;
    @Resource
    AdminMapper adminmp;
	@Override
	public boolean login(String username, String password) {
		// TODO Auto-generated method stub
		 User user = userDao.selecusertByname(username);
		 if(user!=null){
	            if (user.getName().equals(username)&&user.getPassword().equals(password)){
	                return true;
	            }
	        }
	        return false;
	}
	@Override
	public int insertAgent(Admin admin) {
		// TODO Auto-generated method stub
		int insertagent=adminmp.insertSelective(admin);
		return insertagent;
	}
}
