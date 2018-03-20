package com.soecode.lyf.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.entity.Video;
import com.soecode.lyf.service.VideoService;
import com.soecode.lyf.util.DataTableDataSource;


@Controller
@RequestMapping("/video")
public class VideoController{
	@Autowired
	VideoService videoService;
	@Autowired
	HttpSession session;

	 /**  
     * 视屏上传  
     * @param file  
     * @return  
     * @throws IOException   
     */
    @RequestMapping(value="/upload",method=RequestMethod.POST)  
    @ResponseBody  
    public int upload(MultipartFile videoaddress,MultipartFile videoimg,String videoname,HttpServletRequest request) throws IOException{  
    	//设置图片和视屏的命名
		Date day=new Date();  
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String filname = df.format(day);
		
    	//部署到Tomcat地址
    	String thepath="http://localhost:8081/SSM/";
    	//视屏上传
    	String path = request.getSession().getServletContext().getRealPath("videoupload"); 
        String fileaddress = videoaddress.getOriginalFilename(); 
        String prefix=fileaddress.substring(fileaddress.lastIndexOf(".")+1);
        String newaddrassname = filname + "." + prefix;
        String addresspath1=thepath+"videoupload/"+newaddrassname;
        File dir = new File(path,newaddrassname);          
        if(!dir.exists()){  
            dir.mkdirs();  
        } 
        
        //图片上传的地址
        String path2 = request.getSession().getServletContext().getRealPath("imgupload"); 
        String fileimg = videoimg.getOriginalFilename(); 
        String prefiximg=fileimg.substring(fileimg.lastIndexOf(".")+1);
        String newimgStringname = filname + "." + prefiximg;
        String imgpath2=thepath+"imgupload/"+newimgStringname;
        File dir2 = new File(path2,newimgStringname);    
        if(!dir2.exists()){  
            dir2.mkdirs();  
        }  
        //MultipartFile自带的解析方法  
        videoaddress.transferTo(dir);  
        videoimg.transferTo(dir2);  
        
        Admin admin=(Admin)session.getAttribute("admin");
        
        //把地址存到数据库中
        Video video=new Video();
        video.setVideoname(videoname);
        video.setVideourl(addresspath1);
        video.setVideoimgurl(imgpath2);
        video.setAdminid(admin.getId()+"");
        	
        int pathcode=videoService.insertVideo(video) ;
        
        return pathcode;  
    } 
    @RequestMapping("/findvideo")
    @ResponseBody
    public DataTableDataSource<Video> inquervideo(String draw,Integer length,Integer start,HttpServletRequest request){
    	DataTableDataSource<Video> adminlisTableDataSource=new DataTableDataSource<Video>();
    	String search= request.getParameter("search[value]");
        int countAdmin=videoService.totalVideo(search);
        
        Admin admin=(Admin)session.getAttribute("admin");
        String adminid=admin.getId()+"";
        if(admin.getType()==1){
	        Map<String, Object> videomap= new HashMap<String, Object>();
	        videomap.put("videoname", search);
	        videomap.put("adminid", null);
	        videomap.put("pageSize", start);
	        videomap.put("currentPage", length);
			List<Video> listadmin=videoService.selectByVideoName(videomap);
			adminlisTableDataSource.setData(listadmin);
			adminlisTableDataSource.setDraw(draw);
			adminlisTableDataSource.setRecordsFiltered(countAdmin);
			adminlisTableDataSource.setRecordsTotal(countAdmin);
        }else if (admin.getType()==2) {
        	Map<String, Object> videomap= new HashMap<String, Object>();
 	        videomap.put("videoname", search);
 	        videomap.put("adminid", adminid);
 	        videomap.put("pageSize", start);
 	        videomap.put("currentPage", length);
 			List<Video> listadmin=videoService.selectByVideoName(videomap);
 			adminlisTableDataSource.setData(listadmin);
 			adminlisTableDataSource.setDraw(draw);
 			adminlisTableDataSource.setRecordsFiltered(countAdmin);
 			adminlisTableDataSource.setRecordsTotal(countAdmin);
		}
        
		return adminlisTableDataSource;
    }
    @RequestMapping("/deletbykey")
    @ResponseBody
    public int deletBykey(Integer id){
		return videoService.deletvideoBykey(id);
    	    	
    }
    @RequestMapping("/chosevoide")
    @ResponseBody
    public DataTableDataSource<Video> chosevoide (String draw,Integer length,Integer start,HttpServletRequest request){
    	DataTableDataSource<Video> adminlisTableDataSource=new DataTableDataSource<Video>();
    	String search= request.getParameter("search[value]");
        int countAdmin=videoService.totalVideo(search);
        
        Admin admin=(Admin)session.getAttribute("admin");
        String adminid=admin.getId()+"";
         if (admin.getType()==2) {
        	Map<String, Object> videomap= new HashMap<String, Object>();
 	        videomap.put("videoname", search);
 	        videomap.put("adminid", adminid);
 	        videomap.put("pageSize", start);
 	        videomap.put("currentPage", length);
 			List<Video> listadmin=videoService.selectchosevoide(videomap);
 			adminlisTableDataSource.setData(listadmin);
 			adminlisTableDataSource.setDraw(draw);
 			adminlisTableDataSource.setRecordsFiltered(countAdmin);
 			adminlisTableDataSource.setRecordsTotal(countAdmin);
		}else if(admin.getType()==1){
			Map<String, Object> videomap= new HashMap<String, Object>();
 	        videomap.put("videoname", search);
 	        videomap.put("adminid", adminid);
 	        videomap.put("pageSize", start);
 	        videomap.put("currentPage", length);
 			List<Video> listadmin=videoService.selectchosevoide(videomap);
 			adminlisTableDataSource.setData(listadmin);
 			adminlisTableDataSource.setDraw(draw);
 			adminlisTableDataSource.setRecordsFiltered(countAdmin);
 			adminlisTableDataSource.setRecordsTotal(countAdmin);
			
		}
		return adminlisTableDataSource;
    	    	
    }
    
}
