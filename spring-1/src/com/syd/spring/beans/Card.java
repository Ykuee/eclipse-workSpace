package com.syd.spring.beans;

public class Card {
	private int chang;
	private double kuan;
	private String name;
	private String sex;
	

	public Card(int chang, String name, String sex) {
		super();
		this.chang = chang;
		this.name = name;
		this.sex = sex;
	}


	public Card(double kuan, String name, String sex) {
		super();
		this.kuan = kuan;
		this.name = name;
		this.sex = sex;
	}


	@Override
	public String toString() {
		return "Card [chang=" + chang + ", kuan=" + kuan + ", name=" + name + ", sex=" + sex + "]";
	}


	public Card() {
		super();
	}
	
}
