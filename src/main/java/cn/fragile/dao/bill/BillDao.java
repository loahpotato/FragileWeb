package cn.fragile.dao.bill;

import cn.fragile.pojo.Bill;

import java.sql.Connection;
import java.util.List;

public interface BillDao {

	public int add(Connection connection, Bill bill)throws Exception;

	public List<Bill> getBillList(Connection connection, Bill bill)throws Exception;

	public int deleteBillById(Connection connection, String delId)throws Exception;

	public Bill getBillById(Connection connection, String id)throws Exception;

	public int modify(Connection connection, Bill bill)throws Exception;

	public int getBillCountByProductId(Connection connection, String ProductId)throws Exception;
}
