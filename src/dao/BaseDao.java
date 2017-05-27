package dao;

import java.sql.*;

//�������ݿ��ͨ���� 
public class BaseDao {
	//�ĸ��ַ���
	private static String DRIVAR="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String URL="jdbc:sqlserver://localhost:1433;DatabaseName=happy";
	private static String UNAME="sa";
	private static String UPASS="sasa";
	
	//��������
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	
	//�ĸ�����
	/**
	 * ������ӵķ���
	 */
	public static Connection getConnection(){
		try {
			//1����������
			Class.forName(DRIVAR);
			//2���������
			con=DriverManager.getConnection(URL,UNAME,UPASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * �ͷ���Դ
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
	 * ����ɾ���ĵ�ͨ�÷���
	 */
	public static int updateDate(String sql,String[] para){
		int res=0;
		try {
			con=getConnection();//�������
			ps=con.prepareStatement(sql);
			if(para!=null){     //���ִ�е�SQL����д��в���?
				for(int i=0;i<para.length;i++){
					ps.setString(i+1, para[i]);
				}
			}
			//���÷�����ִ��SQL���
			res=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(con, ps, null);//�ͷ���Դ
		}
		return res;
	}
	
	/**
	 * ��ѯ���ؽ������ͨ�÷���
	 */
	public static ResultSet selectData(String sql,String[] para){
		try {
			//1���������
			con=getConnection();
			//2������ִ�ж���
			ps=con.prepareStatement(sql);
			if(para!=null){
				for(int i=0;i<para.length;i++){
					ps.setString(i+1, para[i]);
				}
			}
			//3�����÷�����ִ��SQL���
			rs=ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
