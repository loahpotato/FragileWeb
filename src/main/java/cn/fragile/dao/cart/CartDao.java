package cn.fragile.dao.cart;

import cn.fragile.pojo.Bill;
import cn.fragile.pojo.Cart;
import cn.fragile.pojo.Product;

import java.sql.Connection;
import java.util.List;

public interface CartDao {

	public int add(Connection connection, Cart cart)throws Exception;

	public List<Cart> getCartList(Connection connection, String proName)throws Exception;

	public int deleteProductById(Connection connection, String delId)throws Exception;

	public Product getProductById(Connection connection, String id)throws Exception;

}
