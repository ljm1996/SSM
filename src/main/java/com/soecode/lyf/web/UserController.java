package com.soecode.lyf.web;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.service.AdminService;
import com.soecode.lyf.service.UserService;


@Controller
//@RequestMapping("/user")用于标定访问时对url位置
@RequestMapping("/user")
//在默认情况下springmvc的实例都是单例模式,所以使用scope域将其注解为每次都创建一个新的实例
@Scope("prototype")
public class UserController {
	//自动注入业务层的userService类
    @Autowired
    UserService userService;
    @Autowired
    AdminService adminService;
 
    //验证登录
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    //插入代理商
    @RequestMapping("/addagent")
    public @ResponseBody int addagent(Admin admin,String repassword,HttpServletRequest request){
    	int code=userService.insertAgent(admin);
    	if(code==1){
    		return code;
    	}
    	return 0;
    }

}
