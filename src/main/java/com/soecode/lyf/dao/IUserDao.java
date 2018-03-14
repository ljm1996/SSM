package com.soecode.lyf.dao;  
  
import com.soecode.lyf.entity.User; 
public interface IUserDao {  
	
	    int deleteByPrimaryKey(Integer id);

	    int insert(User record);

	    int insertSelective(User record);

	    User selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(User record);

	    int updateByPrimaryKey(User record);
	    
	    User selecusertByname(String name);
	    
}  