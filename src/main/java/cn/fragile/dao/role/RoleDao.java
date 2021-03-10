package cn.fragile.dao.role;

import cn.fragile.pojo.Role;

import java.sql.Connection;
import java.util.List;

public interface RoleDao {
	
	public List<Role> getRoleList(Connection connection)throws Exception;

}
