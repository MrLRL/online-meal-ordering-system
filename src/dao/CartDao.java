package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import entity.*;
//购物车类（作者：周华）
public class CartDao {
	/**
	 * 把数据添加到购物车
	 * @param c
	 * @return
	 */
	public int addCart(CartsInfo c){
		int res=0;
		//设置要执行的SQL语句
		String sql="insert into carts(gCount,gId,uId,cBeizhu) values (?,?,?,?)";
		String[] para={c.getgCount(),c.getgId(),c.getuId(),c.getcBeizhu()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * 修改购物车中某个商品的数量和备注(根据购物车ID进行修改)
	 * @param c
	 * @return
	 */
	public int updateCount(String Count,String Beizhu,String CartId){
		int res=0;
		//设置要执行的SQL语句
		String sql="update carts set gCount=?,cBeizhu=? where cartId=?";
		String[] para={Count,Beizhu,CartId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * 根据用户ID查询该用户的购物车
	 * @param uid 用户ID
	 * @return
	 * @throws Exception
	 */
	public List<CartsInfo> getCarts(String uid) throws Exception{
		List<CartsInfo> list=new ArrayList<CartsInfo>();
		//设置要执行的SQL语句
		String sql="select * from carts where uId=?";
		String[] para={uid};
		//调用BaseDao中查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String cId=rs.getString("cartId");
			String count=rs.getString("gCount");
			String gId=rs.getString("gId");
		    String uId=rs.getString("uId");
		    String beizhu=rs.getString("cBeizhu");
			//通过构造函数把数据保存到实体类对象的各个属性中
		    CartsInfo info=new CartsInfo(cId, count, gId, uId, beizhu);//实体类对象
            list.add(info);//将数据保存到集合中
		}
		return list;
	}
	
	/**
	 * 根据购物车ID删除购物车信息
	 * @param cartId
	 * @return
	 */
	public int close(String cartId){
		int res=0;
		//设置要执行的SQL语句
		String sql="delete from carts where cartId=?";
		String[] para={cartId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * 查询显示购物车
	 * @param uId
	 * @return
	 */
	public List<CartsInfo> getCartInfo(String uId){
		List<CartsInfo> list=new ArrayList<CartsInfo>();
		//设置要执行的SQL语句
		String sql="select cartId,gName,gPrice,gCount,goods.gId,cBeizhu"
				  +" from carts,goods"
				  +" where carts.gId=goods.gId and uId=?";
		String[] para={uId};
		//调用查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){
				String cId=rs.getString("cartId");
				String name=rs.getString("gName");
				String price=rs.getString("gPrice");
				String count=rs.getString("gCount");
				String gId=rs.getString("gId");
				String beizhu=rs.getString("cBeizhu");
				//创建一个购物车实体类
				CartsInfo info=new CartsInfo(cId, count, gId, name, beizhu, price);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 清空购物车的方法(根据用户ID进行删除)
	 * @param uId 用户ID
	 * @return
	 */
	public int clearCart(String uId){
		int res=0;
		//设置要执行的SQL语句
		String sql="delete from carts where uId=?";
		String[] para={uId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 查询当前用户购物车中的总条数
	 * @return 总条数
	 * @throws SQLException 抛出SQL异常
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from carts where uId=?";
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
	 * 计算购物车中的商品总价
	 * @param uId
	 * @return
	 * @throws SQLException
	 */
	public double sum(String uId) throws SQLException {
		double sum=0;
		// 设置要执行的SQL语句
		String sql = "select gCount,gPrice from carts,goods where carts.gId=goods.gId and uId=?";
		// 调用BaseDao中查询的通用方法
		String para[]={uId};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			double count = rs.getDouble("gCount");
			double price = rs.getDouble("gPrice");
			sum=sum+count*price;
			// 把实体类对象保存到集合中
		}
		return sum;
	}
	/**
	 * 根据商品ID和用户ID查询对应购物车中是否已存在该商品
	 * @param gid 商品ID
	 * @return 购物车信息
	 * @throws Exception 抛出异常
	 */
	public CartsInfo getCart(String gid,String uid) throws Exception{
		CartsInfo info=null;
		//设置要执行的SQL语句
		String sql="select * from carts where gId=? and uId=?";
		String[] para={gid,uid};
		//调用BaseDao中查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String cId=rs.getString("cartId");
			String count=rs.getString("gCount");
			String gId=rs.getString("gId");
		    String uId=rs.getString("uId");
		    String beizhu=rs.getString("cBeizhu");
			//通过构造函数把数据保存到实体类对象的各个属性中
		    info=new CartsInfo(cId, count, gId, uId, beizhu);//实体类对象
		}
		return info;
	}
	
}