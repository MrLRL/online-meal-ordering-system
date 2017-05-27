package dao;
//���Թ��� �����ߣ���ԣ�
import java.util.*;
import java.sql.*;

import entity.*;
public class LiuyanDao {
	/**
	  *  �鿴������Ϣ����ʵ�ַ�ҳ
	  * @param pIndex ��ǰҳ�� ����һҳ���ڶ�ҳ������ҳ��
	  * @return
	  */
		public List<LiuyansInfo> selectLiuyan(int pIndex){
			List<LiuyansInfo> list=new ArrayList<LiuyansInfo>();
			//����Ҫִ�е�SQL��䣬��ѯ���� ���� ʱ�� ����(���ű�)
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
		 * ��������idɾ���ظ���
		 * @param id Ϊ1,2,3������ʽ
		 * @return
		 */
		public int delectHuifus(String id){
			int res=0;
			String sql="delete from huifus where lId = ?";
			String[] para={id};
			//����BaseDao����ɾ�ķ���
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		
		/**
		 * ��������idɾ�����Ա�
		 * @param id Ϊ1,2,3������ʽ
		 * @return
		 */
		public int delectLiuyan(String id){
			int res=0;
			String sql="delete from liuyans where lId = ?";
			String[] para={id};
			//����BaseDao����ɾ�ķ���
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		
	
		
		 /**
		  *  �������������� 
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
		   * �õ�����ͨ������id
		   * @param Id
		   * @return
		   */
			public LiuyansInfo getLiuyanById(String Id){
				LiuyansInfo info=null;
				//����Ҫִ�е�SQL��䣬��ѯ���� ���� ʱ�� ����(���ű�)
				String sql="select a.*,uPetname"
	                          +" from liuyans a, users u"
	                          +" where a.uId=u.uId"
						      +" and lId=?";
				String[] para={Id};
				//���÷�����ִ��SQL���
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
