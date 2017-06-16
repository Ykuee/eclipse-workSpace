package com.ysnc.shopping.cart;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	
	private List<CartItem> cart = new ArrayList<CartItem>();
	

	public List<CartItem> getCart() {
		return cart;
	}

	public void setCart(List<CartItem> cart) {
		this.cart = cart;
	}
	
	public void addItem(CartItem ci){
		for(int i = 0; i<cart.size();i++){
			CartItem item = cart.get(i);
			if(item.getProductId()==ci.getProductId()){
				item.setCount(item.getCount()+1);
				return;
			}
		}
		cart.add(ci);
	}	
	
	public double getTotalPrice(){
		double totalPrict = 0;
		for(int i = 0; i<cart.size();i++){
			CartItem ci = cart.get(i);
			 totalPrict += ci.getTotalPrice();
		}
		return totalPrict;
	}
		
	public double getMTotalPrice(){
		double totalPrict = 0;
		for(int i = 0; i<cart.size();i++){
			CartItem ci = cart.get(i);
			 totalPrict += ci.getProductMprice()*ci.getCount();
		}
		return totalPrict;
	}
}
