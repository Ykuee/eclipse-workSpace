package com.ysnc.shopping.order;

import java.util.List;

import com.ysnc.shopping.DAO.OrderDAO;
import com.ysnc.shopping.DAO.OrderMysqlDAO;
import com.ysnc.shopping.product.Product;
import com.ysnc.shopping.salesitem.SalesItem;

public class OrderMgr {
	private static OrderMgr om = null;
	static {
		if (om == null) {
			om = new OrderMgr();
			om.setDAO(new OrderMysqlDAO());
		}

	}

	public static OrderMgr getInstance() {
		return om;
	}

	private OrderMgr() {

	}

	OrderDAO dao = null;

	private void setDAO(OrderDAO dao) {
		this.dao = dao;
	}
	
	public void save(Order o){
		dao.save(o);
	}
	
	public int getOrders(List<Order> orders, int pageNo, int pageSize){
		return dao.getOrders(orders, pageNo, pageSize);
	}
	public Order loadById(int id){
		return dao.loadById(id);
	}
	public List<SalesItem> getSalesItem(Order o){
		return dao.getSalesItem(o);
	}
	public int getOrdersBynUserid(List<Order> orders, int pageNo, int pageSize,int id){
		return dao.getOrdersBynUserid(orders, pageNo, pageSize, id);
	}
}
