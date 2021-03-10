package cn.fragile.service.user;

import cn.fragile.pojo.User;

import java.util.List;

public interface UserService {

	public int reg(User user);

	public boolean add(User user);

	public User login(String userCode, String userPassword);

	public List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

	public int getUserCount(String queryUserName, int queryUserRole);

	public User selectUserCodeExist(String userCode);

	public boolean deleteUserById(Integer delId);

	public User getUserById(String id);

	public boolean modify(User user);

	public boolean updatePwd(int id, String pwd);
}
