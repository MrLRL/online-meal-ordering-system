package dao;
//用户类 （作者：徐辉、周华）
import java.sql.*;
import java.util.*;
import entity.*;
public class UserDao {
	/**
	 * 注册方法（作者：徐辉）
	 * @param user
	 * @return
	 */
	public int Reg(UsersInfo user){
		int res=0;
		String sql="insert into users(uName,uPass,uPetname,uRealname,uEmail,uTransPass,uSex) values (?,?,?,?,?,?,?)";
		String[] para={user.getuName(),user.getuPass(),user.getuPetname(),user.getuRealname(),user.getuEmail(),user.getuTransPass(),user.getuSex()};//参数？
		res=BaseDao.updateDate(sql, para);     //用通用方法
		return res;
			} 
	
	/**
	 * 登录方法（作者：徐辉）
	 * @param name
	 * @param pass
	 * @return 返回当前登录者的所有数据，即实体类对象
	 */
	 public UsersInfo login(String name,String pass){
			UsersInfo user=null;	
			  try {
				// 创建执行对象
				String sql="select * from users where uName=? and uPass=?";
				String[] para={name,pass}; 
				//  调用通用方法执行SQL语句
				ResultSet rs=BaseDao.selectData(sql, para);
				while(rs.next()){
					String uId=rs.getString("uId");
					String uName=rs.getString("uName");
					String uPass=rs.getString("uPass");
					String uPetname=rs.getString("uPetname");
				    String uRealname=rs.getString("uRealname");
				    String uSex=rs.getString("uSex");
				    String uEmail=rs.getString("uEmail");
				    String uBalance=rs.getString("uBalance");
				    String uTransPass=rs.getString("uTransPass");
					 user=new UsersInfo(uId,uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass, uBalance);
						}		 
				} catch (Exception e) {
					e.printStackTrace();
			}
			return user;					 
		}
	 	  
	 /**
	  * 管理员的登录方法（作者：徐辉）
	  * @param name
	  * @param pass
	  * @return 返回当前管理员的所有数据，即实体类对象
	  */
	 public AdminInfo Adminlogin(String name,String pass){
		 AdminInfo user=null;	
			  try {
				// 创建执行对象
				String sql="select * from admin where Name=? and Pass=?";
				String[] para={name,pass}; 
				//  调用通用方法执行SQL语句
				ResultSet rs=BaseDao.selectData(sql, para);
				if(rs.next()){
					String  Id=rs.getString("Id");
					String  Name=rs.getString("Name");
					String  Pass=rs.getString("Pass");
					String  Petname=rs.getString("PetName");
					 user=new AdminInfo( Id,Name,Pass,Petname);
					 }
				} catch (Exception e) {
					e.printStackTrace();
			}
			return user;					 
		}
	 /**
	  * 查找注册用户是否已存在（作者：周华）
	  * @return
	  */
	 public ArrayList<String> uName(){
		 ArrayList<String> list=new ArrayList<String>();
			  try {
				// 创建执行对象
				String sql="select uName from users";
				//  调用通用方法执行SQL语句
				ResultSet rs=BaseDao.selectData(sql, null);
				while(rs.next()){
					String uName=rs.getString(1);
					list.add(uName);
						}		 
				} catch (Exception e) {
					e.printStackTrace();
			}
			return list;					 
		}
		/**
		 * 确认支付，修改当前用户的账户余额（作者：周华）
		 * @param money 新余额
		 * @param uId 用户Id
		 * @return
		 */
		public int money(double money,String uId){
			int res=0;
			//设置要执行的SQL语句
			String sql="update users set uBalance=? where uId=?";
			String[] para={money+"",uId};
			//调用BaseDao中的通用方法
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		/**
		 * 修改用户信息（作者：周华）
		 * @param user
		 * @return
		 */
		public int upUser(UsersInfo user){
			int res=0;
			//设置要执行的SQL语句
			String sql="update users set uName=?,uPass=?,uEmail=?,uRealname=?,uSex=?,uPetname=?,uTransPass=? where uId=?";
			String[] para={user.getuName(),user.getuPass(),user.getuEmail(),user.getuRealname(),user.getuSex(),user.getuPetname(),user.getuTransPass(),user.getuId()};
			//调用BaseDao中的通用方法
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		/**
		 * 找回密码验证用户身份（作者：周华）
		 * @param uName 用户名
		 * @param uEmail 邮箱
		 * @param uRealname 真实姓名
		 * @return
		 */
		 public int zhaohui(String uName,String uEmail,String uRealname){
			 int res=0;
				  try {
					// 创建执行对象
					String sql="select count(*) from users where uName=? and uEmail=? and uRealname=?";
					String[] para={uName,uEmail,uRealname};
					//  调用通用方法执行SQL语句
					ResultSet rs=BaseDao.selectData(sql, para);
					if(rs.next()){
						res=rs.getInt(1);
							}		 
					} catch (Exception e) {
						e.printStackTrace();
				}
				return res;					 
			}
		 /**
		  * 根据用户名修改密码（作者：周华）
		  * @param name 用户名
		  * @param pass 密码
		  * @return
		  */
			public int pass(String name,String pass){
				int res=0;
				//设置要执行的SQL语句
				String sql="update users set uPass=? where uName=?";
				String[] para={pass,name};
				//调用BaseDao中的通用方法
				res=BaseDao.updateDate(sql, para);
				return res;
			}
			/**
			 * 判断邮箱是否已被注册
			 * @return
			 */
			 public ArrayList<String> uEmail(){
				 ArrayList<String> list=new ArrayList<String>();
					  try {
						// 创建执行对象
						String sql="select uEmail from users";
						//  调用通用方法执行SQL语句
						ResultSet rs=BaseDao.selectData(sql, null);
						while(rs.next()){
							String uEmail=rs.getString(1);
							list.add(uEmail);
								}		 
						} catch (Exception e) {
							e.printStackTrace();
					}
					return list;					 
				}
}
