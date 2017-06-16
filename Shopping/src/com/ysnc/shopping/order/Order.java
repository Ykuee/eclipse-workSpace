package com.ysnc.shopping.order;

import java.sql.Timestamp;
import com.ysnc.shopping.nUser;
import com.ysnc.shopping.cart.Cart;

public class Order {
	private int id;
	private int userId;
	private String Addr;
	private Timestamp odate;
	private int status;
	private nUser nuser;
	Cart cart;
	
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public Timestamp getOdate() {
		return odate;
	}
	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public nUser getNuser() {
		return nuser;
	}
	public void setNuser(nUser nuser) {
		this.nuser = nuser;
	}

}
