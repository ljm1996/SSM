package com.soecode.lyf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.AdminMapper;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.service.AdminService;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	//自动注入iuserdao 用于访问数据库
	    @Autowired
	    AdminMapper adminmp; 
	    @Override
		public int Countadmin(String adminName) {
			// TODO Auto-generated method stub
			return adminmp.coonutadmin(adminName);
		}
		@Override
		public List<Admin> selectUserByUserName(Map<String, Object>  map) {
			// TODO Auto-generated method stub
			return adminmp.selectAdminByAdminName(map);
			//return  null;
		}
		@Override
		public int deletbyId(int id) {
			// TODO Auto-generated method stub
			return adminmp.deleteByPrimaryKey(id);
		}
		@Override
		public int insertAgent(Admin admin) {
			// TODO Auto-generated method stub
			int insertagent=adminmp.insertSelective(admin);
			return insertagent;
		}
		@Override
		public Admin login(String account, String password) {
			return adminmp.selectadminByaccount(account, password);
		}
		@Override
		public int updateByPrimaryKey(Admin record) {
			// TODO Auto-generated method stub
			return adminmp.updateByPrimaryKey(record);
		}
		@Override
		public int updateAdmin(Admin admin) {
			// TODO Auto-generated method stub
			return adminmp.updateByPrimaryKeySelective(admin);
		}

}
