package dao;
//商品类(作者：周华)
import java.util.*;
import java.sql.*;
import entity.*;

public class GoodsDao {
	/**
	 * 查询销量前三的菜
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> getAll() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 3 * from goods where gShangjia=1 order by gNum desc";
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
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
	 * 随机查询4个菜
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> get() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 4 * from goods where gShangjia=1 order by NEWID()";
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
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
	 * 查询最新的四个菜
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> getNew() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 4 * from goods where gShangjia=1 order by gId desc";
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
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
	 * 根据ID查询商品信息
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public  GoodsInfo xiangxi(String gId) throws SQLException {
		GoodsInfo info=null;
		// 设置要执行的SQL语句
		String sql = "select * from goods where gId=?";
		// 调用BaseDao中查询的通用方法
		String[] para={gId};
		ResultSet rs = BaseDao.selectData(sql, para);
		if(rs.next()) {
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
			info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// 实体类对象
			// 把实体类对象保存到集合中
		}
		return info;
	}
	/**
	 * 分页查询所有商品信息
	 * @param pIndex 当前页数
	 * @return 集合
	 * @throws SQLException 抛出异常
	 */
	public List<GoodsInfo> sel(int pIndex) throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 12 * from goods where gId not in("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1";
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
	 * 查询商品总条数
	 * @return 商品总条数
	 * @throws SQLException
	 */
	public int num() throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from goods where gShangjia=1";
		// 调用BaseDao中查询的通用方法
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
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
		String sql = "select top 12 * from goods where gId not in ("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1"
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
	public int num3(String search) throws SQLException {
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
	/**
	 * 分类查询，分页显示
	 * @param pIndex 页数
	 * @param gcaixi 菜系
	 * @return 商品数组
	 * @throws SQLException
	 */
	public List<GoodsInfo> caixi(int pIndex,String gcaixi) throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// 设置要执行的SQL语句
		String sql = "select top 12 * from goods where gId not in ("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1"
		+" and gCaixi=?";
		// 调用BaseDao中查询的通用方法
		String para[]={gcaixi};
		ResultSet rs = BaseDao.selectData(sql, para);
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
	 * 查询当前分类的总数量
	 * @param caixi
	 * @return
	 * @throws SQLException
	 */
	public int num2(String caixi) throws SQLException {
		int num=0;
		// 设置要执行的SQL语句
		String sql = "select count(*) from goods where gShangjia=1 and gCaixi=?";
		// 调用BaseDao中查询的通用方法
		String para[]={caixi};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// 把实体类对象保存到集合中
		}
		return num;
	}
	/**
	 * 修改商品已经销售的数量
	 * @param gNum 增加的数量
	 * @param gId 商品ID
	 * @return
	 */
	public int upGood(String gNum,String gId){
	    int res=0;
	    String sql="update goods set gNum=gNum+? where gId=?";
	    String[] para={gNum,gId};
	  //调用BaseDao中增删改方法
	    res=BaseDao.updateDate(sql, para);
		return res;
	}
}
