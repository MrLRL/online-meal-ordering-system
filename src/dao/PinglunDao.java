package dao;
//评论类（作者：周华）

import java.sql.*;
import java.util.*;
import entity.*;

public class PinglunDao {
	/**
	 * 分页查询显示评论
	 * @param pIndex
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public List<PingjiasInfo> getNew(int pIndex,String gId) throws SQLException {
		List<PingjiasInfo> list = new ArrayList<PingjiasInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 5 * from pingjias,users where pId not in("
		+" select top "+((pIndex-1)*5)+" pId from pingjias) "
		+" and gId=? and users.uId=pingjias.uId order by pId desc";
		// 调用BaseDao中查询的通用方法
		String para[]={gId};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			String id = rs.getString("pId");
			String uId = rs.getString("uId");
			String gid = rs.getString("gId");
			String pContent = rs.getString("pContent");
			String pDate = rs.getString("pDate");
			String pLeixing = rs.getString("pLeixing");
			String uPetname = rs.getString("uPetname");
			// 通过构造函数把数据保存到实体类对象的各个属性中
			PingjiasInfo info = new PingjiasInfo(id, uId, gid, pContent, pDate, pLeixing, uPetname);// 实体类对象
			// 把实体类对象保存到集合中
			list.add(info);
		}
		return list;
	}
	/**
	 * 查询当前商品评论总数
	 * @return
	 * @throws SQLException
	 */
	public int num(String gId) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from pingjias where gId=?";
		String para[]={gId};
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
	}
	/**
	 * 根据评论类型显示评论
	 * @param pIndex
	 * @param leixing
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public List<PingjiasInfo> getleixing(int pIndex,String leixing,String gId) throws SQLException {
		List<PingjiasInfo> list = new ArrayList<PingjiasInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 5 * from pingjias,users where pId not in("
		+" select top "+((pIndex-1)*5)+" pId from pingjias) "
		+" and gId=? and users.uId=pingjias.uId and pLeixing=? order by pId desc";
		// 调用BaseDao中查询的通用方法
		String para[]={gId,leixing};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			String id = rs.getString("pId");
			String uId = rs.getString("uId");
			String gid = rs.getString("gId");
			String pContent = rs.getString("pContent");
			String pDate = rs.getString("pDate");
			String pLeixing = rs.getString("pLeixing");
			String uPetname = rs.getString("uPetname");
			// 通过构造函数把数据保存到实体类对象的各个属性中
			PingjiasInfo info = new PingjiasInfo(id, uId, gid, pContent, pDate, pLeixing, uPetname);// 实体类对象
			// 把实体类对象保存到集合中
			list.add(info);
		}
		return list;
	}
	/**
	 * 查询指定分类的评论数
	 * @param leixing
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public int num1(String leixing,String gId) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from pingjias where gId=? and pLeixing=?";
		String para[]={gId,leixing};
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
	}
}
