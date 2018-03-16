package com.soecode.lyf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.ScreenMapper;
import com.soecode.lyf.entity.Screen;
import com.soecode.lyf.service.ScreenService;
@Service("ScreenService")
public class ScreenServiceImpl implements ScreenService {
	@Autowired
	ScreenMapper screenmapper;
	@Override
	public int insertscreen(Screen screen) {
		// TODO Auto-generated method stub
		return screenmapper.insertSelective(screen);
	}
	@Override
	public List<Screen> selectbymachineid(Integer machineid) {
		// TODO Auto-generated method stub
		return screenmapper.selectbymachineid(machineid);
	}
	@Override
	public int updatescreenbyid(Screen screen) {
		// TODO Auto-generated method stub
		return screenmapper.updateByPrimaryKeySelective(screen);
	}
	@Override
	public int deletbyscreenid(Integer id) {
		// TODO Auto-generated method stub
		return screenmapper.deleteByPrimaryKey(id);
	}

}
