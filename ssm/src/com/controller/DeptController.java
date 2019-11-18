package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Dept;
import com.service.DeptService;

@Controller
@RequestMapping("dept")
public class DeptController {
	    @Resource
	    DeptService deptService;
	
	   @RequestMapping(value="/add",method=RequestMethod.POST)
		public String add(Dept data) {
		   deptService.add(data);
		   return "redirect:show.do";
		}
	   
	   @RequestMapping(value="/del")
	   public String del(int id) {
		   deptService.del(id);
		   return "redirect:show.do";
	   }	
	   
	   @RequestMapping(value="/show")
	   public String show(ModelMap modelMap) {
		   List all = deptService.show();
		   modelMap.addAttribute("all", all);
		   return "dept/show";
	   }
	   
	   @RequestMapping(value="/check",produces="text/html;charset=utf-8")
	   @ResponseBody
	   public String check(String name) {
		   Dept data = deptService.check(name);
		   System.out.println(name+"----"+data);
		   if(data==null) {
			   return "yes";
		   }else {
			   return "no";
		   }
	   }
	   
}
