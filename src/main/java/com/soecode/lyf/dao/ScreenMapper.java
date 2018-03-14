package com.soecode.lyf.dao;

import java.util.List;

import com.soecode.lyf.entity.Screen;

public interface ScreenMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Screen record);

    int insertSelective(Screen record);

    Screen selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Screen record);

    int updateByPrimaryKey(Screen record);
    
    List<Screen> selectbymachineid(Integer machineid);
}