package com.soecode.lyf.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.soecode.lyf.entity.Machine;
import com.soecode.lyf.service.MachineService;
import com.soecode.lyf.util.DataTableDataSource;

@Controller
@RequestMapping("/machine")
public class MachineController {
	@Autowired
	MachineService machineService;
	
	@RequestMapping("/insertmachine")
	@ResponseBody
	public int insertmachine(Machine machine,String machinename,String mac){
		return machineService.insertmachine(machine);
	}
	
	@RequestMapping("/findmachine")
	public @ResponseBody DataTableDataSource<Machine> findmachine(String draw,Integer length,Integer start,HttpServletRequest request){
		DataTableDataSource<Machine> machinelisTableDataSource=new DataTableDataSource<Machine>();
    	String search= request.getParameter("search[value]");
        int countAdmin=machineService.countmachine(search);
        Map<String, Object> map= new HashMap<String, Object>();
		map.put("machinename", search);
		map.put("pageSize", start);
		map.put("currentPage", length);
		List<Machine> listadmin=machineService.selectUserByUserName(map);
		machinelisTableDataSource.setData(listadmin);
		machinelisTableDataSource.setDraw(draw);
		machinelisTableDataSource.setRecordsFiltered(countAdmin);
		machinelisTableDataSource.setRecordsTotal(countAdmin);
		return machinelisTableDataSource;
	}
	@RequestMapping("/updatemachine")
	@ResponseBody
	public int  updatemachine(Machine machine,String machinename){
		return machineService.updateMachine(machine);
	}
	@RequestMapping("/deletbykey")
	@ResponseBody
	public int  deletbykey(Integer machineid){
		return machineService.deletbykey(machineid);
	}
	@RequestMapping("/selectbymac")
	@ResponseBody
	public List<Machine> selectbymac(String mac){
		return machineService.selectbymac(mac);   
	}
	@RequestMapping("/selectbygroupid")
	@ResponseBody
	public List<Machine> selectbygroupid(Integer groupingid){
		return machineService.selectbygroupid(groupingid);   
	}
	@RequestMapping("/updategroupidbymac")
	@ResponseBody
	public int updategroupidbymac( Machine machine,String mac,Integer groupingid){	
		return machineService.updategroupidbymac(machine);   
	}
}
