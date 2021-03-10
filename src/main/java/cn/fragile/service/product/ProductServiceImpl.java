package cn.fragile.service.product;

import cn.fragile.dao.BaseDao;
import cn.fragile.dao.bill.BillDao;
import cn.fragile.dao.bill.BillDaoImpl;
import cn.fragile.dao.cart.CartDao;
import cn.fragile.dao.cart.CartDaoImpl;
import cn.fragile.dao.product.ProductDao;
import cn.fragile.dao.product.ProductDaoImpl;
import cn.fragile.pojo.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;
	private BillDao  billDao;
	private CartDao cartDao;
	public ProductServiceImpl(){
		productDao = new ProductDaoImpl();
		billDao = new BillDaoImpl();
		cartDao = new CartDaoImpl();
	}
	@Override
	public boolean add(Product product) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection connection = null;
		try {
			connection = BaseDao.getConnection();
			connection.setAutoCommit(false);
			if(productDao.add(connection, product) > 0)
				flag = true;
			connection.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				System.out.println("rollback==================");
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}



	@Override
	public boolean addPic(Product product) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection connection = null;
		try {
			connection = BaseDao.getConnection();
			connection.setAutoCommit(false);
			if(productDao.addPic(connection, product) > 0)
				flag = true;
			connection.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				System.out.println("rollback==================");
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}




	@Override
	public List<Product> getProductList(String proName, String proCode) {
		// TODO Auto-generated method stub
		Connection connection = null;
		List<Product> productList = null;
		System.out.println("query proName ---- > " + proName);
		System.out.println("query proCode ---- > " + proCode);
		try {
			connection = BaseDao.getConnection();
			productList = productDao.getProductList(connection, proName,proCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return productList;
	}


	@Override
	public List<Product> getAntiList(String proName, String proCode) {
		// TODO Auto-generated method stub
		Connection connection = null;
		List<Product> productAntiList = null;
		System.out.println("query proName ---- > " + proName);
		System.out.println("query proCode ---- > " + proCode);
		try {
			connection = BaseDao.getConnection();
			productAntiList = productDao.getAntiList(connection, proName,proCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return productAntiList;
	}

	@Override
	public int deleteProductById(String delId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		int billCount = -1;
		try {
			connection = BaseDao.getConnection();
			connection.setAutoCommit(false);
			billCount = billDao.getBillCountByProductId(connection,delId);
			if(billCount == 0){
				productDao.deleteProductById(connection, delId);
				cartDao.deleteProductById(connection, delId);
			}
			connection.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			billCount = -1;
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return billCount;
	}

	@Override
	public Product getProductById(String id) {
		// TODO Auto-generated method stub
		Product product = null;
		Connection connection = null;
		try{
			connection = BaseDao.getConnection();
			product = productDao.getProductById(connection, id);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			product = null;
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return product;
	}

	@Override
	public boolean modify(Product product) {
		// TODO Auto-generated method stub
		Connection connection = null;
		boolean flag = false;
		try {
			connection = BaseDao.getConnection();
			if(productDao.modify(connection, product) > 0)
				flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}

}
