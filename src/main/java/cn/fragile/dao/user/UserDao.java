package cn.fragile.dao.user;

import cn.fragile.pojo.User;

import java.sql.Connection;
import java.util.List;

public interface UserDao {

	public int add(Connection connection, User user)throws Exception;

	public User getLoginUser(Connection connection, String userCode)throws Exception;

	public List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize)throws Exception;

	public int getUserCount(Connection connection, String userName, int userRole)throws Exception;

	public int deleteUserById(Connection connection, Integer delId)throws Exception;

	public User getUserById(Connection connection, String id)throws Exception;

	public int modify(Connection connection, User user)throws Exception;

	public int updatePwd(Connection connection, int id, String pwd)throws Exception;
}
