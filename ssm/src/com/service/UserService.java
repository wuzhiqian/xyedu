package com.service;

import com.dao.UserinfoDAO;
import com.entity.Userinfo;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class UserService {
	@Resource
	UserinfoDAO userDAO;

	public void reg(Userinfo data) {
		userDAO.reg(data);
	}

	
	public Userinfo check(String name) {
		Userinfo data = userDAO.check(name);
		return data;
	}

}
