package dao;
//地址类（作者：周华）
import java.util.*;
import entity.*;
import java.sql.*;
public class AddressDao {
	/**
	 * 把数据添加到地址表
	 * @param c
	 * @return
	 */
	public int address(HarvestsInfo h){
		int res=0;
		//设置要执行的SQL语句
		String sql="insert into Harvests(uId,hName,hTel,hAddress) values (?,?,?,?)";
		String[] para={h.getuId(),h.gethName(),h.gethTel(),h.gethAddress()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 根据用户ID查询该用户的地址信息
	 * @param uid 用户ID
	 * @return
	 * @throws Exception
	 */
	public List<HarvestsInfo> getRess(String uid) throws Exception{
		List<HarvestsInfo> list=new ArrayList<HarvestsInfo>();
		//设置要执行的SQL语句
		String sql="select * from harvests where uId=?";
		String[] para={uid};
		//调用BaseDao中查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String address=rs.getString("hAddress");
		    String name=rs.getString("hName");
		    String tel=rs.getString("hTel");
			//通过构造函数把数据保存到实体类对象的各个属性中
		    HarvestsInfo info=new HarvestsInfo(hId, uId, address, name, tel);//实体类对象
            list.add(info);//将数据保存到集合中
		}
		return list;
	}
	/**
	 * 根据地址ID查询地址信息
	 * @param hid 地址ID
	 * @return
	 * @throws Exception
	 */
	public HarvestsInfo upRess(String hid) throws Exception{
		HarvestsInfo info=null;
		//设置要执行的SQL语句
		String sql="select * from harvests where hId=?";
		String[] para={hid};
		//调用BaseDao中查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String address=rs.getString("hAddress");
		    String name=rs.getString("hName");
		    String tel=rs.getString("hTel");
			//通过构造函数把数据保存到实体类对象的各个属性中
		    info=new HarvestsInfo(hId, uId, address, name, tel);//实体类对象
		}
		return info;
	}
	/**
	 * 修改地址信息
	 * @param h
	 * @return
	 */
	public int upAddress(HarvestsInfo h){
		int res=0;
		//设置要执行的SQL语句
		String sql="update harvests set hAddress=?,hName=?,hTel=? where hId=?";
		String[] para={h.gethAddress(),h.gethName(),h.gethTel(),h.gethId()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
