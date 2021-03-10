package cn.fragile.dao.product;

import cn.fragile.dao.BaseDao;
import cn.fragile.pojo.Product;
import com.mysql.jdbc.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

	@Override
	public int add(Connection connection, Product product)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		int flag = 0;
		if(null != connection){
			String sql = "insert into fragile_product (proCode,proName,proDesc," +
					"proDeveloper,ProPublisher,proDate,proPrice,createdBy,creationDate,proCate) " +
					"values(?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {product.getProCode(), product.getProName(), product.getProDesc(),
					product.getProDeveloper(), product.getProPublisher(), product.getProDate(),
					product.getProPrice(), product.getCreatedBy(), product.getCreationDate(),product.getProCate()};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

	@Override
	public int addPic(Connection connection, Product product)
			throws Exception {
		// TODO Auto-generated method stub
		int flag = 0;
		PreparedStatement pstm = null;

		if(null != connection){
			String sql = "update fragile_product set proFilename = ?,proVideo = ? where id = ? ";
			Object[] params = {product.getProFilename(), product.getProVideo(),product.getId()};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

	@Override
	public List<Product> getProductList(Connection connection, String proName, String proCode)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Product> productList = new ArrayList<Product>();
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select * from fragile_product where 1=1 ");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(proName)){
				sql.append(" and proName like ?");
				list.add("%"+proName+"%");
			}
			if(!StringUtils.isNullOrEmpty(proCode)){
				sql.append(" and proCode like ?");
				list.add("%"+proCode+"%");
			}
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			while(rs.next()){
				Product _product = new Product();
				_product.setId(rs.getInt("id"));
				_product.setProCode(rs.getString("proCode"));
				_product.setProName(rs.getString("proName"));
				_product.setProDesc(rs.getString("proDesc"));
				_product.setProDeveloper(rs.getString("proDeveloper"));
				_product.setProPublisher(rs.getString("proPublisher"));
				_product.setProDate(rs.getDate("proDate"));
				_product.setProPrice(rs.getInt("proPrice"));
				_product.setCreationDate(rs.getTimestamp("creationDate"));
				_product.setProFilename(rs.getString("proFilename"));
				_product.setProCate(Integer.valueOf(rs.getString("proCate")));
				_product.setProVideo(rs.getString("proVideo"));
				productList.add(_product);
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return productList;
	}


	public List<Product> getAntiList(Connection connection, String proName, String proCode)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Product> productAntiList = new ArrayList<Product>();
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select * from fragile_product ");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(proName)){
				sql.append(" and proName like ?");
				list.add("%"+proName+"%");
			}
			if(!StringUtils.isNullOrEmpty(proCode)){
				sql.append(" and proCode like ?");
				list.add("%"+proCode+"%");
			}
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			rs.afterLast();
			while(rs.previous()){
				Product _product = new Product();
				_product.setId(rs.getInt("id"));
				_product.setProCode(rs.getString("proCode"));
				_product.setProName(rs.getString("proName"));
				_product.setProDesc(rs.getString("proDesc"));
				_product.setProDeveloper(rs.getString("proDeveloper"));
				_product.setProPublisher(rs.getString("proPublisher"));
				_product.setProDate(rs.getDate("proDate"));
				_product.setProPrice(rs.getInt("proPrice"));
				_product.setCreationDate(rs.getTimestamp("creationDate"));
				_product.setProFilename(rs.getString("proFilename"));
				_product.setProCate(Integer.valueOf(rs.getString("proCate")));
				_product.setProVideo(rs.getString("proVideo"));
				productAntiList.add(_product);
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return productAntiList;
	}

	@Override
	public int deleteProductById(Connection connection, String delId)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		int flag = 0;
		if(null != connection){
			String sql = "delete from fragile_product where id=?";
			Object[] params = {delId};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

	@Override
	public Product getProductById(Connection connection, String id)
			throws Exception {
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

	@Override
	public int modify(Connection connection, Product product)
			throws Exception {
		// TODO Auto-generated method stub
		int flag = 0;
		PreparedStatement pstm = null;

		if(null != connection){
			String sql = "update fragile_product set proName=?,proDesc=?,proDeveloper=?," +
					"proPublisher=?,proDate=?,proPrice=?,proFilename=?,proCate=?,modifyBy=?,modifyDate=? where id = ? ";
			Object[] params = {product.getProName(), product.getProDesc(), product.getProDeveloper(), product.getProPublisher(), product.getProDate(),
					product.getProPrice(),product.getProFilename(),product.getProCate(),product.getModifyBy(), product.getModifyDate(), product.getId()};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

}
