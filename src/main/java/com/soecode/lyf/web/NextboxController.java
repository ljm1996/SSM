package com.soecode.lyf.web;


import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.entity.Nextbox;
import com.soecode.lyf.service.NextboxService;

@Controller
@RequestMapping("/nextbox")
public class NextboxController {
	 @Autowired
	 NextboxService nextboxService;
	 
	 @Autowired
	 HttpSession session;
	 
	 @RequestMapping("/insertNextbox")
	 @ResponseBody 
	 public int insertNextbox(Nextbox nextbox){
		return nextboxService.insertNextbox(nextbox);
		 
	 }
	 @RequestMapping("/selectall")
	 @ResponseBody
	 public List<Nextbox> selctAll(){
		 Admin admin = (Admin)session.getAttribute("admin");
		 return nextboxService.selectAll(admin.getId()+"");
		   
	   }
	 @RequestMapping("/updateNextbox")
	 @ResponseBody
	 public int updateNextbox(String id,String lic,Nextbox nextbox){
		return nextboxService.updateNextbox(nextbox);
		   
	   }

}
