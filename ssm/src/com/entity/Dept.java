package com.entity;
import java.util.*;
public class Dept {
	private int id;
	private String name;
	private String manager;
	//存储员工对应的员工
    private Set emps;
    
	public Set getEmps() {
		return emps;
	}

	public void setEmps(Set emps) {
		this.emps = emps;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
}
