package com.soecode.lyf.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soecode.lyf.entity.Screen;
import com.soecode.lyf.service.ScreenService;

@Controller
@RequestMapping("/screen")
@Scope("prototype")
public class ScreenController {
	@Autowired
	ScreenService screenService;
	
	@RequestMapping("/addscreen")
	@ResponseBody
	public int addscreen(Screen screen,Integer machineid,String pix){
		return screenService.insertscreen(screen);
		
	}
	@RequestMapping("/selectbymachienid")
	@ResponseBody
	public List<Screen> selectbymachine(Integer machineid){
		return screenService.selectbymachineid(machineid);
		
	}
	@RequestMapping("/updatescreenbyid")
	@ResponseBody
	public int updatescreenbyid(Screen screen,Integer screenid,String pix){
		return screenService.updatescreenbyid(screen);
		
	}
	

}
