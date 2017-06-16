package com.ysnc.shopping;

import com.ysnc.util.DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
	private static CategoryDAO service;
	
	private CategoryDAO() {}
	
	public static CategoryDAO getInstance() {
		if(service == null) {
			service = new CategoryDAO();
		}
		return service;
	}
	
	public List<Category> getTopCategories() {
		List<Category> categories = new ArrayList<Category>();
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, "select * from category where grade = 1");
		try {
			while (rs.next()) {
				Category c = this.getCategoryFromRs(rs);
				categories.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(conn);
		}
		
		return categories;
	}
	
	public List<Category> getChilds(int id) {
		List<Category> categories = new ArrayList<Category>();
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, "select * from category where pid = " + id);
		try {
			while (rs.next()) {
				Category c = this.getCategoryFromRs(rs);
				categories.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(conn);
		}
		
		return categories;
	}
	public List<Category> getCategories() {
		List<Category> categories = new ArrayList<Category>();
		Connection conn = DB.getConn();
		String sql = "select * from category order by cno";
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
				Category c = this.getCategoryFromRs(rs);
				categories.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return categories;
	}
	
	private Category getCategoryFromRs(ResultSet rs) {
		Category c = new Category();
		try {
			c.setId(rs.getInt("id"));
			c.setPid(rs.getInt("pid"));
			c.setName(rs.getString("name"));
			c.setDescr(rs.getString("descr"));
			c.setCno(rs.getInt("cno"));
			c.setGrade(rs.getInt("grade"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
public boolean delete(int id) {
	Connection conn = null;
	Statement stmt = null;
	String sql = "delete from category where id="+id;
	conn = DB.getConn();
	stmt = DB.getStmt(conn);
	try {
		stmt.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
		return true;
	}
	
	public void delete(Category c) {
		delete(c.getId());
	}

	public  void add(Category c) {
		Connection conn = DB.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.getpStmt(conn, sql);
		try {
			int cno = getNextCno(conn, c);
					
			pstmt.setInt(1, c.getPid());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getDescr());
			pstmt.setInt(4, cno);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
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

	}
	
	
	
	private  int getNextCno(Connection conn, Category c) {
		int cno = -1;
		
		String sqlMax = "select max(cno) from category where pid = " + c.getPid();
		Statement stmtMax = DB.getStmt(conn);
		ResultSet rsMax = DB.getRs(stmtMax, sqlMax);
		
		try {
			rsMax.next();
			int cnoMax = rsMax.getInt(1);
			//计算节点的基数,如用两位表示就是100，三位表示就是1000等
			int baseNumber = (int)Math.pow(10, Category.LEVEL_LENGTH);
			//构建cstr要加上的数字
			int numberToAdd = (int)Math.pow(baseNumber, Category.MAX_GRADE - c.getGrade());
			
			if(cnoMax == 0) { //要加入的节点是该父亲下面的第一个子节点
				if(c.getPid() == 0) { //最顶层节点
					cno = numberToAdd;
				} else { //其他层节点
					int parentCno = getParentCno(conn, c); //拿到父亲代表串
					cno = parentCno + numberToAdd;
				}
			} else { //加入的节点不是该父亲下面的第一个
				cno = cnoMax + numberToAdd;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsMax);
			DB.close(stmtMax);
		}
			
		return cno;
	}

	private  int getParentCno(Connection conn, Category child) {
		String sql = "select cno from category where id = " + child.getPid();
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		
		int cno = -1;
		
		try {
			rs.next();
			cno = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
		}
		return cno;
	}
	public void update(Category c) {
	int id = c.getId();
	String name = c.getName();
	String descr = c.getDescr();
		c.update(id,name,descr);
	}
	
	public void updateCategory(int id, String name, String descr) {
		
	}
	
	public Category loadById(int id) {
		Category c = null;
		Connection conn = DB.getConn();
		String sql = "select * from category where id = " + id;
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			if (rs.next()) {
				c = this.getCategoryFromRs(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return c;
	}
}
