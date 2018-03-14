package com.soecode.lyf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.soecode.lyf.dao.NextboxMapper;
import com.soecode.lyf.entity.Nextbox;
import com.soecode.lyf.service.NextboxService;

@Service("NextboxService")
public class NextboxServiceImpl implements NextboxService {
	@Autowired
	NextboxMapper nextboxmap;

	@Override
	public int insertNextbox(Nextbox nextbox) {
		// TODO Auto-generated method stub
		return nextboxmap.insertSelective(nextbox);
	}

	@Override
	public List<Nextbox> selectAll(String adminid) {
		// TODO Auto-generated method stub
		return nextboxmap.selectAll(adminid);
	}

	@Override
	public int updateNextbox(Nextbox nextbox) {
		// TODO Auto-generated method stub
		return nextboxmap.updateByPrimaryKeySelective(nextbox);
	}

	@Override
	public int deletByboxkey(Integer id) {
		// TODO Auto-generated method stub
		return nextboxmap.deleteByPrimaryKey(id);
	}

}
