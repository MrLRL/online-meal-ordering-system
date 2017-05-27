package dao;
//��ַ�ࣨ���ߣ��ܻ���
import java.util.*;
import entity.*;
import java.sql.*;
public class AddressDao {
	/**
	 * ��������ӵ���ַ��
	 * @param c
	 * @return
	 */
	public int address(HarvestsInfo h){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="insert into Harvests(uId,hName,hTel,hAddress) values (?,?,?,?)";
		String[] para={h.getuId(),h.gethName(),h.gethTel(),h.gethAddress()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * �����û�ID��ѯ���û��ĵ�ַ��Ϣ
	 * @param uid �û�ID
	 * @return
	 * @throws Exception
	 */
	public List<HarvestsInfo> getRess(String uid) throws Exception{
		List<HarvestsInfo> list=new ArrayList<HarvestsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select * from harvests where uId=?";
		String[] para={uid};
		//����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String address=rs.getString("hAddress");
		    String name=rs.getString("hName");
		    String tel=rs.getString("hTel");
			//ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
		    HarvestsInfo info=new HarvestsInfo(hId, uId, address, name, tel);//ʵ�������
            list.add(info);//�����ݱ��浽������
		}
		return list;
	}
	/**
	 * ���ݵ�ַID��ѯ��ַ��Ϣ
	 * @param hid ��ַID
	 * @return
	 * @throws Exception
	 */
	public HarvestsInfo upRess(String hid) throws Exception{
		HarvestsInfo info=null;
		//����Ҫִ�е�SQL���
		String sql="select * from harvests where hId=?";
		String[] para={hid};
		//����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String hId=rs.getString("hId");
			String uId=rs.getString("uId");
			String address=rs.getString("hAddress");
		    String name=rs.getString("hName");
		    String tel=rs.getString("hTel");
			//ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
		    info=new HarvestsInfo(hId, uId, address, name, tel);//ʵ�������
		}
		return info;
	}
	/**
	 * �޸ĵ�ַ��Ϣ
	 * @param h
	 * @return
	 */
	public int upAddress(HarvestsInfo h){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="update harvests set hAddress=?,hName=?,hTel=? where hId=?";
		String[] para={h.gethAddress(),h.gethName(),h.gethTel(),h.gethId()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
