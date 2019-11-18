package com.dao;

import com.entity.*;
import java.util.*;
import org.springframework.stereotype.Repository;
public interface UserinfoDAO {
	void reg(Userinfo data);
	//检查用户名是否存在
	Userinfo check(String name);
}
