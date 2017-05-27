package dao;
//��ַ�ࣨ���ߣ��ܻ���
import java.sql.*;
import java.util.*;
import entity.*;

public class HarvestsDao {
	/**
	 * �����û�ID��ѯ�û�����ĵ�ַ��Ϣ
	 * @param uid �û�ID
	 * @return ��ַ��Ϣ����
	 * @throws Exception �׳��쳣
	 */
	public List<HarvestsInfo> getHarvests(String uid) throws Exception{
		//��������
		List<HarvestsInfo> list=new ArrayList<HarvestsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select * from harvests where uId=?";
		String[] para={uid};
		//����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		while(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String hAddress=rs.getString("hAddress");
		    String hName=rs.getString("hName");
		    String hTel=rs.getString("hTel");
			//ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
		    HarvestsInfo har=new HarvestsInfo(hId, uId, hAddress, hName, hTel);//ʵ�������
			//��ʵ������󱣴浽������
			list.add(har);
		}
		return list;
	}
	/**
	 * ���ݵ�ַIDɾ���ջ���Ϣ
	 * @param hId
	 * @return
	 */
	public int delete(String hId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="delete from harvests where hId=?";
		String[] para={hId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
