package com.syd.spring.beans.cycle;

public class Car {

	private String brand;
	
	public void setBrand(String brand) {
		this.brand = brand;
	System.out.println("set brand");
	}
	
	public Car() {
		// TODO Auto-generated constructor stub
		System.out.println("car's con");
	}
	
	public void init() {
		System.out.println("car's init");
	}
	
	public void destroy() {
		System.out.println("car's destroy");
	}

	@Override
	public String toString() {
		return "Car [brand=" + brand + "]";
	}
}
