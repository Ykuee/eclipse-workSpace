package com.ysnc.shopping.product;

import java.util.Date;
import java.util.List;

import com.ysnc.shopping.Category;
import com.ysnc.shopping.DAO.ProductDAO;
import com.ysnc.shopping.DAO.ProductMysqlDAO;

public class ProductMgr {
//	List<Product> list;
	private static ProductMgr pm = null;
	static{
		if(pm == null){
			pm = new ProductMgr();
			pm.setDAO(new ProductMysqlDAO());
		}
			
	}
	
	public static ProductMgr getInstance(){
		return pm;
	}

	private ProductMgr(){
		
	}
	
	ProductDAO dao = null;
	
	private void setDAO(ProductDAO dao) {
		this.dao = dao;
	}
	public List<Product> getProducts(){
		return dao.getProducts();
	}

	public List<Product> getProducts(int pageNo, int pageSize){
		return dao.getProducts(pageNo, pageSize);
	}
	public int getProducts(List<Product> products, int pageNo, int pageSize){
		return dao.getProducts(products, pageNo, pageSize);
	}
	
	public int searchProducts(List<Product> list,int[] categoryId,
										String keyWord,
										double lowNormalPrice,
										double highNormalPrice,
										double lowMemberPrice,
										double highMemberPrice,
										int pageNo,
										int pageSize){
		return dao.searchProducts(list,categoryId, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, pageNo, pageSize);
	}
	
	public boolean saveProduct(Product p) {
		return dao.saveProduct(p);
	}

	public void deleteProduct(int[] idArry) {
	
	}
	public void deleteProduct(int categoryId) {
	
	}

	public boolean upDateProduct(Product p) {
		return dao.upDateProduct(p);
	}
	public ProductDAO getDAO(){
		return dao;
	}
	public List<Product> hotProductList(int count){
		return dao.hotProductList(count);
	}
	public Product loadById(int id){
		return dao.loadById(id);
				
	}
}
