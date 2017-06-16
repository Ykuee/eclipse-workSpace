package com.syd.spring.beans;

import com.syd.spring.beans.Card;

public class Person {
	private String name;
	private int age;
	private Card card;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Card getCard() {
		return card;
	}
	public void setCard(Card card) {
		this.card = card;
	}
	
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", card=" + card + "]";
	}
	
}
