package com.soecode.lyf.dao;

import java.util.List;
import java.util.Map;
import com.soecode.lyf.entity.Machine;

public interface MachineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Machine record);

    int insertSelective(Machine record);

    Machine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Machine record);

    int updateByPrimaryKey(Machine record);
    
    List<Machine> selectMachineByName(Map<String, Object> map);
	
	int coonutMachine(String mashinename);
    
	List<Machine> selectbymac(String Mac);
	
	List<Machine> selectbygroupingid(Integer groupingid);
	
	int updategroupidbymac(Machine record);
	
	
    
}