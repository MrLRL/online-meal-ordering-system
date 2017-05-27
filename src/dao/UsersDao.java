package dao;
//用户管理类  （作者：徐辉）
import java.sql.*;
import java.util.*;
import entity.*;

public class UsersDao {
	/**
	 *  添加用户信息 
	 * @param info 用户实体类
	 * @return  返回所有用户信息
	 */
		public int addUsers(UsersInfo info){
			int res=0;
			//执行SQL语句
			String sql="insert into users(uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass) values (?,?,?,?,?,?,?)";
			String[] para={info.getuName(),info.getuPass(),info.getuPetname(),info.getuRealname(),info.getuSex(),info.getuEmail(),info.getuTransPass()};
			//调用BaseDao中增删改方法
			res=BaseDao.updateDate(sql, para);
				return res;
		}
	/**
	 * 	 删除用户信息 
	 * @param id 根据用户id删除
	 * @return 
	 */
		public int deleteUsers(String id){
			int res=0;
			String sql="delete from users where uId=?";
			String[] para={id};
			//调用BaseDao中增删改方法
			res=BaseDao.updateDate(sql, para);
			return res;
		}
	 /**
	  * 修改用户信息 
	  * @param info 用户实体类
	  * @return 
	  */
		public int updataUsers(UsersInfo info){
		    int res=0;
		    String sql="update users set uName=?,uPass=?,uPetname=?,uRealname=?,uSex=?,uBalance=?,uEmail=?,uTransPass=? where uId=?";
		    String[] para={info.getuName(),info.getuPass(),info.getuPetname(),info.getuRealname(),info.getuSex(),info.getuBalance(),info.getuEmail(),info.getuTransPass(),info.getuId()};
		  //调用BaseDao中增删改方法
		    res=BaseDao.updateDate(sql, para);
			return res;
		}
		
		/**
		 * 查询用户 
		 * 分页：不在前几条数据的前几条数据
		 * @param pIndex 当前页数 （第一页，第二页，第三页）
		 * @param num 每页显示的条数（） 
		 * @return
		 * @throws SQLException
		 */
		/**
		 * 设置页数的代码 
		 * select top num * from users where uID not in(
		 * select top (pIndex-1)*num uID
		 * form users )
		   
		 */		  
		public List<UsersInfo> getAllUsers(int pIndex) throws SQLException{
			List<UsersInfo> list=new ArrayList<UsersInfo>();
			//设置要执行的语句
		 
			String sql="select top 10 * from users";
			sql=sql+" where uId not in(";
			sql=sql+" select top "+((pIndex-1)*10)+" uId from users)";	
			ResultSet rs=BaseDao.selectData(sql, null);
			while(rs.next()){
				String uId=rs.getString("uId");
				String uName=rs.getString("uName");
				String uPass=rs.getString("uPass");
				String uPetname=rs.getString("uPetname");
				String uRealname=rs.getString("uRealname");
				String uSex=rs.getString("uSex");
				String uEmail=rs.getString("uEmail");
				String uTransPass=rs.getString("uTransPass");
				String uBalance=rs.getString("uBalance");	
				UsersInfo info=new UsersInfo(uId,uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass,uBalance);//实体类对象
				//把实体类对象保存到集合中
				list.add(info);	
			}
			return list;
		}
		/**
		 * 通过id 查看所有用户
		 * @param Id
		 * @return
		 */
		public UsersInfo getUserById(String Id){
			UsersInfo info=null;
			//设置要执行的SQL语句
			String sql="select * from users where uId=?";
			String[] para={Id};
			//调用方法，执行SQL语句
		    ResultSet rs =	BaseDao.selectData(sql, para);
			try {
		    while(rs.next()){
				String uId=rs.getString("uId");
				String uName=rs.getString("uName");
				String uPass=rs.getString("uPass");
				String uPetname=rs.getString("uPetname");
				String uRealname=rs.getString("uRealname");
				String uSex=rs.getString("uSex");
				String uEmail=rs.getString("uEmail");
				String uTransPass=rs.getString("uTransPass");
				String uBalance=rs.getString("uBalance");	
				//uId,uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass,uBalance
				info=new UsersInfo(uId,uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass,uBalance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	    
		return info;		
	}
		/**
		 * 查询用户总数据的条数 
		 * @return
		 */
	   public int getCount(){
		   int res=0;
		   String sql="select count(*) from users";
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
}
