package dao;
//�û������ࣨ���ߣ��ܻ���
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.*;
public class NoteDao {
	/**
	 * �������
	 * @param l ����ʵ����
	 * @return
	 */
	public int addNote(LiuyansInfo l){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="insert into liuyans(uId,lBiaoti,lNeirong,lTime) values (?,?,?,?)";
		String[] para={l.getuId(),l.getlBiaoti(),l.getlNeirong(),l.getlTime()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * ��ҳ��ѯ��ǰ�û����Լ�¼
	 * @param pIndex ��ǰҳ��
	 * @param uId �û�ID
	 * @return
	 * @throws SQLException
	 */
	public List<LiuyansInfo> sel(int pIndex,String uid) throws SQLException {
		List<LiuyansInfo> list = new ArrayList<LiuyansInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 3 * from liuyans where lId not in("
		+" select top "+((pIndex-1)*3)+" lId from liuyans) and uId="+uid;
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while(rs.next()) {
			String id = rs.getString("lId");
			String uId = rs.getString("uId");
			String lBiaoti = rs.getString("lBiaoti");
			String lNeirong = rs.getString("lNeirong");
			String lTime = rs.getString("lTime");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			LiuyansInfo info = new LiuyansInfo(id, uId, lBiaoti, lNeirong, lTime);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ��ǰ�û�����������
	 * @param uId
	 * @return
	 * @throws SQLException
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from liuyans where uId=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={uId};
		ResultSet rs = BaseDao.selectData(sql, para);
		if (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
	/**
	 * ��ѯ����Ա�ظ���Ϣ
	 * @param lid
	 * @return
	 * @throws SQLException
	 */
	public HuifusInfo huifu(String lid) throws SQLException {
		HuifusInfo info =null;
		// ����Ҫִ�е�SQL���
		String sql = "select * from huifus where lId=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={lid};
		ResultSet rs = BaseDao.selectData(sql, para);
		if(rs.next()) {
			String id = rs.getString("fId");
			String lId = rs.getString("lId");
			String fNeirong = rs.getString("fNeirong");
			String fTime = rs.getString("fTime");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			info = new HuifusInfo(id, lId, fNeirong, fTime);// ʵ�������
			// ��ʵ������󱣴浽������
		}
		return info;
	}
}
