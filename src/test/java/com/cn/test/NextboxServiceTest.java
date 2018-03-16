package com.cn.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.soecode.lyf.dao.GroupingMapper;
import com.soecode.lyf.dao.MachineMapper;
import com.soecode.lyf.dao.NextboxMapper;
import com.soecode.lyf.dao.ScreenMapper;
import com.soecode.lyf.entity.Admin;
import com.soecode.lyf.entity.Grouping;
import com.soecode.lyf.entity.Machine;
import com.soecode.lyf.entity.Nextbox;
import com.soecode.lyf.entity.Screen;

public class NextboxServiceTest extends BaseTest {
	@Autowired
	NextboxMapper ma;
	@Autowired
	MachineMapper map1;
	@Autowired
	GroupingMapper map2;
	@Autowired
	ScreenMapper map3;
	@Test 
	public void  selectnextbox(){
//		Grouping record=new Grouping();
//		record.setName("小和");
//		int i=groupingMapper.insertSelective(record);
//		System.out.println(i);
//		  List<Nextbox> list = ma.selectAll();
//		  System.out.println(list);
//		  System.out.println(ma.selectByPrimaryKey(1).getLic());
//		Machine machine=new Machine();
//		machine.setMachinecode("20");
//		machine.setMac("");
//		machine.setMachinename("机器");
//		machine.setMachinekey("123132123");
//		
//		machine.setGroupingid(2);
//		
//		int a=map1.insertSelective(machine);
//		Machine machine2=map1.selectByPrimaryKey(1);
//		System.out.println(a);
		
//		Nextbox nextbox=new Nextbox();
//		nextbox.setId(1);
//		nextbox.setLic("小花");
//		nextbox.setLan("132.33.33");
//		nextbox.setPhone("13011100");
//		int a=ma.updateByPrimaryKeySelective(nextbox);
		
//		Grouping grouping=new Grouping();
//		grouping.setId(1);
//		grouping.setName("豆瓣");
		
//		int a=map1.insertSelective(machine);
//		
//		int a=map1.coonutMachine("33");
//		Map<String, Object> map= new HashMap<String, Object>();
//		map.put("machinename", "");
//		map.put("pageSize", 0);
//		map.put("currentPage", 15);
//		List<Machine> listadmin=map1.selectMachineByName(map);
//		logger.debug("查找结果" + a);
//		logger.debug("admin结果" + listadmin);
		//System.out.println(list);
    
//		List<Machine> list=map1.selectbygroupingid(1);
//		System.out.println(list.size());
//		
//			Screen screen=new Screen();
//			screen.setId(1);
//			screen.setPix("dsf");
//			int a=map3.updateByPrimaryKeySelective(screen);
//			System.out.println(a);
		
		List<Screen> list=map3.selectbymachineid(24);
		System.out.println(list.size());
		 
		} 
}
