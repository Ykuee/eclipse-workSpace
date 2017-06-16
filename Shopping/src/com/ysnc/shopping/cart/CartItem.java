package com.ysnc.shopping.cart;

public class CartItem {
	private int productId;
	private String productName;
	private double productPrice;
	private int count;
	private double productMprice;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public double getTotalPrice(){
		return count * productPrice;
	}
	public double getProductMprice() {
		return productMprice;
	}
	public void setProductMprice(double productMprice) {
		this.productMprice = productMprice;
	}
	
}
