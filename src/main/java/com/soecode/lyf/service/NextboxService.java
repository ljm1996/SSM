package com.soecode.lyf.service;



import java.util.List;
import com.soecode.lyf.entity.Nextbox;

public interface NextboxService {
	
	int insertNextbox(Nextbox nextbox);
	
	List<Nextbox> selectAll(String adminid);
	
	int updateNextbox(Nextbox nextbox);
	
	int deletByboxkey(Integer id);

}
