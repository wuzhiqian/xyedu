package com.dao;

import com.entity.*;
import java.util.*;
import org.springframework.stereotype.Repository;
public interface UserinfoDAO {
	void reg(Userinfo data);
	//����û����Ƿ����
	Userinfo check(String name);
}
