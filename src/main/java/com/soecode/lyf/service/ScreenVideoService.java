package com.soecode.lyf.service;

import com.soecode.lyf.entity.ScreenVideo;

public interface ScreenVideoService {
	int addScreenVideo(ScreenVideo screenVideo);
	ScreenVideo selectByscreenid(Integer screenid);
	int deleteByscreenvideoid(Integer id);

}
