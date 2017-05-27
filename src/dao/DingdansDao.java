package dao;
//订单管理类
import java.sql.*;
import java.util.*;
import entity.*;

public class DingdansDao {

	/**
	 * 根据订单状态分页查询订单
	 * @param pIndex 当前页数
	 * @return
	 */
	public List<DingdansInfo> getDingdan2(int pIndex,String dStade){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//设置要执行的SQL语句
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and dState=?";
		String para[]={dStade};
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//创建一个订单实体类
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//将数据添加到集合
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
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
	 * 查询订单总条数
	 * @return
	 * @throws SQLException
	 */
	public int num1() throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from dingdans";
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		if (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
	}

	/**
	 * 分页查询订单
	 * @param pIndex 当前页数
	 * @return
	 */
	public List<DingdansInfo> getDingdan1(int pIndex){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//设置要执行的SQL语句
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans)";
		ResultSet rs=BaseDao.selectData(sql, null);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//创建一个订单实体类
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//将数据添加到集合
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
	/**
	 * 根据搜索内容分页查询订单
	 * @param pIndex 当前页数
	 * @return
	 */
	public List<DingdansInfo> getDingdan3(int pIndex,String search){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//设置要执行的SQL语句
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and uPetname like '%"+search+"%'";
		ResultSet rs=BaseDao.selectData(sql, null);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//创建一个订单实体类
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//将数据添加到集合
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
}
