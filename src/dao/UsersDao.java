package dao;
//�û�������  �����ߣ���ԣ�
import java.sql.*;
import java.util.*;
import entity.*;

public class UsersDao {
	/**
	 *  ����û���Ϣ 
	 * @param info �û�ʵ����
	 * @return  ���������û���Ϣ
	 */
		public int addUsers(UsersInfo info){
			int res=0;
			//ִ��SQL���
			String sql="insert into users(uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass) values (?,?,?,?,?,?,?)";
			String[] para={info.getuName(),info.getuPass(),info.getuPetname(),info.getuRealname(),info.getuSex(),info.getuEmail(),info.getuTransPass()};
			//����BaseDao����ɾ�ķ���
			res=BaseDao.updateDate(sql, para);
				return res;
		}
	/**
	 * 	 ɾ���û���Ϣ 
	 * @param id �����û�idɾ��
	 * @return 
	 */
		public int deleteUsers(String id){
			int res=0;
			String sql="delete from users where uId=?";
			String[] para={id};
			//����BaseDao����ɾ�ķ���
			res=BaseDao.updateDate(sql, para);
			return res;
		}
	 /**
	  * �޸��û���Ϣ 
	  * @param info �û�ʵ����
	  * @return 
	  */
		public int updataUsers(UsersInfo info){
		    int res=0;
		    String sql="update users set uName=?,uPass=?,uPetname=?,uRealname=?,uSex=?,uBalance=?,uEmail=?,uTransPass=? where uId=?";
		    String[] para={info.getuName(),info.getuPass(),info.getuPetname(),info.getuRealname(),info.getuSex(),info.getuBalance(),info.getuEmail(),info.getuTransPass(),info.getuId()};
		  //����BaseDao����ɾ�ķ���
		    res=BaseDao.updateDate(sql, para);
			return res;
		}
		
		/**
		 * ��ѯ�û� 
		 * ��ҳ������ǰ�������ݵ�ǰ��������
		 * @param pIndex ��ǰҳ�� ����һҳ���ڶ�ҳ������ҳ��
		 * @param num ÿҳ��ʾ���������� 
		 * @return
		 * @throws SQLException
		 */
		/**
		 * ����ҳ���Ĵ��� 
		 * select top num * from users where uID not in(
		 * select top (pIndex-1)*num uID
		 * form users )
		   
		 */		  
		public List<UsersInfo> getAllUsers(int pIndex) throws SQLException{
			List<UsersInfo> list=new ArrayList<UsersInfo>();
			//����Ҫִ�е����
		 
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
				UsersInfo info=new UsersInfo(uId,uName,uPass,uPetname,uRealname,uSex,uEmail,uTransPass,uBalance);//ʵ�������
				//��ʵ������󱣴浽������
				list.add(info);	
			}
			return list;
		}
		/**
		 * ͨ��id �鿴�����û�
		 * @param Id
		 * @return
		 */
		public UsersInfo getUserById(String Id){
			UsersInfo info=null;
			//����Ҫִ�е�SQL���
			String sql="select * from users where uId=?";
			String[] para={Id};
			//���÷�����ִ��SQL���
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
		 * ��ѯ�û������ݵ����� 
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
