package com.service;

import com.dao.DeptDAO;
import com.entity.Dept;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class DeptService {
	@Resource
	DeptDAO deptDAO;

	public void add(Dept data) {
		deptDAO.add(data);
	}

	public void del(int id) {
		deptDAO.del(id);
	}

	public Dept loadById(int id) {
		Dept data = deptDAO.load(id);
		return data;
	}

	public void update(Dept data) {
		deptDAO.update(data);
	}

	public List show() {
		List all = deptDAO.show();
		return all;
	}

	public Dept check(String name) {
		Dept all = deptDAO.check(name);
		return all;
	}
	
}
