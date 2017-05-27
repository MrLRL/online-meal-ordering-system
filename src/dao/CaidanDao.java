package dao;
   //�˵��������ߣ���ԣ�
import java.util.*;
import java.sql.*;

import entity.*;
public class CaidanDao {
 /**
  *  �鿴�˵������Ϣ����ʵ�ַ�ҳ 
  * @param pIndex ��ǰҳ�� ����һҳ���ڶ�ҳ������ҳ��
  * @return
  */
	public List<GoodsInfo> selectGoods(int pIndex){
		List<GoodsInfo> list=new ArrayList<GoodsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select top 5 * from goods "
				+" where gId not in( select top "+((pIndex-1)*5)+" gId from goods)";
	   ResultSet rs=BaseDao.selectData(sql, null);
		try {
			while(rs.next()){
				String gId=rs.getString("gId");
				String gName=rs.getString("gName");
				String gPrice=rs.getString("gPrice");
				String gCaixi=rs.getString("gCaixi");
				String gFood=rs.getString("gFood");
				String gNum=rs.getString("gNum");
				String gDetails=rs.getString("gDetails");
				String gImage=rs.getString("gImage");
				String gShangjia=rs.getString("gShangjia");
				GoodsInfo info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	 /**
	  * �鿴���в˵� 
	  * @param Id
	  * @return
	  */
		public GoodsInfo getGood(String Id){
			GoodsInfo info=null;
			//����Ҫִ�е�SQL���
			String sql="select * from goods";
			String[] para={Id};
			//���÷�����ִ��SQL���
		    ResultSet rs =	BaseDao.selectData(sql, para);
			try {
				while(rs.next()){
					//gId,gName,gPrice,gCaixsi,gFood,gNum,gImage,gDetails,gShangjia
					String gId=rs.getString("gId");
					String gName=rs.getString("gName");
					String gPrice=rs.getString("gPrice");
					String gCaixi=rs.getString("gCaixi");//��ϵ
					String gFood=rs.getString("gFood");
					String gNum=rs.getString("gNum");   
					String gImage=rs.getString("gImage");
					String gDetails=rs.getString("gDetails");//���
					String gShangjia=rs.getString("gShangjia");//��Ʒ״̬ 
					info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	    
			return info;		
		}
		 /**
		  *ͨ��id �鿴���в˵� 
		  * @param Id
		  * @return
		  */
			public GoodsInfo getGoodById(String Id){
				GoodsInfo info=null;
				//����Ҫִ�е�SQL���
				String sql="select * from goods where gId=?";
				String[] para={Id};
				//���÷�����ִ��SQL���
			    ResultSet rs =	BaseDao.selectData(sql, para);
				try {
					while(rs.next()){
						//gId,gName,gPrice,gCaixsi,gFood,gNum,gImage,gDetails,gShangjia
						String gId=rs.getString("gId");
						String gName=rs.getString("gName");
						String gPrice=rs.getString("gPrice");
						String gCaixi=rs.getString("gCaixi");//��ϵ
						String gFood=rs.getString("gFood");
						String gNum=rs.getString("gNum");   
						String gImage=rs.getString("gImage");
						String gDetails=rs.getString("gDetails");//���
						String gShangjia=rs.getString("gShangjia");//��Ʒ״̬ 
						info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}	    
				return info;		
			}

		/**
		 * ��Ӳ˵� 
		 * @param info
		 * @return
		 */
				public int addGoods(GoodsInfo info){
					int res=0;
					//ִ��SQL���
					String sql="insert into goods(gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia) values (?,?,?,?,?,?,?,?)";
					String[] para={info.getgName(),info.getgPrice(),info.getgCaixi(),info.getgFood(),info.getgNum(),info.getgImage(),info.getgDetails(),info.getgShangjia()};
					//����BaseDao����ɾ�ķ���
					res=BaseDao.updateDate(sql, para);
						return res;
				}
	   /**
		 * ɾ���˵� (���ݲ˵�id)
		 * @param id
		 * @return
		 */
				public int delectGoods(String id){
					int res=0;
					String sql="delete from goods where gId=?";
					String[] para={id};
					//����BaseDao����ɾ�ķ���
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * �޸���Ʒ���˵���
				 * @param info
				 * @return
				 */
				public int upCaidan(GoodsInfo info){
				    int res=0;
				    String sql="update goods set gName=?,gCaixi=?,gPrice=?,gFood=?,gDetails=?,gImage=?,gNum=? where gId=?";
				    String[] para={info.getgName(),info.getgCaixi(),info.getgPrice(),info.getgFood(),info.getgDetails(),info.getgImage(),info.getgNum(),info.getgId()};
				  //����BaseDao����ɾ�ķ���
				    res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * �޸���Ʒ״̬���˵���
				 * @param info
				 * @return
				 */
				public int upCaidanZT(GoodsInfo info){
				    int res=0;
				    String sql="update goods set gShangjia=? where gId=?";
				    String[] para={info.getgShangjia(),info.getgId()};
				  //����BaseDao����ɾ�ķ���
				    res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * ������ƷIDɾ�����ﳵ��Ϣ
				 * @param gid
				 * @return
				 */
				public int close(String gId){
					int res=0;
					//����Ҫִ�е�SQL���
					String sql="delete from carts where gId=?";
					String[] para={gId};
					//����BaseDao�е�ͨ�÷���
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * ������ƷIDɾ��������Ϣ
				 * @param gid
				 * @return
				 */
				public int closepj(String gId){
					int res=0;
					//����Ҫִ�е�SQL���
					String sql="delete from pingjias where gId=?";
					String[] para={gId};
					//����BaseDao�е�ͨ�÷���
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				 /**
				  *  ���Ҳ˵������� 
				  * @return
				  */
				  public int getCount(){
					   int res=0;
					   String sql="select count(*) from goods";
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
					 * ���ݲ���������Ҫ�Ĳ˵�
					 * @param pIndex ҳ��
					 * @param search ����������
					 * @return ��Ʒ��
					 * @throws SQLException �׳�SQL�쳣
					 */
					public List<GoodsInfo> search(int pIndex,String search) throws SQLException {
						List<GoodsInfo> list = new ArrayList<GoodsInfo>();
						// ����Ҫִ�е�SQL���
						String sql = "select top 5 * from goods where gId not in ("
						+" select top "+((pIndex-1)*5)+" gId from goods) and gShangjia=1"
						+" and gName like '%"+search+"%'";
						// ����BaseDao�в�ѯ��ͨ�÷���
						ResultSet rs = BaseDao.selectData(sql, null);
						while(rs.next()) {
							String id = rs.getString("gId");
							String name = rs.getString("gName");
							String price = rs.getString("gPrice");
							String caixi = rs.getString("gCaixi");
							String food = rs.getString("gFood");
							String num = rs.getString("gNum");
							String image = rs.getString("gImage");
							String details = rs.getString("gDetails");
							String shangjia = rs.getString("gShangjia");
							// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
							GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
									image, details, shangjia);// ʵ�������
							// ��ʵ������󱣴浽������
							list.add(info);
						}
						return list;
					}
					/**
					 * ��ѯ��ǰ�������ݵ�����
					 * @param search
					 * @return
					 * @throws SQLException
					 */
					public int num(String search) throws SQLException {
						int num=0;
						// ����Ҫִ�е�SQL���
						String sql = "select count(*) from goods where gShangjia=1 and gName like '%"+search+"%'";
						// ����BaseDao�в�ѯ��ͨ�÷���
						ResultSet rs = BaseDao.selectData(sql, null);
						while (rs.next()) {
							num = rs.getInt(1);
							// ��ʵ������󱣴浽������
						}
						return num;
					}
}
