package com.soecode.lyf.service;

import java.util.List;

import com.soecode.lyf.entity.Screen;

public interface ScreenService {
  int insertscreen(Screen screen);
  List<Screen> selectbymachineid(Integer machineid);
  int updatescreenbyid(Screen screen);
  

}
