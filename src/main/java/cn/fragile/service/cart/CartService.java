package cn.fragile.service.cart;

import cn.fragile.pojo.Product;
import cn.fragile.pojo.Cart;

import java.sql.Connection;
import java.util.List;

public interface CartService {

	public boolean add(Cart cart);

	public List<Cart> getCartList(String proName);

	public boolean deleteCartById(String delId);

	public Product getProductById(String id);
}
