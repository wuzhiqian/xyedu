package com.service;

import com.dao.BookDAO;
import com.entity.Book;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	@Resource
	BookDAO bookDAO;

	
	public List show(String name) {
		List all = bookDAO.show(name);
		return all;
	}

}
