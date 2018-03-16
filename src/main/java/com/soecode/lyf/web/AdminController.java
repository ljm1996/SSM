package com.soecode.lyf.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.service.AdminService;
import com.soecode.lyf.util.DataTableDataSource;


@Controller
@RequestMapping("/admin")
//在默认情况下springmvc的实例都是单例模式,所以使用scope域将其注解为每次都创建一个新的实例
@Scope("prototype")
public class AdminController {
	    @Autowired
	    AdminService adminService;
	    @Autowired
	    HttpSession session;
	    //登录界面
	    @RequestMapping("/login")
	    public String login(){
	        return "login";
	    }
	    @RequestMapping("/findagent")
	    public  @ResponseBody DataTableDataSource<Admin> inqueragent(String draw,Integer length,Integer start,HttpServletRequest request ){
	    	DataTableDataSource<Admin> adminlisTableDataSource=new DataTableDataSource<Admin>();
	    	String search= request.getParameter("search[value]");
	        int countAdmin=adminService.Countadmin(search);
	        Map<String, Object> map= new HashMap<String, Object>();
			map.put("name", search);
			map.put("pageSize", start);
			map.put("currentPage", length);
			List<Admin> listadmin=adminService.selectUserByUserName(map);
			adminlisTableDataSource.setData(listadmin);
			adminlisTableDataSource.setDraw(draw);
			adminlisTableDataSource.setRecordsFiltered(countAdmin);
			adminlisTableDataSource.setRecordsTotal(countAdmin);
			return adminlisTableDataSource;
	    }
	    
	    @RequestMapping("/updatabyId")
	    public @ResponseBody int updatabyId(Admin admin){
	    	int code=adminService.deletbyId(admin.getId());
			return code;
	    	
	    }
	    @RequestMapping("/addagent")
	    public @ResponseBody int addagent(Admin admin,String repassword,HttpServletRequest request){ 	
	    	
	    		return  adminService.insertAgent(admin);	
	    }
	   //登入
	    @RequestMapping("/checklogin")
	    public @ResponseBody int checklogin(String username,String password ,HttpServletRequest request){
	        Admin loginType = adminService.login(username,password);
	        request.getSession().setAttribute("admin", loginType); 
	        if(loginType.getIsenable()==0){
	            return 200;
	        }else if(loginType.getIsenable()==1){
	           return 100;
	        }else {
	        	return 400;
			}
	    }
	   
}
