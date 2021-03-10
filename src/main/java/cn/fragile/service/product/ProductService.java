package cn.fragile.service.product;

import cn.fragile.pojo.Product;

import java.util.List;

public interface ProductService {
	public boolean add(Product product);

	public boolean addPic(Product product);

	public List<Product> getProductList(String proName, String proCode);

	public List<Product> getAntiList(String proName, String proCode);

	public int deleteProductById(String delId);

	public Product getProductById(String id);

	public boolean modify(Product product);
}
