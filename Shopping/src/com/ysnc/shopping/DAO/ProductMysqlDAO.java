package com.ysnc.shopping.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ysnc.shopping.Category;
import com.ysnc.shopping.product.Product;
import com.ysnc.util.DB;

public class ProductMysqlDAO implements ProductDAO {

	public List<Product> getProducts() {
		Connection conn = DB.getConn();
		List<Product> products = new ArrayList<Product>();

		String sql = "select * from product;";
		Statement stmt = DB.getStmt(conn);
		try {
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product p = new Product();
				p.setCid(rs.getInt("categoryid"));
				p.setDescr(rs.getString("descr"));
				p.setId(rs.getInt("id"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setName(rs.getString("name"));
				p.setPdate(rs.getTimestamp("pdate"));
				products.add(p);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return products;
	}

	public List<Product> getProducts(int pageNo, int pageSize) {
		Connection conn = DB.getConn();
		List<Product> products = new ArrayList<Product>();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select * from product limit " + (pageNo - 1) * pageSize + "," + pageSize + ";";
		Statement stmt = DB.getStmt(conn);
		try {
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product p = new Product();
				p.setCid(rs.getInt("categoryid"));
				p.setDescr(rs.getString("descr"));
				p.setId(rs.getInt("id"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setName(rs.getString("name"));
				p.setPdate(rs.getTimestamp("pdate"));
				products.add(p);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return products;

	}

	public int searchProducts(List<Product> list, int[] categoryId, String keyWord, double lowNormalPrice,
			double highNormalPrice, double lowMemberPrice, double highMemberPrice, int pageNo, int pageSize) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Statement countStmt = null;
		ResultSet countRs = null;
		int pageCount = 0;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		countStmt = DB.getStmt(conn);
		String sql = "select * from product where 1=1 ";
		String strId = "";

		if (categoryId != null && categoryId.length > 0) {
			strId = "(";
			for (int i = 0; i < categoryId.length; i++) {
				if (i < categoryId.length - 1) {
					strId += categoryId[i] + ",";
				} else {
					strId += categoryId[i];

				}
			}
			strId += ")";
			sql += " and categoryid in" + strId;
		}
		if (keyWord != null && !keyWord.trim().equals("")) {
			sql += " and name like '%" + keyWord + "%' or descr like '%" + keyWord + "%'";
		}
		if (lowNormalPrice >= 0) {
			sql += " and normalprice > " + lowNormalPrice;
		}
		if (highNormalPrice > 0) {
			sql += " and normalprice < " + highNormalPrice;
		}
		if (lowMemberPrice >= 0) {
			sql += " and memberprice > " + lowMemberPrice;
		}
		if (highMemberPrice > 0) {
			sql += " and memberprice < " + highMemberPrice;
		}

		String contSql = sql.replaceFirst("select \\*", "select count(*)");
		sql += " limit " + (pageNo - 1) * pageSize + "," + pageSize + ";";
		rs = DB.getRs(stmt, sql);
		countRs = DB.getRs(countStmt, contSql);
		try {
			countRs.next();
			pageCount = (countRs.getInt(1) + pageSize - 1) / pageSize;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setCid(rs.getInt("categoryid"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				list.add(p);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(conn);
			DB.close(stmt);
			DB.close(rs);
			DB.close(countStmt);
			DB.close(countRs);
		}
		return pageCount;
	}

	public boolean saveProduct(Product p) {
		Connection conn = DB.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "insert into product values (null, ?, ?, ?, ?, ?,?)";
		PreparedStatement pstmt = DB.getpStmt(conn, sql);
		try {

			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalprice());
			pstmt.setDouble(4, p.getMemberprice());
			pstmt.setTimestamp(5, p.getPdate());
			pstmt.setInt(6, p.getCid());
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
				return false;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(pstmt);
			DB.close(conn);
		}

		return true;
	}

	public boolean deleteProduct(int[] idArry) {
		return false;
	}

	public boolean deleteProduct(int categoryId) {
		return false;
	}

	public boolean updateProdutc(Product p) {
		return false;
	}

	@Override
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		Statement stmt = null;
		Statement stmtCount = null;
		int pageCount = 0;
		try {
			conn = DB.getConn();
			stmtCount = DB.getStmt(conn);
			rsCount = DB.getRs(stmtCount, "select count(*) from product;");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
			stmt = DB.getStmt(conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select product.id,product.name,product.descr,product.normalprice,product.memberprice,product.pdate,product.categoryid,"
				+ "category.id cid, category.pid , category.descr cdescr, category.name cname , category.cno , category.grade from product join category on (product.categoryid = category.id) limit "
				+ (pageNo - 1) * pageSize + "," + pageSize + ";";
		try {
			rs = DB.getRs(stmt, sql);
			while (rs.next()) {
				Product p = new Product();
				Category c = new Category();
				p.setCid(rs.getInt("categoryid"));
				p.setDescr(rs.getString("descr"));
				p.setId(rs.getInt("id"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setName(rs.getString("name"));
				p.setPdate(rs.getTimestamp("pdate"));
				c.setId(rs.getInt("cid"));
				c.setCno(rs.getInt("cno"));
				c.setDescr(rs.getString("cdescr"));
				c.setGrade(rs.getInt("grade"));
				c.setName(rs.getString("cname"));
				c.setPid(rs.getInt("pid"));
				p.setC(c);
				products.add(p);
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

	@Override
	public boolean upDateProduct(Product p) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		String sql = "update product set name=?,descr=?,normalprice=?,memberprice=?,categoryid=? where id =" + p.getId()
				+ ";";
		conn = DB.getConn();
		pStmt = DB.getpStmt(conn, sql);
		try {
			pStmt.setString(1, p.getName());
			pStmt.setString(2, p.getDescr());
			pStmt.setDouble(3, p.getNormalprice());
			pStmt.setDouble(4, p.getMemberprice());
			pStmt.setInt(5, p.getCid());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.close(conn);
			DB.close(pStmt);
		}
		return true;
	}

	@Override
	public List<Product> hotProductList(int count) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		String sql = "select * from product limit 0 , " + count + ";";
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
				Product p = new Product();
				p.setCid(rs.getInt("categoryid"));
				p.setDescr(rs.getString("descr"));
				p.setId(rs.getInt("id"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setName(rs.getString("name"));
				p.setPdate(rs.getTimestamp("pdate"));
				products.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.close(conn);
			DB.close(stmt);
			DB.close(rs);
			
		}
		return products;
	}

	@Override
	public Product loadById(int id) {
		Product p = new Product();
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		String sql = "select * from product where id = " + id + ";";
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			rs.next();
			p.setCid(rs.getInt("categoryid"));
			p.setDescr(rs.getString("descr"));
			p.setId(rs.getInt("id"));
			p.setMemberprice(rs.getDouble("memberprice"));
			p.setNormalprice(rs.getDouble("normalprice"));
			p.setName(rs.getString("name"));
			p.setPdate(rs.getTimestamp("pdate"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
}
