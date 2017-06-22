package com.syd.springmvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/srpingmvc")
public class test {
	
	@RequestMapping("/test")
	public String test(){
		System.out.println("test");
		return "test";
	}
}
