package com.soecode.lyf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.GroupingMapper;
import com.soecode.lyf.entity.Grouping;
import com.soecode.lyf.service.GroupingService;
@Service("GroupingService")
public class GroupingServiceImpl implements GroupingService{
	@Autowired
	GroupingMapper  groupingMapper;
	public List<Grouping> selectAll() {
		// TODO Auto-generated method stub
		return groupingMapper.selectAll();
	}
	@Override
	public int insertgrouping(Grouping record) {
		// TODO Auto-generated method stub
		return groupingMapper.insertSelective(record);
	}
	@Override
	public int updateGrouping(Grouping grouping) {
		// TODO Auto-generated method stub
		return groupingMapper.updateByPrimaryKeySelective(grouping);
	}
	@Override
	public  List<Grouping> selectnextboxid(Integer nextboxid) {
		// TODO Auto-generated method stub
		return groupingMapper.selectbynextboxid(nextboxid);
	}
	

}
