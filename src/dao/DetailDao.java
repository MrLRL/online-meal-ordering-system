package dao;
//订单及订单详情类（作者：周华）

import java.sql.*;
import java.util.*;
import entity.*;

public class DetailDao {
	/**
	 * 将购买的商品添加到订单详情表中
	 * @param de 订单详情表实体类
	 * @return
	 */
	public int addDetail(DetailsInfo de){
		int res=0;
		//设置要执行的SQL语句
		String sql="insert into details(gCount,gId,dId,deBeizhu) values (?,?,?,?)";
		String[] para={de.getgCount(),de.getgId(),de.getdId(),de.getDeBeizhu()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 创建订单
	 * @param dd 订单表实体类
	 * @return
	 */
	public int addDingdan(DingdansInfo dd){
		int res=0;
		//设置要执行的SQL语句
		String sql="insert into dingdans(dTime,dState,dPrice,uId,hId) values (?,?,?,?,?)";
		String[] para={dd.getdTime(),dd.getdState(),dd.getdPrice(),dd.getuId(),dd.gethId()};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 根据用户ID查询新添加的那条订单表数据
	 * @param uId
	 * @return
	 */
	public DingdansInfo getDingdansInfo(String uId){
		DingdansInfo info=null;
		//设置要执行的SQL语句
		String sql="select top 1 * from dingdans where uId=? order by dId desc";
		String[] para={uId};
		//调用查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			if(rs.next()){
				String dId=rs.getString("dId");
				String time=rs.getString("dTime");
				String state=rs.getString("dState");
				String price=rs.getString("dPrice");
			    String uid=rs.getString("uId");
				String hId=rs.getString("hId");
				//创建一个订单实体类
				info=new DingdansInfo(dId, time, state, price, uid, hId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	/**
	 * 根据订单ID查询订单详情和商品的相关信息
	 * @param did 订单ID
	 * @return
	 */
	public List<DetailsInfo> getDetail(String did){
		List<DetailsInfo> list=new ArrayList<DetailsInfo>();
		//设置要执行的SQL语句
		String sql="select gName,gCount,gPrice,deBeizhu from details,goods where details.gId=goods.gId and dId=?";
		String[] para={did};
		//调用查询的通用方法
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){
				String gName=rs.getString("gName");
				String count=rs.getString("gCount");
				String gPrice=rs.getString("gPrice");
				String deBeizhu=rs.getString("deBeizhu");
				//创建一个订单详情实体类
				DetailsInfo info=new DetailsInfo(gName, count,deBeizhu,gPrice);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 分页查询当前用户订单
	 * @param pIndex 当前页数
	 * @param uId 用户ID
	 * @return
	 */
	public List<DingdansInfo> getDingdan(int pIndex,String uId){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//设置要执行的SQL语句
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState " 
				  +"from dingdans,harvests "
				  +"where dingdans.hId=harvests.hId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and dingdans.uId=?";
		String[] para={uId};
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				//创建一个订单实体类
				DingdansInfo dingdan=new DingdansInfo(dId,null,null,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//将数据添加到集合
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
	/**
	 * 查询当前用户订单总条数
	 * @param uId 用户ID
	 * @return
	 * @throws SQLException
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from dingdans where uId=?";
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
	 * 根据订单ID删除订单详情
	 * @param dId 订单ID
	 * @return
	 */
	public int delDetail(String dId){
		int res=0;
		//设置要执行的SQL语句
		String sql="delete from details where dId=?";
		String[] para={dId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 根据订单ID删除订单
	 * @param dId 订单ID
	 * @return
	 */
	public int delDingdan(String dId){
		int res=0;
		//设置要执行的SQL语句
		String sql="delete from dingdans where dId=?";
		String[] para={dId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * 根据订单ID修改订单状态
	 * @param dId 订单ID
	 * @param dState 订单状态
	 * @return
	 */
	public int updState(String dId,String dState){
		int res=0;
		//设置要执行的SQL语句
		String sql="update dingdans set dState=? where dId=?";
		String[] para={dState,dId};
		//调用BaseDao中的通用方法
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
