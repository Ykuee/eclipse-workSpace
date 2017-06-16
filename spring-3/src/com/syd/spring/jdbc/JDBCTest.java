package com.syd.spring.jdbc;


import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class JDBCTest {

	private ApplicationContext ctx = null;
	private JdbcTemplate jt;
	
	{
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		jt = (JdbcTemplate) ctx.getBean("jdbcTemplate");
	}
	@Test
	public void testBatchUpdate(){
		String sql = "insert into user ";
	}
	
	@Test
	public void testUpDate(){
		String sql = "UPDATE user SET username = ? WHERE id = ?";
		jt.update(sql,"zhssz", 4);
	}
	
	@Test
	public void testDataSource() throws SQLException{
		DataSource ds = (DataSource) ctx.getBean("dataSource");
		System.out.println(ds.getConnection());
	}

}
