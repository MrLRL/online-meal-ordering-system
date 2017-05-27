package dao;
//�����ࣨ���ߣ��ܻ���

import java.sql.*;
import java.util.*;
import entity.*;

public class PinglunDao {
	/**
	 * ��ҳ��ѯ��ʾ����
	 * @param pIndex
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public List<PingjiasInfo> getNew(int pIndex,String gId) throws SQLException {
		List<PingjiasInfo> list = new ArrayList<PingjiasInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 5 * from pingjias,users where pId not in("
		+" select top "+((pIndex-1)*5)+" pId from pingjias) "
		+" and gId=? and users.uId=pingjias.uId order by pId desc";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={gId};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			String id = rs.getString("pId");
			String uId = rs.getString("uId");
			String gid = rs.getString("gId");
			String pContent = rs.getString("pContent");
			String pDate = rs.getString("pDate");
			String pLeixing = rs.getString("pLeixing");
			String uPetname = rs.getString("uPetname");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			PingjiasInfo info = new PingjiasInfo(id, uId, gid, pContent, pDate, pLeixing, uPetname);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ��ǰ��Ʒ��������
	 * @return
	 * @throws SQLException
	 */
	public int num(String gId) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from pingjias where gId=?";
		String para[]={gId};
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
	/**
	 * ��������������ʾ����
	 * @param pIndex
	 * @param leixing
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public List<PingjiasInfo> getleixing(int pIndex,String leixing,String gId) throws SQLException {
		List<PingjiasInfo> list = new ArrayList<PingjiasInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 5 * from pingjias,users where pId not in("
		+" select top "+((pIndex-1)*5)+" pId from pingjias) "
		+" and gId=? and users.uId=pingjias.uId and pLeixing=? order by pId desc";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={gId,leixing};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			String id = rs.getString("pId");
			String uId = rs.getString("uId");
			String gid = rs.getString("gId");
			String pContent = rs.getString("pContent");
			String pDate = rs.getString("pDate");
			String pLeixing = rs.getString("pLeixing");
			String uPetname = rs.getString("uPetname");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			PingjiasInfo info = new PingjiasInfo(id, uId, gid, pContent, pDate, pLeixing, uPetname);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯָ�������������
	 * @param leixing
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public int num1(String leixing,String gId) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from pingjias where gId=? and pLeixing=?";
		String para[]={gId,leixing};
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
}
