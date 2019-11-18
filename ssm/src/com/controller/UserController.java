package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Userinfo;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	UserService service;
	
	//注册
	@RequestMapping("/reg")
    public String reg(Userinfo data) {
		service.reg(data);
		return null;
	}
	
	@RequestMapping(value="/check",produces="text/html;charset=utf-8")
	//把结果直接加入响应中
	@ResponseBody
	public String check(String name) {
		Userinfo user = service.check(name);
		System.out.println(name+"\t"+user);
		if(user==null) {
			return "用户名可以使用!";
		}else {
		    return "用户名已存在!";
		}
	}
	
}
