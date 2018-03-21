package com.soecode.lyf.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    /**  
     * 图片下载下载功能  
     * @param request  
     * @param response  
     * @throws Exception  
     */  
	@RequestMapping("/downimg")  
    @ResponseBody
    public void downimg(Integer videoid,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		Video video=videoService.selectbyvideoid(videoid);
        String imgurl = video.getVideoimgurl().trim();  
        String imgname = imgurl.substring(imgurl.lastIndexOf("/")+1);  
        
    	//模拟文件，myfile.txt为需要下载的文件  
        String imgpath = request.getSession().getServletContext().getRealPath("imgupload")+"\\"+imgname;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(imgpath))); 
        try {
        	 System.out.println(bis);
             //假如以中文名下载的话  
             String filename = imgname;  
             //转码，免得文件名中文乱码  
             filename = URLEncoder.encode(filename,"UTF-8");  
             //设置文件下载头  
             response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
             //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
             response.setContentType("multipart/form-data");   
             BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
             int len = 0;  
             while((len = bis.read()) != -1){  
                    out.write(len); 
                     out.flush();  
                 }
                  out.close();   
		} finally {
			// TODO: handle finally clause
			bis.close();
		}
       
    } 
	 /**  
     * 视频下载功能  
     * @param request  
     * @param response  
     * @throws Exception  
     */  
	@RequestMapping("/downvideo")  
    @ResponseBody
    public void downvideo(Integer videoid,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		Video video=videoService.selectbyvideoid(videoid);
        String imgurl = video.getVideourl().trim();  
        String imgname = imgurl.substring(imgurl.lastIndexOf("/")+1);  
        
    	//模拟文件，myfile.txt为需要下载的文件  
        String imgpath = request.getSession().getServletContext().getRealPath("videoupload")+"\\"+imgname;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(imgpath))); 
        try {
        	 System.out.println(bis);
             //假如以中文名下载的话  
             String filename = imgname;  
             //转码，免得文件名中文乱码  
             filename = URLEncoder.encode(filename,"UTF-8");  
             //设置文件下载头  
             response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
             //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
             response.setContentType("multipart/form-data");   
             BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
             int len = 0;  
             while((len = bis.read()) != -1){  
                    out.write(len); 
                     out.flush();  
                 }
                  out.close();   
		} finally {
			// TODO: handle finally clause
			bis.close();
		}
       
    } 
        
    
    /**
     * 查询视频
     * @param draw
     * @param length
     * @param start
     * @param request
     * @return
     */
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
