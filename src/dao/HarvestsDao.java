package dao;
//地址类（作者：周华）
import java.sql.*;
import java.util.*;
import entity.*;

public class HarvestsDao {
	/**
	 * 根据用户ID查询用户储存的地址信息
	 * @param uid 用户ID
	 * @return 地址信息数组
	 * @throws Exception 抛出异常
	 */
	public List<HarvestsInfo> getHarvests(String uid) throws Exception{
		//定义数组
		List<HarvestsInfo> list=new ArrayList<HarvestsInfo>();
		//设置要执行的SQL语句
		String sql="select * from harvests where uId=?";
		String[] para={uid};
		//调用BaseDao中查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		while(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String hAddress=rs.getString("hAddress");
		    String hName=rs.getString("hName");
		    String hTel=rs.getString("hTel");
			//通过构造函数把数据保存到实体类对象的各个属性中
		    HarvestsInfo har=new HarvestsInfo(hId, uId, hAddress, hName, hTel);//实体类对象
			//把实体类对象保存到集合中
			list.add(har);
		}
		return list;
	}
	/**
	 * 根据地址ID删除收货信息
	 * @param hId
	 * @return
	 */
	public int delete(String hId){
		int res=0;
		//设置要执行的SQL语句
		String sql="delete from harvests where hId=?";
		String[] para={hId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
