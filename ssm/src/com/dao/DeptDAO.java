package com.dao;

import com.entity.*;
import java.util.*;
import org.springframework.stereotype.Repository;
public interface DeptDAO {
	void add(Dept data);
	void del(int id);
	Dept load(int id);
	void update(Dept data);
	List show();
	Dept check(String name);
}
