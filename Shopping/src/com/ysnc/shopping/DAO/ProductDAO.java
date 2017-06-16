package com.ysnc.shopping.DAO;

import java.util.Date;
import java.util.List;

import com.ysnc.shopping.Category;
import com.ysnc.shopping.product.Product;

public interface ProductDAO {
	public List<Product> getProducts();

	public List<Product> getProducts(int pageNo, int pageSize);

	public int  searchProducts(List<Product> list,int[] categoryId, 
										String keyWord,
										double lowNormalPrice,
										double highNormalPrice, 
										double lowMemberPrice,
										double highMemberPrice, 
										int pageNo, 
										int pageSize);

	public boolean saveProduct(Product p);

	public boolean deleteProduct(int[] idArry);

	public boolean deleteProduct(int categoryId);

	public boolean upDateProduct(Product p);
	
	public List<Product> hotProductList(int count);
	
	public Product loadById(int id);
	
	public int getProducts(List<Product> products, int pageNo, int pageSize);
	
}
