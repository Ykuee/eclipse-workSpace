package com.syd.hibernate;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_gay")
public class Gay {
	@Id
	@GeneratedValue(generator = "incrementGenerator", strategy = GenerationType.IDENTITY)
	@GenericGenerator(name = "incrementGenerator", strategy = "increment")
	private Integer id;

	private String name;
	private LocalDateTime birth;

	@OneToOne(cascade = CascadeType.ALL, targetEntity = Pussy.class)
	@PrimaryKeyJoinColumn
	private Pussy pussy;

	public Integer getId() {
		return id;
	}

	public Gay(Integer id, String name, LocalDateTime birth, Pussy pussy) {
		super();
		this.id = id;
		this.name = name;
		this.birth = birth;
		this.pussy = pussy;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getBirth() {
		return birth;
	}

	public void setBirth(LocalDateTime birth) {
		this.birth = birth;
	}

	public Pussy getPussy() {
		return pussy;
	}

	public void setPussy(Pussy pussy) {
		this.pussy = pussy;
	}

	@Override
	public String toString() {
		return "Gay [id=" + id + ", name=" + name + ", birth=" + birth + ", pussy=" + pussy + "]";
	}
}
