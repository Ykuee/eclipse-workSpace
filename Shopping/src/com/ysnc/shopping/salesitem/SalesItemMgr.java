package com.ysnc.shopping.salesitem;

import com.ysnc.shopping.DAO.SalesItemDAO;
import com.ysnc.shopping.DAO.SalesItemMysqlDAO;
import com.ysnc.shopping.order.OrderMgr;

public class SalesItemMgr {
	private static SalesItemMgr si = null;
	static {
		if (si == null) {
			si = new SalesItemMgr();
			si.setDAO(new SalesItemMysqlDAO());
		}

	}

	public static SalesItemMgr getInstance() {
		return si;
	}

	private SalesItemMgr() {

	}

	SalesItemDAO dao = null;

	private void setDAO(SalesItemDAO dao) {
		this.dao = dao;
	}
	
}
