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
import com.soecode.lyf.entity.ScreenVideo;
import com.soecode.lyf.entity.Video;
import com.soecode.lyf.service.ScreenVideoService;
import com.soecode.lyf.service.VideoService;
import com.soecode.lyf.util.DataTableDataSource;

@Controller
@Scope("prototype")
@RequestMapping("/screenvideo")
public class ScreenVideoController {
	@Autowired
	ScreenVideoService screenVideoService;
	@Autowired
	VideoService videoService;
	@Autowired
	HttpSession session;
	@RequestMapping("/inserscreenvideo")
	@ResponseBody
	public int addscreenvideo(ScreenVideo screenVideo,Integer screenid,Integer videoid){
		return screenVideoService.addScreenVideo(screenVideo);
	}
	
	@RequestMapping("/selectbyscreenid")
	@ResponseBody
	public DataTableDataSource<Video> addscreenvideo(String draw,Integer length,Integer start,Integer screenid,HttpServletRequest request){
		DataTableDataSource<Video> adminlisTableDataSource=new DataTableDataSource<Video>();
    	String search= request.getParameter("search[value]");
        int countAdmin=videoService.totalVideo(search);
        Map<String, Object> videomap= new HashMap<String, Object>();
 	    videomap.put("videoname", search);
 	    videomap.put("adminid", null);
 	    videomap.put("pageSize", start);
 	    videomap.put("currentPage", length);
 	    videomap.put("screenid", screenid);
 	    List<Video> listadmin=videoService.selectbyvideoid(videomap);
 		adminlisTableDataSource.setData(listadmin);
 		adminlisTableDataSource.setDraw(draw);
 		adminlisTableDataSource.setRecordsFiltered(countAdmin);
		return adminlisTableDataSource;
    	    	
    } 
	@RequestMapping("/deletbyscreenid")
	@ResponseBody
	public int deletbyscreenvideoid(Integer screenvideoid){
		return screenVideoService.deleteByscreenvideoid(screenvideoid);
	}
}
