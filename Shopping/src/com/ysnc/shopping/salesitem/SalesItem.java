package com.ysnc.shopping.salesitem;

import com.ysnc.shopping.order.Order;
import com.ysnc.shopping.product.Product;

public class SalesItem {
	private int id;
	private double unitPrice;
	private int count;
	private Product p;
	private Order o;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	public Order getO() {
		return o;
	}
	public void setO(Order o) {
		this.o = o;
	}

}
