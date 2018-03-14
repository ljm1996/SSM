package com.soecode.lyf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soecode.lyf.dao.MachineMapper;
import com.soecode.lyf.entity.Machine;
import com.soecode.lyf.service.MachineService;

@Service("MachineService")
public class MachineServiceImpl implements MachineService {
	@Autowired
	MachineMapper machienmap;
	@Override
	public int insertmachine(Machine machine) {
		// TODO Auto-generated method stub
		return machienmap.insertSelective(machine);
	}
	@Override
	public List<Machine> selectUserByUserName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return machienmap.selectMachineByName(map);
	}
	@Override
	public int countmachine(String machinename) {
		// TODO Auto-generated method stub
		return machienmap.coonutMachine(machinename);
	}
	@Override
	public int updateMachine(Machine machine) {
		// TODO Auto-generated method stub
		return machienmap.updateByPrimaryKeySelective(machine);
	}
	@Override
	public int deletbykey(Integer id) {
		// TODO Auto-generated method stub
		return machienmap.deleteByPrimaryKey(id);
	}
	@Override
	public List<Machine> selectbymac(String Mac) {
		// TODO Auto-generated method stub
		return machienmap.selectbymac(Mac);
	}
	@Override
	public List<Machine> selectbygroupid(Integer groupid) {
		// TODO Auto-generated method stub
		return machienmap.selectbygroupingid(groupid);
	}
	@Override
	public int updategroupidbymac(Machine machine) {
		// TODO Auto-generated method stub
		return machienmap.updategroupidbymac(machine);
	}
	
	

}
