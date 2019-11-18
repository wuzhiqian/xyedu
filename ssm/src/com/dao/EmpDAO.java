package com.dao;
import java.util.List;
import com.entity.Emp;

public interface EmpDAO {
	void add(Emp data);
	void del(int id);
	Emp load(int id);
	void update(Emp data);
	List show();
	Emp check(String empno);
}
