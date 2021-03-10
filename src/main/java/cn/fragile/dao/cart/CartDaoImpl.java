package cn.fragile.dao.cart;

import cn.fragile.dao.BaseDao;
import cn.fragile.dao.cart.CartDao;
import cn.fragile.pojo.Bill;
import cn.fragile.pojo.Cart;
import cn.fragile.pojo.Product;
import com.mysql.jdbc.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    @Override
    public int add(Connection connection, Cart cart) throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        int flag = 0;
        if(null != connection){
            String sql = "insert into fragile_cart values(?, ?, ?, ?, ?, 1, ?)";
            Object[] params = {cart.getCart_id(),
                    cart.getCart_pimage(),
                    cart.getCart_pname(),
                    cart.getCart_pprice(),
                    cart.getCart_uid(),
                    cart.getCart_pid()};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }

    @Override
    public List<Cart> getCartList(Connection connection, String uid) throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Cart> cartList = new ArrayList<>();
        if(connection != null){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from fragile_cart where 1=1 ");
            List<Object> list = new ArrayList<Object>();
            if(!StringUtils.isNullOrEmpty(uid)){
                sql.append(" and cart_uid like ?");
                list.add("%"+uid+"%");
            }
            Object[] params = list.toArray();
            System.out.println("sql ----> " + sql.toString());
            rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
            while(rs.next()){
                Cart _cart = new Cart();
                _cart.setCart_id(rs.getInt("cart_id"));
                _cart.setCart_pimage(rs.getString("cart_pimage"));
                _cart.setCart_pname(rs.getString("cart_pname"));
                _cart.setCart_pprice(rs.getInt("cart_pprice"));
                _cart.setCart_uid(rs.getInt("cart_uid"));
                _cart.setCart_valid(rs.getInt("cart_valid"));
                _cart.setCart_pid(rs.getInt("cart_pid"));
                cartList.add(_cart);
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return cartList;

    }

    @Override
    public int deleteProductById(Connection connection, String delId) throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        int flag = 0;
        if(null != connection){
            String sql = "delete from fragile_cart where cart_id=?";
            Object[] params = {delId};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }

    @Override
    public Product getProductById(Connection connection, String id) throws Exception {
        // TODO Auto-generated method stub
        Product product = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        if(null != connection){
            String sql = "select * from fragile_product where id=?";
            Object[] params = {id};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if(rs.next()){
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setProCode(rs.getString("proCode"));
                product.setProName(rs.getString("proName"));
                product.setProDesc(rs.getString("proDesc"));
                product.setProDeveloper(rs.getString("proDeveloper"));
                product.setProPublisher(rs.getString("proPublisher"));
                product.setProDate(rs.getDate("proDate"));
                product.setProPrice(rs.getInt("proPrice"));
                product.setProCate(rs.getInt("proCate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                product.setCreationDate(rs.getTimestamp("creationDate"));
                product.setModifyBy(rs.getInt("modifyBy"));
                product.setModifyDate(rs.getTimestamp("modifyDate"));
                product.setProFilename(rs.getString("proFilename"));
                product.setProVideo(rs.getString("proVideo"));
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return product;
    }

}
