package cn.fragile.service.user;

import cn.fragile.dao.BaseDao;
import cn.fragile.dao.user.UserDao;
import cn.fragile.dao.user.UserDaoImpl;
import cn.fragile.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	public UserServiceImpl(){
		userDao = new UserDaoImpl();
	}
	@Override
	public int reg(User user) {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		int updateRows = 0;
		Connection connection = null;
		connection = BaseDao.getConnection();
		String sql = "insert into fragile_user (userCode,userName,userPassword," +
				"userRole,gender,birthday,phone,email,creationDate,createdBy) " +
				"values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getUserCode(),user.getUserName(),user.getUserPassword(),
				user.getUserRole(),user.getGender(),user.getBirthday(),
				user.getPhone(),user.getEmail(),user.getCreationDate(),user.getCreatedBy()};
		try {
			updateRows = BaseDao.execute(connection, pstm, sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		BaseDao.closeResource(null, pstm, null);

		return updateRows;
}

	@Override
	public boolean add(User user) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		Connection connection = null;
		try {
			connection = BaseDao.getConnection();
			connection.setAutoCommit(false);
			int updateRows = userDao.add(connection,user);
			connection.commit();
			if(updateRows > 0){
				flag = true;
				System.out.println("add success!");
			}else{
				System.out.println("add failed!");
			}
			
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
	public User login(String userCode, String userPassword) {
		// TODO Auto-generated method stub
		Connection connection = null;
		User user = null;
		try {
			connection = BaseDao.getConnection();
			user = userDao.getLoginUser(connection, userCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}

		if(null != user){
			if(!user.getUserPassword().equals(userPassword))
				user = null;
		}
		
		return user;
	}
	@Override
	public List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize) {
		// TODO Auto-generated method stub
		Connection connection = null;
		List<User> userList = null;
		System.out.println("queryUserName ---- > " + queryUserName);
		System.out.println("queryUserRole ---- > " + queryUserRole);
		System.out.println("currentPageNo ---- > " + currentPageNo);
		System.out.println("pageSize ---- > " + pageSize);
		try {
			connection = BaseDao.getConnection();
			userList = userDao.getUserList(connection, queryUserName,queryUserRole,currentPageNo,pageSize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return userList;
	}
	@Override
	public User selectUserCodeExist(String userCode) {
		// TODO Auto-generated method stub
		Connection connection = null;
		User user = null;
		try {
			connection = BaseDao.getConnection();
			user = userDao.getLoginUser(connection, userCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return user;
	}
	@Override
	public boolean deleteUserById(Integer delId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		boolean flag = false;
		try {
			connection = BaseDao.getConnection();
			if(userDao.deleteUserById(connection,delId) > 0)
				flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}
	@Override
	public User getUserById(String id) {
		// TODO Auto-generated method stub
		User user = null;
		Connection connection = null;
		try{
			connection = BaseDao.getConnection();
			user = userDao.getUserById(connection,id);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			user = null;
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return user;
	}
	@Override
	public boolean modify(User user) {
		// TODO Auto-generated method stub
		Connection connection = null;
		boolean flag = false;
		try {
			connection = BaseDao.getConnection();
			if(userDao.modify(connection,user) > 0)
				flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}
	@Override
	public boolean updatePwd(int id, String pwd) {
		boolean flag = false;
		Connection connection = null;
		try{
			connection = BaseDao.getConnection();
			if(userDao.updatePwd(connection,id,pwd) > 0)
				flag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return flag;
	}
	@Override
	public int getUserCount(String queryUserName, int queryUserRole) {
		// TODO Auto-generated method stub
		Connection connection = null;
		int count = 0;
		System.out.println("queryUserName ---- > " + queryUserName);
		System.out.println("queryUserRole ---- > " + queryUserRole);
		try {
			connection = BaseDao.getConnection();
			count = userDao.getUserCount(connection, queryUserName,queryUserRole);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeResource(connection, null, null);
		}
		return count;
	}
	
}
