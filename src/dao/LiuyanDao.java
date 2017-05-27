package dao;
//留言管理 （作者：徐辉）
import java.util.*;
import java.sql.*;

import entity.*;
public class LiuyanDao {
	/**
	  *  查看留言信息并且实现分页
	  * @param pIndex 当前页数 （第一页，第二页，第三页）
	  * @return
	  */
		public List<LiuyansInfo> selectLiuyan(int pIndex){
			List<LiuyansInfo> list=new ArrayList<LiuyansInfo>();
			//设置要执行的SQL语句，查询标题 作者 时间 内容(两张表)
			String sql="select top 10 a.*,uPetname"
                       +" from liuyans a, users u"
                       +" where lId not in( select top "+((pIndex-1)*10)+" lId"  
                       +" from liuyans) and a.uId=u.uId";
		   ResultSet rs=BaseDao.selectData(sql, null);
			try {
				while(rs.next()){
					String lId=rs.getString("lId");
					String lBiaoti=rs.getString("lBiaoti");
			        String uPetname=rs.getString("uPetname"); 
					String lTime=rs.getString("lTime");
					String lNeirong=rs.getString("lNeirong");
					LiuyansInfo info=new LiuyansInfo(lId,null,lBiaoti,uPetname,lTime,lNeirong);
					list.add(info);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		/**
		 * 根据留言id删除回复表
		 * @param id 为1,2,3这种形式
		 * @return
		 */
		public int delectHuifus(String id){
			int res=0;
			String sql="delete from huifus where lId = ?";
			String[] para={id};
			//调用BaseDao中增删改方法
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		
		/**
		 * 根据留言id删除留言表
		 * @param id 为1,2,3这种形式
		 * @return
		 */
		public int delectLiuyan(String id){
			int res=0;
			String sql="delete from liuyans where lId = ?";
			String[] para={id};
			//调用BaseDao中增删改方法
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		
	
		
		 /**
		  *  查找留言总条数 
		  * @return
		  */
		  public int getCount(){
			   int res=0;
			   String sql="select count(*) from liuyans";
			   ResultSet rs=BaseDao.selectData(sql, null);
			   try {
				while(rs.next()){
					res=rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			   return res;
		   }
		  
		  /**
		   * 得到留言通过留言id
		   * @param Id
		   * @return
		   */
			public LiuyansInfo getLiuyanById(String Id){
				LiuyansInfo info=null;
				//设置要执行的SQL语句，查询标题 作者 时间 内容(两张表)
				String sql="select a.*,uPetname"
	                          +" from liuyans a, users u"
	                          +" where a.uId=u.uId"
						      +" and lId=?";
				String[] para={Id};
				//调用方法，执行SQL语句
			    ResultSet rs =	BaseDao.selectData(sql, para);
			    try {
					while(rs.next()){
						String lId=rs.getString("lId");
						String lBiaoti=rs.getString("lBiaoti");
				        String uPetname=rs.getString("uPetname"); 
						String lTime=rs.getString("lTime");
						String lNeirong=rs.getString("lNeirong");
					  info=new LiuyansInfo(lId,null,lBiaoti,uPetname,lTime,lNeirong);
						 
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			    
				return info;
				
			}
		
}
