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
	
	//ע��
	@RequestMapping("/reg")
    public String reg(Userinfo data) {
		service.reg(data);
		return null;
	}
	
	@RequestMapping(value="/check",produces="text/html;charset=utf-8")
	//�ѽ��ֱ�Ӽ�����Ӧ��
	@ResponseBody
	public String check(String name) {
		Userinfo user = service.check(name);
		System.out.println(name+"\t"+user);
		if(user==null) {
			return "�û�������ʹ��!";
		}else {
		    return "�û����Ѵ���!";
		}
	}
	
}
