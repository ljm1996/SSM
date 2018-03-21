package com.soecode.lyf.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.soecode.lyf.entity.Video;

public interface VideoService {
   int insertVideo(Video video);
   int totalVideo(@Param("videoname") String videoname);
   List<Video> selectByVideoName(Map<String, Object> videomap);
   List<Video> selectchosevoide(Map<String, Object> videomap);
   List<Video> selectbyvideoid(Map<String, Object> videomap);
   int deletvideoBykey(Integer id );
   Video selectbyvideoid(Integer id);
}
