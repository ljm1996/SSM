package com.soecode.lyf.service;

import java.util.List;
import java.util.Map;


import com.soecode.lyf.entity.Machine;

public interface MachineService {
	int  insertmachine(Machine machine);
	int  countmachine(String machinename);
	List<Machine> selectUserByUserName(Map<String, Object>  map);
    int updateMachine(Machine machine);
    int deletbykey(Integer id);
    List<Machine> selectbymac(String Mac);
    List<Machine> selectbygroupid(Integer groupid);
    int updategroupidbymac(Machine machine);
    
}
