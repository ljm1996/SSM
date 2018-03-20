package com.soecode.lyf.dao;

import com.soecode.lyf.entity.ScreenVideo;

public interface ScreenVideoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ScreenVideo record);

    int insertSelective(ScreenVideo record);

    ScreenVideo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ScreenVideo record);

    int updateByPrimaryKey(ScreenVideo record);
    
    ScreenVideo selectByscreenid(Integer screenid);
}