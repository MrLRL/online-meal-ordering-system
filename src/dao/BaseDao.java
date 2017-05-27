package dao;

import java.sql.*;

//操作数据库的通用类 
public class BaseDao {
	//四个字符串
	private static String DRIVAR="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String URL="jdbc:sqlserver://localhost:1433;DatabaseName=happy";
	private static String UNAME="sa";
	private static String UPASS="sasa";
	
	//三个对象
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	
	//四个方法
	/**
	 * 获得连接的方法
	 */
	public static Connection getConnection(){
		try {
			//1、加载驱动
			Class.forName(DRIVAR);
			//2、获得连接
			con=DriverManager.getConnection(URL,UNAME,UPASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * 释放资源
	 */
	public static void closeAll(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(con!=null){
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 增，删，改的通用方法
	 */
	public static int updateDate(String sql,String[] para){
		int res=0;
		try {
			con=getConnection();//获得连接
			ps=con.prepareStatement(sql);
			if(para!=null){     //如果执行的SQL语句中带有参数?
				for(int i=0;i<para.length;i++){
					ps.setString(i+1, para[i]);
				}
			}
			//调用方法，执行SQL语句
			res=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(con, ps, null);//释放资源
		}
		return res;
	}
	
	/**
	 * 查询返回结果集的通用方法
	 */
	public static ResultSet selectData(String sql,String[] para){
		try {
			//1、获得连接
			con=getConnection();
			//2、创建执行对象
			ps=con.prepareStatement(sql);
			if(para!=null){
				for(int i=0;i<para.length;i++){
					ps.setString(i+1, para[i]);
				}
			}
			//3、调用方法，执行SQL语句
			rs=ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
