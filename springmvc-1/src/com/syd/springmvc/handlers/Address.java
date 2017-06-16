package com.syd.springmvc.handlers;

public class Address {
	private String city;
	private String guo;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGuo() {
		return guo;
	}

	public void setGuo(String guo) {
		this.guo = guo;
	}

	@Override
	public String toString() {
		return "Address [city=" + city + ", guo=" + guo + "]";
	}
}
