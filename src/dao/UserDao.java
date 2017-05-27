package dao;
//�û��� �����ߣ���ԡ��ܻ���
import java.sql.*;
import java.util.*;
import entity.*;
public class UserDao {
	/**
	 * ע�᷽�������ߣ���ԣ�
	 * @param user
	 * @return
	 */
	public int Reg(UsersInfo user){
		int res=0;
		String sql="insert into users(uName,uPass,uPetname,uRealname,uEmail,uTransPass,uSex) values (?,?,?,?,?,?,?)";
		String[] para={user.getuName(),user.getuPass(),user.getuPetname(),user.getuRealname(),user.getuEmail(),user.getuTransPass(),user.getuSex()};//������
		res=BaseDao.updateDate(sql, para);     //��ͨ�÷���
		return res;
			} 
	
	/**
	 * ��¼���������ߣ���ԣ�
	 * @param name
	 * @param pass
	 * @return ���ص�ǰ��¼�ߵ��������ݣ���ʵ�������
	 */
	 public UsersInfo login(String name,String pass){
			UsersInfo user=null;	
			  try {
				// ����ִ�ж���
				String sql="select * from users where uName=? and uPass=?";
				String[] para={name,pass}; 
				//  ����ͨ�÷���ִ��SQL���
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
	  * ����Ա�ĵ�¼���������ߣ���ԣ�
	  * @param name
	  * @param pass
	  * @return ���ص�ǰ����Ա���������ݣ���ʵ�������
	  */
	 public AdminInfo Adminlogin(String name,String pass){
		 AdminInfo user=null;	
			  try {
				// ����ִ�ж���
				String sql="select * from admin where Name=? and Pass=?";
				String[] para={name,pass}; 
				//  ����ͨ�÷���ִ��SQL���
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
	  * ����ע���û��Ƿ��Ѵ��ڣ����ߣ��ܻ���
	  * @return
	  */
	 public ArrayList<String> uName(){
		 ArrayList<String> list=new ArrayList<String>();
			  try {
				// ����ִ�ж���
				String sql="select uName from users";
				//  ����ͨ�÷���ִ��SQL���
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
		 * ȷ��֧�����޸ĵ�ǰ�û����˻������ߣ��ܻ���
		 * @param money �����
		 * @param uId �û�Id
		 * @return
		 */
		public int money(double money,String uId){
			int res=0;
			//����Ҫִ�е�SQL���
			String sql="update users set uBalance=? where uId=?";
			String[] para={money+"",uId};
			//����BaseDao�е�ͨ�÷���
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		/**
		 * �޸��û���Ϣ�����ߣ��ܻ���
		 * @param user
		 * @return
		 */
		public int upUser(UsersInfo user){
			int res=0;
			//����Ҫִ�е�SQL���
			String sql="update users set uName=?,uPass=?,uEmail=?,uRealname=?,uSex=?,uPetname=?,uTransPass=? where uId=?";
			String[] para={user.getuName(),user.getuPass(),user.getuEmail(),user.getuRealname(),user.getuSex(),user.getuPetname(),user.getuTransPass(),user.getuId()};
			//����BaseDao�е�ͨ�÷���
			res=BaseDao.updateDate(sql, para);
			return res;
		}
		/**
		 * �һ�������֤�û���ݣ����ߣ��ܻ���
		 * @param uName �û���
		 * @param uEmail ����
		 * @param uRealname ��ʵ����
		 * @return
		 */
		 public int zhaohui(String uName,String uEmail,String uRealname){
			 int res=0;
				  try {
					// ����ִ�ж���
					String sql="select count(*) from users where uName=? and uEmail=? and uRealname=?";
					String[] para={uName,uEmail,uRealname};
					//  ����ͨ�÷���ִ��SQL���
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
		  * �����û����޸����루���ߣ��ܻ���
		  * @param name �û���
		  * @param pass ����
		  * @return
		  */
			public int pass(String name,String pass){
				int res=0;
				//����Ҫִ�е�SQL���
				String sql="update users set uPass=? where uName=?";
				String[] para={pass,name};
				//����BaseDao�е�ͨ�÷���
				res=BaseDao.updateDate(sql, para);
				return res;
			}
			/**
			 * �ж������Ƿ��ѱ�ע��
			 * @return
			 */
			 public ArrayList<String> uEmail(){
				 ArrayList<String> list=new ArrayList<String>();
					  try {
						// ����ִ�ж���
						String sql="select uEmail from users";
						//  ����ͨ�÷���ִ��SQL���
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
