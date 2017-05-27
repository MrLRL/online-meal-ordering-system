package dao;
   //菜单管理（作者：徐辉）
import java.util.*;
import java.sql.*;

import entity.*;
public class CaidanDao {
 /**
  *  查看菜单相关信息并且实现分页 
  * @param pIndex 当前页数 （第一页，第二页，第三页）
  * @return
  */
	public List<GoodsInfo> selectGoods(int pIndex){
		List<GoodsInfo> list=new ArrayList<GoodsInfo>();
		//设置要执行的SQL语句
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
	  * 查看所有菜单 
	  * @param Id
	  * @return
	  */
		public GoodsInfo getGood(String Id){
			GoodsInfo info=null;
			//设置要执行的SQL语句
			String sql="select * from goods";
			String[] para={Id};
			//调用方法，执行SQL语句
		    ResultSet rs =	BaseDao.selectData(sql, para);
			try {
				while(rs.next()){
					//gId,gName,gPrice,gCaixsi,gFood,gNum,gImage,gDetails,gShangjia
					String gId=rs.getString("gId");
					String gName=rs.getString("gName");
					String gPrice=rs.getString("gPrice");
					String gCaixi=rs.getString("gCaixi");//菜系
					String gFood=rs.getString("gFood");
					String gNum=rs.getString("gNum");   
					String gImage=rs.getString("gImage");
					String gDetails=rs.getString("gDetails");//简介
					String gShangjia=rs.getString("gShangjia");//商品状态 
					info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	    
			return info;		
		}
		 /**
		  *通过id 查看所有菜单 
		  * @param Id
		  * @return
		  */
			public GoodsInfo getGoodById(String Id){
				GoodsInfo info=null;
				//设置要执行的SQL语句
				String sql="select * from goods where gId=?";
				String[] para={Id};
				//调用方法，执行SQL语句
			    ResultSet rs =	BaseDao.selectData(sql, para);
				try {
					while(rs.next()){
						//gId,gName,gPrice,gCaixsi,gFood,gNum,gImage,gDetails,gShangjia
						String gId=rs.getString("gId");
						String gName=rs.getString("gName");
						String gPrice=rs.getString("gPrice");
						String gCaixi=rs.getString("gCaixi");//菜系
						String gFood=rs.getString("gFood");
						String gNum=rs.getString("gNum");   
						String gImage=rs.getString("gImage");
						String gDetails=rs.getString("gDetails");//简介
						String gShangjia=rs.getString("gShangjia");//商品状态 
						info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}	    
				return info;		
			}

		/**
		 * 添加菜单 
		 * @param info
		 * @return
		 */
				public int addGoods(GoodsInfo info){
					int res=0;
					//执行SQL语句
					String sql="insert into goods(gName,gPrice,gCaixi,gFood,gNum,gImage,gDetails,gShangjia) values (?,?,?,?,?,?,?,?)";
					String[] para={info.getgName(),info.getgPrice(),info.getgCaixi(),info.getgFood(),info.getgNum(),info.getgImage(),info.getgDetails(),info.getgShangjia()};
					//调用BaseDao中增删改方法
					res=BaseDao.updateDate(sql, para);
						return res;
				}
	   /**
		 * 删除菜单 (根据菜单id)
		 * @param id
		 * @return
		 */
				public int delectGoods(String id){
					int res=0;
					String sql="delete from goods where gId=?";
					String[] para={id};
					//调用BaseDao中增删改方法
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * 修改商品（菜单）
				 * @param info
				 * @return
				 */
				public int upCaidan(GoodsInfo info){
				    int res=0;
				    String sql="update goods set gName=?,gCaixi=?,gPrice=?,gFood=?,gDetails=?,gImage=?,gNum=? where gId=?";
				    String[] para={info.getgName(),info.getgCaixi(),info.getgPrice(),info.getgFood(),info.getgDetails(),info.getgImage(),info.getgNum(),info.getgId()};
				  //调用BaseDao中增删改方法
				    res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * 修改商品状态（菜单）
				 * @param info
				 * @return
				 */
				public int upCaidanZT(GoodsInfo info){
				    int res=0;
				    String sql="update goods set gShangjia=? where gId=?";
				    String[] para={info.getgShangjia(),info.getgId()};
				  //调用BaseDao中增删改方法
				    res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * 根据商品ID删除购物车信息
				 * @param gid
				 * @return
				 */
				public int close(String gId){
					int res=0;
					//设置要执行的SQL语句
					String sql="delete from carts where gId=?";
					String[] para={gId};
					//调用BaseDao中的通用方法
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				/**
				 * 根据商品ID删除评价信息
				 * @param gid
				 * @return
				 */
				public int closepj(String gId){
					int res=0;
					//设置要执行的SQL语句
					String sql="delete from pingjias where gId=?";
					String[] para={gId};
					//调用BaseDao中的通用方法
					res=BaseDao.updateDate(sql, para);
					return res;
				}
				 /**
				  *  查找菜单总条数 
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
					 * 根据菜名搜索需要的菜单
					 * @param pIndex 页数
					 * @param search 搜索框内容
					 * @return 商品组
					 * @throws SQLException 抛出SQL异常
					 */
					public List<GoodsInfo> search(int pIndex,String search) throws SQLException {
						List<GoodsInfo> list = new ArrayList<GoodsInfo>();
						// 设置要执行的SQL语句
						String sql = "select top 5 * from goods where gId not in ("
						+" select top "+((pIndex-1)*5)+" gId from goods) and gShangjia=1"
						+" and gName like '%"+search+"%'";
						// 调用BaseDao中查询的通用方法
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
							// 通过构造函数把数据保存到实体类对象的各个属性中
							GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
									image, details, shangjia);// 实体类对象
							// 把实体类对象保存到集合中
							list.add(info);
						}
						return list;
					}
					/**
					 * 查询当前搜索内容的数量
					 * @param search
					 * @return
					 * @throws SQLException
					 */
					public int num(String search) throws SQLException {
						int num=0;
						// 设置要执行的SQL语句
						String sql = "select count(*) from goods where gShangjia=1 and gName like '%"+search+"%'";
						// 调用BaseDao中查询的通用方法
						ResultSet rs = BaseDao.selectData(sql, null);
						while (rs.next()) {
							num = rs.getInt(1);
							// 把实体类对象保存到集合中
						}
						return num;
					}
}
