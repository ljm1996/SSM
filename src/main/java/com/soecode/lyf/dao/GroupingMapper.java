package com.soecode.lyf.dao;

import java.util.List;

import com.soecode.lyf.entity.Grouping;

public interface GroupingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Grouping record);

    int insertSelective(Grouping record);

    Grouping selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grouping record);

    int updateByPrimaryKey(Grouping record);
    
    List<Grouping> selectAll();
    
    List<Grouping> selectbynextboxid(Integer nextboxid);
    
    
}