package cn.fragile.service.cart;

import cn.fragile.dao.BaseDao;
import cn.fragile.dao.bill.BillDao;
import cn.fragile.dao.bill.BillDaoImpl;
import cn.fragile.dao.cart.CartDao;
import cn.fragile.dao.cart.CartDaoImpl;
import cn.fragile.dao.product.ProductDao;
import cn.fragile.dao.product.ProductDaoImpl;
import cn.fragile.pojo.Cart;
import cn.fragile.pojo.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CartServiceImpl implements CartService {

    private ProductDao productDao;
    private CartDao cartDao;
    public CartServiceImpl(){
        productDao = new ProductDaoImpl();
        cartDao = new CartDaoImpl();
    }

    @Override
    public boolean add(Cart cart) {
        // TODO Auto-generated method stub
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);
            if(cartDao.add(connection, cart) > 0)
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
    public List<Cart> getCartList(String uid) {
        // TODO Auto-generated method stub
        Connection connection = null;
        List<Cart> cartList = null;
        System.out.println("query cart ---- > " + uid);
        try {
            connection = BaseDao.getConnection();
            cartList = cartDao.getCartList(connection, uid);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            BaseDao.closeResource(connection, null, null);
        }
        return cartList;
    }

    @Override
    public boolean deleteCartById(String delId) {
        // TODO Auto-generated method stub
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);
            if(cartDao.deleteProductById(connection, delId) > 0)
                flag = true;
            connection.commit();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            try {
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




}
