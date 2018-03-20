package com.soecode.lyf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.soecode.lyf.dao.ScreenVideoMapper;
import com.soecode.lyf.entity.ScreenVideo;
import com.soecode.lyf.service.ScreenVideoService;

@Service("ScreenVideoService")
public class ScreenVideoServiceImpl implements ScreenVideoService {
	@Autowired
	ScreenVideoMapper ScreenVideoMapper;
	@Override
	public int addScreenVideo(ScreenVideo screenVideo) {
		// TODO Auto-generated method stub
		return ScreenVideoMapper.insertSelective(screenVideo);
	}
	@Override
	public ScreenVideo selectByscreenid(Integer screenid) {
		// TODO Auto-generated method stub
		return ScreenVideoMapper.selectByscreenid(screenid);
	}
	@Override
	public int deleteByscreenvideoid(Integer id) {
		// TODO Auto-generated method stub
		return ScreenVideoMapper.deleteByPrimaryKey(id);
	}


}
