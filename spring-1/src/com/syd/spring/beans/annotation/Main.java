package com.syd.spring.beans.annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("bean-annotation.xml");
		TestObject t = (TestObject) ctx.getBean("testObject");
		System.out.println(t);
	}

}
