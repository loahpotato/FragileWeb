package cn.fragile.dao.product;

import cn.fragile.pojo.Product;

import java.sql.Connection;
import java.util.List;

public interface ProductDao {

	public int add(Connection connection, Product product)throws Exception;

	public int addPic(Connection connection, Product product)throws Exception;

	public List<Product> getProductList(Connection connection, String proName, String proCode)throws Exception;

	public List<Product> getAntiList(Connection connection, String proName, String proCode)throws Exception;

	public int deleteProductById(Connection connection, String delId)throws Exception;

	public Product getProductById(Connection connection, String id)throws Exception;

	public int modify(Connection connection, Product product)throws Exception;
}
