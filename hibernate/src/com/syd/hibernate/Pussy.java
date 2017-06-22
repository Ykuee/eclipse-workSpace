package com.syd.hibernate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Table(name = "t_pussy")
@Entity
public class Pussy {

	@Id
	@GenericGenerator(name = "foreignKey", strategy = "foreign", parameters = @Parameter(value = "gay", name = "property"))
	@GeneratedValue(generator = "foreignKey", strategy = GenerationType.IDENTITY) // 使用上述定义的id生成器
	private Integer id;

	private String content;
	// 如果试图不加此注解来形成单向关联，会抛出异常，
	// 因为设置了共享主键这里是否配置mapperBy放弃维护关联关系已失去作用。
	@OneToOne(cascade = CascadeType.ALL, targetEntity = Gay.class, mappedBy = "")
	@PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id") // 如果不加此注解，hibernate会在数据库默认生成一条article_id属性
	private Gay gay;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Gay getGay() {
		return gay;
	}

	public void setGay(Gay gay) {
		this.gay = gay;
	}

	@Override
	public String toString() {
		return "Pussy [id=" + id + ", content=" + content + ", gay=" + gay + "]";
	}

}
