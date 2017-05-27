package dao;
//用户留言类（作者：周华）
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.*;
public class NoteDao {
	/**
	 * 添加留言
	 * @param l 留言实体类
	 * @return
	 */
	public int addNote(LiuyansInfo l){
		int res=0;
		//设置要执行的SQL语句
		String sql="insert into liuyans(uId,lBiaoti,lNeirong,lTime) values (?,?,?,?)";
		String[] para={l.getuId(),l.getlBiaoti(),l.getlNeirong(),l.getlTime()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 分页查询当前用户留言记录
	 * @param pIndex 当前页数
	 * @param uId 用户ID
	 * @return
	 * @throws SQLException
	 */
	public List<LiuyansInfo> sel(int pIndex,String uid) throws SQLException {
		List<LiuyansInfo> list = new ArrayList<LiuyansInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 3 * from liuyans where lId not in("
		+" select top "+((pIndex-1)*3)+" lId from liuyans) and uId="+uid;
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		while(rs.next()) {
			String id = rs.getString("lId");
			String uId = rs.getString("uId");
			String lBiaoti = rs.getString("lBiaoti");
			String lNeirong = rs.getString("lNeirong");
			String lTime = rs.getString("lTime");
			// 通过构造函数把数据保存到实体类对象的各个属性中
			LiuyansInfo info = new LiuyansInfo(id, uId, lBiaoti, lNeirong, lTime);// 实体类对象
			// 把实体类对象保存到集合中
			list.add(info);
		}
		return list;
	}
	/**
	 * 查询当前用户留言总条数
	 * @param uId
	 * @return
	 * @throws SQLException
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from liuyans where uId=?";
		// 调用BaseDao中查询的通用方法
		String para[]={uId};
		ResultSet rs = BaseDao.selectData(sql, para);
		if (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
	}
	/**
	 * 查询管理员回复信息
	 * @param lid
	 * @return
	 * @throws SQLException
	 */
	public HuifusInfo huifu(String lid) throws SQLException {
		HuifusInfo info =null;
		// 设置要执行的SQL语句
		String sql = "select * from huifus where lId=?";
		// 调用BaseDao中查询的通用方法
		String para[]={lid};
		ResultSet rs = BaseDao.selectData(sql, para);
		if(rs.next()) {
			String id = rs.getString("fId");
			String lId = rs.getString("lId");
			String fNeirong = rs.getString("fNeirong");
			String fTime = rs.getString("fTime");
			// 通过构造函数把数据保存到实体类对象的各个属性中
			info = new HuifusInfo(id, lId, fNeirong, fTime);// 实体类对象
			// 把实体类对象保存到集合中
		}
		return info;
	}
}
