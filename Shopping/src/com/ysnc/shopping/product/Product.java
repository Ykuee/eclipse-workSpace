package com.ysnc.shopping.product;

import java.sql.Timestamp;

import com.ysnc.shopping.Category;
import com.ysnc.shopping.DAO.ProductMysqlDAO;

public class Product {
	
	Category c;
	private int id;
	private String name;
	private String descr;
	private double normalprice;
	private double memberprice;
	private Timestamp pdate;
	private int cid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public double getNormalprice() {
		return normalprice;
	}

	public void setNormalprice(double normalprice) {
		this.normalprice = normalprice;
	}

	public double getMemberprice() {
		return memberprice;
	}

	public void setMemberprice(double memberprice) {
		this.memberprice = memberprice;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp rdate) {
		this.pdate = rdate;
	}
	public Category getC() {
		return c;
	}

	public void setC(Category c) {
		this.c = c;
	}



}
