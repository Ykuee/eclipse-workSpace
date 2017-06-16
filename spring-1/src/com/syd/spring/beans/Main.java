package com.syd.spring.beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.syd.spring.beans.HelloWorld;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		HelloWorld hw = new HelloWorld();
//		hw.setName("gengyue");
		
		//IOC容器初始化  classpathxmlapplication是 applicationcontext接口的实例化
		ApplicationContext ctx = new ClassPathXmlApplicationContext("appcon.xml");
		HelloWorld hw = (HelloWorld)ctx.getBean("HelloWorld");
		//通过类型返回IOC容器中的Bean。但必须要求bean中只有这一种类型。
		HelloWorld hw1 = (HelloWorld)ctx.getBean(HelloWorld.class);
		hw.helloWORLD();
		Card c1 = (Card) ctx.getBean("card1");
		System.out.println(c1);
		Card c2 = (Card) ctx.getBean("card2");
		System.out.println(c2);
		Person p = (Person) ctx.getBean("person");
		System.out.println(p);
	}

}
