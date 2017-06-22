package com.syd.hibernate;

import com.syd.hibernate.User;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "g_article")
@Entity
public class ArticleTest {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private String content;
	/*
	 * @ManyToOne 使用此标签建立多对一关联，此属性在“多”方使用注解在我们的“一”方属性上
	 * @cascade 指定级联操作，以数组方式指定，如果只有一个，可以省略“{}”
	 * @fetch 定义抓取策略
	 * @optional 定义是否为必需属性，如果为必需（false），但在持久化时user = null,则会持久化失败
	 * @targetEntity 目标关联对象，默认为被注解属性所在类
	 */
	
	@ManyToOne(cascade ={CascadeType.ALL},fetch = FetchType.LAZY,optional = false,targetEntity = User.class)
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "ArticleTest [id=" + id + ", content=" + content + ", user=" + user + "]";
	}
	
}