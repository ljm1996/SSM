package com.soecode.lyf.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.soecode.lyf.entity.Video;

public interface VideoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
    
    int totalVideo(@Param("videoname") String videoname);
    
    List<Video> selectByVideoName(Map<String, Object> videomap);
    
    List<Video> selectByVideoadmin(Map<String, Object> videomap);
}