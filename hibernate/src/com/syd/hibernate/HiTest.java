package com.syd.hibernate;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

import com.syd.hibernate.Article;
import com.syd.hibernate.User;
import com.syd.hibernate.ArticleTest;
import com.syd.hibernate.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HiTest {
	private ApplicationContext ac;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;

	@BeforeClass // 在测试类初始化时调用此方法，完成静态对象的初始化
	public static void before() {
	}

	@Before
	public void setup() {
		ac = new ClassPathXmlApplicationContext("spring.xml");
		sessionFactory = (SessionFactory) ac.getBean("sessionFactory");
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		/*
		 * final StandardServiceRegistry standardServiceRegistry = new
		 * StandardServiceRegistryBuilder() .configure("spring.xml").build();
		 * SessionFactory sessionFactory = new
		 * MetadataSources(standardServiceRegistry).buildMetadata()
		 * .buildSessionFactory();
		 */

	}

	@Test
	public void test1() {
		User user = new User();
		user.setName("gengge");
		user.setDate(LocalDate.now());
		user.setTime(LocalTime.now());
		user.setDateTime(LocalDateTime.now());
		session.save(user);
		// articleTest at = new articleTest();
		// at.setName("good");

		// session.save(at);
		// transaction.commit();

	}

	@Test
	public void testSession() {
		User user = session.get(User.class, 1);
		System.out.println(user);
		user.setName("shit");
	}

	// 测试一对多
	@Test
	public void testttt() {
		User user = new User();
		user.setName("ggengg");
		user.setDate(LocalDate.now());
		user.setTime(LocalTime.now());
		user.setDateTime(LocalDateTime.now());
		Set<Article> articles = new HashSet<Article>();
		for (int i = 0; i < 3; i++) {// 添加三篇文章
			Article article = new Article();
			article.setContent("moreContent" + i);
			articles.add(article);
		}
		user.setArticles(articles);
		session.save(user);
	}

	@Test
	public void testDelete() {
		User user = session.get(User.class, 12);
		session.delete(user);
	}

	@Test
	public void delete() {
		for (int i = 1; i < 20; i++) {
			System.out.println(i);
			User user = session.get(User.class, i);
			session.delete(user);
		}
	}

	@Test
	public void test3() {
		User user = new User();
		user.setName("name1");
		user.setDate(LocalDate.now());
		user.setTime(LocalTime.now());
		user.setDateTime(LocalDateTime.now());
		ArticleTest articleTest = new ArticleTest();
		articleTest.setContent("test");
		;
		articleTest.setUser(user);
		session.save(articleTest);// 注意这里我们没有保存我们的user对象
		System.out.println(articleTest);
	}

	@Test
	public void test4() {
		Boy boy = new Boy();
		boy.setName("yk");
		Dog dog = new Dog();
		dog.setContent("good");
		dog.setBoy(boy);
		session.save(dog);// 注意这里我们没有保存我们的user对象
		System.out.println(dog);
	}

	@Test//一对一共享主键
	public void test5() {
		Gay gay = new Gay();
		gay.setName("ssss");
		gay.setBirth(LocalDateTime.now());
		Pussy pussy = new Pussy();
		pussy.setContent("Im a shity pussy");
		gay.setPussy(pussy);
		System.out.println(gay + "-==-" + pussy);
		pussy.setGay(gay);
		session.save(gay);
	}

	@After
	public void destroy() {
		if (transaction.isActive()) {// 如果当前事务尚未提交，则
			transaction.commit();// 提交事务，主要为了防止在测试中已提交事务，这里又重复提交
		}
		session.clear();
		session.close();
		sessionFactory.close();
	}

	@After
	public void after() {

	}

}
