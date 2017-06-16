package com.ysnc.shopping.DAO;

import java.util.List;

import com.ysnc.shopping.order.Order;
import com.ysnc.shopping.salesitem.SalesItem;

public interface OrderDAO {
	
	public void save(Order o);

	public int getOrders(List<Order> orders, int pageNo, int pageSize);
	
	public Order loadById(int id);

	public List<SalesItem> getSalesItem(Order o);
	public int getOrdersBynUserid(List<Order> orders, int pageNo, int pageSize,int id);

}