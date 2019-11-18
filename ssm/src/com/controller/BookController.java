package com.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.BookService;


@Controller
@RequestMapping("/book")
public class BookController {
	    @Resource
	    BookService bookService;	
	   
	   @RequestMapping(value="/show")
	   @ResponseBody
	   public List show(String name) {
		   List all = bookService.show(name);
		   return all;
	   }
	    
}
