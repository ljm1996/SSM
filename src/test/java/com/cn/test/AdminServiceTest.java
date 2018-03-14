package com.cn.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.soecode.lyf.dao.AdminMapper;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.service.AdminService;

public class AdminServiceTest  extends BaseTest{
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminMapper adminMapper;
	@Test 
	  public void countadmin(){
		
       
      Admin admin=adminMapper.selectadminByaccount("admin", "123456");
      System.out.println(admin.getVer());
		
//		int a=adminMapper.coonutadmin("小花");
//		Map<String, Object> map= new HashMap<String, Object>();
//		
//		map.put("name", "");
//		map.put("pageSize", 0);
//		map.put("currentPage", 50);
//		List<Admin> listadmin=adminMapper.selectAdminByAdminName(map);
		//logger.debug("查找结果" + a);
		//logger.debug("admin结果" + listadmin);
	}
//	@Test
//	public void deletbyid(){
//        boolean admin = adminService.login("admin", "123456");
//        System.out.println(admin);
//	}
//	
	
	
}
