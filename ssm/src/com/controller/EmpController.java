package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import com.entity.*;
import com.service.*;

@Controller
@RequestMapping("/emp")
public class EmpController {
	@Autowired
	EmpService empService;
	@Autowired
	DeptService deptService;
	
	@RequestMapping("/loadDept")
	public String loadDept(ModelMap model) {
		List all  = deptService.show();
		model.addAttribute("depts", all);
		return "emp/add";
	}
	
	
	@RequestMapping(value = "/add")
	public String add(Emp data) {
		empService.add(data);
		return "redirect:/emp/show";
	}

	@RequestMapping("/{id}/del")
	public String del(@PathVariable("id") int id) {
		empService.del(id);
		return "redirect:/emp/show";
	}

	@RequestMapping("/{id}/load")
	public String load(@PathVariable("id") int id,ModelMap model) {
		Emp data = empService.loadById(id);
		model.addAttribute("record", data);
		return "emp/modify";
	}

	@RequestMapping("/update")
	public String update(Emp data) {
		empService.update(data);
		return "redirect:/emp/show";
	}

	@RequestMapping("/show")
	public String show(ModelMap model) {
		List all = empService.show();
		model.addAttribute("record", all);
		return "emp/show";
	}
	
	@RequestMapping(value="/check",produces="text/html;charset=utf-8")
	@ResponseBody
	public String check(String empno) {
		Emp data = empService.check(empno);
		System.out.println(empno+"\t"+data);
		if(data==null) {
		    return "yes";
		}else {
			return "no";
		}
	}

}
