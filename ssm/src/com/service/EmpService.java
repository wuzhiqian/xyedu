package com.service;

import com.dao.EmpDAO;
import com.entity.Emp;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class EmpService {
	@Resource
	EmpDAO empDAO;

	public void add(Emp data) {
		empDAO.add(data);
	}

	public void del(int id) {
		empDAO.del(id);
	}

	public Emp loadById(int id) {
		Emp data = empDAO.load(id);
		return data;
	}

	public void update(Emp data) {
		empDAO.update(data);
	}

	public List show() {
		List all = empDAO.show();
		return all;
	}
	
	public Emp check(String empno) {
		Emp data = empDAO.check(empno);
		return data;
	}

}
