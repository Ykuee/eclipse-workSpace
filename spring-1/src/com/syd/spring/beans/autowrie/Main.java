package com.syd.spring.beans.autowrie;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String args[]){
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beansautowrie.xml");
		Person p = (Person) ctx.getBean("person");
		System.out.println(p);
		Car c = (Car) ctx.getBean("car");
		System.out.println(c);
	} 
}
