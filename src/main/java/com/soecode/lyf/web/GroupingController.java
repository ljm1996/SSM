package com.soecode.lyf.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soecode.lyf.entity.Grouping;
import com.soecode.lyf.service.GroupingService;

@Controller
@RequestMapping("/grouping")
public class GroupingController {
   @Autowired
   GroupingService groupingService;
   
   @RequestMapping("/insertgrouping")
   @ResponseBody   
   public int insertGrouping(Grouping grouprecord,String name,String getidnextbox,String id){
	return groupingService.insertgrouping(grouprecord);
	   
   }
   @RequestMapping("/selectall")
   @ResponseBody
   public List<Grouping> selctAll(){
	return groupingService.selectAll();
	   
   }
   @RequestMapping("/updategrouping")
   @ResponseBody
   public int updateGrouping(Grouping grouping){
	return groupingService.updateGrouping(grouping);
	   
   }
   @RequestMapping("/selectbyboxid")
   @ResponseBody
   public List<Grouping> selectbyboxid(Integer id){
	return groupingService.selectnextboxid(id);
	   
   }
}
