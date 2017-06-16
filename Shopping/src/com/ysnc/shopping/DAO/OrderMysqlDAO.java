package com.ysnc.shopping.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ysnc.shopping.nUser;
import com.ysnc.shopping.cart.Cart;
import com.ysnc.shopping.cart.CartItem;
import com.ysnc.shopping.order.Order;
import com.ysnc.shopping.product.Product;
import com.ysnc.shopping.salesitem.SalesItem;
import com.ysnc.util.DB;

public class OrderMysqlDAO implements OrderDAO {


	@Override
	public void save(Order o) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsKey = null;
		try {
			String sql = "insert into salesorder values (null, ?, ?, ?, ?)";
			conn = DB.getConn();
			conn.setAutoCommit(false);
			pstmt = DB.getpStmt(conn, sql,true);
			pstmt.setInt(1, o.getUserId());
			pstmt.setString(2, o.getAddr());
			pstmt.setTimestamp(3, o.getOdate());
			pstmt.setInt(4, o.getStatus());
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);
			
			
			String sqlItem = "insert into salesitem values (null, ?, ?, ?, ?)";
			Cart c = o.getCart();
			List<CartItem> items = c.getCart();
			PreparedStatement pStmtItem = DB.getpStmt(conn, sqlItem);
			for(int i=0; i<items.size(); i++){
				CartItem ci = items.get(i);
				pStmtItem.setInt(1, ci.getProductId());
				System.out.println(ci.getProductName());
				if(o.getUserId() == -1){
					pStmtItem.setDouble(2, ci.getProductPrice());
				}else{
					pStmtItem.setDouble(2, ci.getProductMprice());
				}
				pStmtItem.setInt(3, ci.getCount());
				pStmtItem.setInt(4, key);
				pStmtItem.executeUpdate();
			}
		
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			DB.close(pstmt);
			DB.close(rsKey);
			DB.close(conn);
		}

	}

	@Override
	public int getOrders(List<Order> orders, int pageNo, int pageSize) {

		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		Statement stmt = null;
		Statement stmtCount = null;
		int pageCount = 0;
		try {
			conn = DB.getConn();
			stmtCount = DB.getStmt(conn);
			rsCount = DB.getRs(stmtCount, "select count(*) from salesorder;");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
			stmt = DB.getStmt(conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select salesorder.id oid,salesorder.userid ouid,salesorder.addr oaddr,salesorder.odate ,salesorder.status,"
				+ "user.id uid, user.username , user.password, user.phone , user.addr uaddr , user.rdate from salesorder left join user on (salesorder.userid= user.id) limit "
				+ (pageNo - 1) * pageSize + "," + pageSize + ";";
		try {
			rs = DB.getRs(stmt, sql);
			while (rs.next()) {
				Order o = new Order();
				nUser u = new nUser(); 
				u.setAddr(rs.getString("uaddr"));
				u.setId(rs.getInt("uid"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));

				o.setId(rs.getInt("oid"));
				o.setAddr(rs.getString("oaddr"));
				o.setOdate(rs.getTimestamp("odate"));
				o.setStatus(rs.getInt("status"));
				o.setUserId(rs.getInt("ouid"));
				o.setNuser(u);
				orders.add(o);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
			DB.close(rsCount);
			DB.close(stmtCount);
		}
		return pageCount;
	}
	
	
	public Order loadById(int id){

		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		conn = DB.getConn();
		stmt= DB.getStmt(conn);
		String sql = "select salesorder.id oid,salesorder.userid ouid,salesorder.addr oaddr,salesorder.odate ,salesorder.status,"
				+ "user.id uid, user.username , user.password, user.phone , user.addr uaddr , user.rdate from salesorder "
				+ "join user on (salesorder.userid= user.id) where salesorder.id = "+id+";";
		Order o = new Order();
		try {			
			rs = DB.getRs(stmt, sql);
			while (rs.next()) {
				nUser u = new nUser(); 
				u.setAddr(rs.getString("uaddr"));
				u.setId(rs.getInt("uid"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));

				o.setId(rs.getInt("oid"));
				o.setAddr(rs.getString("oaddr"));
				o.setOdate(rs.getTimestamp("odate"));
				o.setStatus(rs.getInt("status"));
				o.setUserId(rs.getInt("ouid"));
				o.setNuser(u);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return o;
	}

	@Override
	public List<SalesItem> getSalesItem(Order o) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		conn = DB.getConn();
		stmt= DB.getStmt(conn);
		
		String sql = "select salesorder.id oid, salesorder.userid ouid, salesorder.odate, salesorder.addr oaddr, salesorder.status , " +
				 " salesitem.id itemid, salesitem.productid, salesitem.unitprice, salesitem.pcount, salesitem.orderid, " +
				 " product.id pid, product.name pname, product.descr, product.normalprice, product.memberprice, product.pdate, product.categoryid" +
				 " from salesorder "
				 + "join salesitem on (salesorder.id = salesitem.orderid)" +
				 " join product on (salesitem.productid = product.id) where salesorder.id = " + o.getId()+";";
		List<SalesItem> items = new ArrayList<SalesItem>();
		System.out.println(sql);
		try {			
			rs = DB.getRs(stmt, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setCid(rs.getInt("pid"));
				p.setCid(rs.getInt("categoryid"));
				p.setDescr(rs.getString("descr"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setName(rs.getString("pname"));
				p.setPdate(rs.getTimestamp("pdate"));
				
				SalesItem si = new SalesItem();
				si.setCount(rs.getInt("pcount"));
				si.setId(rs.getInt("itemid"));
				si.setO(o);
				si.setP(p);
				si.setUnitPrice(rs.getDouble("unitprice"));
				items.add(si);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return items;
	}
	
	public int getOrdersBynUserid(List<Order> orders, int pageNo, int pageSize,int id) {

		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		Statement stmt = null;
		Statement stmtCount = null;
		int pageCount = 0;
		try {
			conn = DB.getConn();
			stmtCount = DB.getStmt(conn);
			rsCount = DB.getRs(stmtCount, "select count(*) from salesorder;");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
			stmt = DB.getStmt(conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select salesorder.id oid,salesorder.userid ouid,salesorder.addr oaddr,salesorder.odate ,salesorder.status,"
				+ "user.id uid, user.username , user.password, user.phone , user.addr uaddr , user.rdate from salesorder "
				+ "join user on (salesorder.userid= user.id) where user.id = "+id + " limit " + (pageNo - 1) * pageSize + "," + pageSize +";";
		try {
			rs = DB.getRs(stmt, sql);
			while (rs.next()) {
				Order o = new Order();
				nUser u = new nUser(); 
				u.setAddr(rs.getString("uaddr"));
				u.setId(rs.getInt("uid"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));

				o.setId(rs.getInt("oid"));
				o.setAddr(rs.getString("oaddr"));
				o.setOdate(rs.getTimestamp("odate"));
				o.setStatus(rs.getInt("status"));
				o.setUserId(rs.getInt("ouid"));
				o.setNuser(u);
				orders.add(o);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
			DB.close(rsCount);
			DB.close(stmtCount);
		}
		return pageCount;
	}

}
