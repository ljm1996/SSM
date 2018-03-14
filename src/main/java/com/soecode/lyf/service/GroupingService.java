package com.soecode.lyf.service;

import java.util.List;

import com.soecode.lyf.entity.Grouping;

public interface GroupingService {
	
	 int insertgrouping(Grouping record);
	 
	 List<Grouping> selectAll();
	 
	 int updateGrouping(Grouping grouping);
	 
	 List<Grouping> selectnextboxid(Integer nextboxid);

}
