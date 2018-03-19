package com.soecode.lyf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.VideoMapper;
import com.soecode.lyf.entity.Video;
import com.soecode.lyf.service.VideoService;

@Service("VideoService")
public class VideoServiceImpl implements VideoService {
	@Autowired
	VideoMapper videomapper;
	@Override
	public int insertVideo(Video video) {
		// TODO Auto-generated method stub
		int videocode=videomapper.insertSelective(video);
		return videocode;
	}
	@Override
	public List<Video> selectByVideoName(Map<String, Object> videomap) {
		// TODO Auto-generated method stub
		return videomapper.selectByVideoName(videomap);
	
	}
	@Override
	public int totalVideo(String videoname) {
		// TODO Auto-generated method stub
		return videomapper.totalVideo(videoname);
	}
	@Override
	public int deletvideoBykey(Integer id) {
		// TODO Auto-generated method stub
		return videomapper.deleteByPrimaryKey(id);
	}
	@Override
	public List<Video> selectchosevoide(Map<String, Object> videomap) {
		// TODO Auto-generated method stub
		return videomapper.selectchosevoide(videomap);
	}

}
