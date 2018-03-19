package com.soecode.lyf.dao;


import java.util.List;
import com.soecode.lyf.entity.Nextbox;

public interface NextboxMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Nextbox record);

    Nextbox selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Nextbox record);

    int updateByPrimaryKey(Nextbox record);

    List<Nextbox> selectAll(String adminid);
    
    List<Nextbox> selectByadid(String adminid);
    

    
}