package com.syd.spring.beans.cycle;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String args[]){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("carslife.xml");
		Car c = (Car) ctx.getBean("car");
		System.out.println(c);
		ctx.close();
	}
}
