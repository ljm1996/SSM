package com.cn.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.soecode.lyf.dao.ScreenVideoMapper;
import com.soecode.lyf.dao.VideoMapper;
import com.soecode.lyf.entity.ScreenVideo;
import com.soecode.lyf.entity.Video;


public class VideoServiceTest extends BaseTest {
	@Autowired
	VideoMapper ma;
	@Autowired
	ScreenVideoMapper ma1;
	@Test
	public void codeinsertvideo() {
		Date day=new Date();    

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss"); 

		//System.out.println(df.format(day));
//		
////		int a=ma.totalVideo("1");
////		logger.debug("查找结果" + a);
//		ScreenVideo screenVideo=new ScreenVideo();
//		Map<String, Object> map= new HashMap<String, Object>();
//	    map.put("videoname", "");
//	    map.put("adminid", null); 
//		map.put("pageSize", 0);
//		map.put("currentPage", 5);
//		map.put("screenid", 25);
//		List<Video> list=ma.selectbyvideoid(map);
//		
//		System.out.println("video结果" + list.size());
		
//		Video video=new Video();
//		video.setVideoname("dkdk");
//		video.setVideoname("safdsd");
//		video.setVideourl("fhhghf");
//		int a1=ma.insertSelective(video);
//		System.out.println(a1);
//		
//		ScreenVideo screenVideo=ma1.selectByscreenid(24);
//		
//		//List<Video> list=ma.selectbyvideoid(videomap)
//		System.out.println(screenVideo.getVideoid());
//		
		int a =ma1.deleteByPrimaryKey(5);
		System.out.println(a);
		
	}
}
