package dao;
//���������������ࣨ���ߣ��ܻ���

import java.sql.*;
import java.util.*;
import entity.*;

public class DetailDao {
	/**
	 * ���������Ʒ��ӵ������������
	 * @param de ���������ʵ����
	 * @return
	 */
	public int addDetail(DetailsInfo de){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="insert into details(gCount,gId,dId,deBeizhu) values (?,?,?,?)";
		String[] para={de.getgCount(),de.getgId(),de.getdId(),de.getDeBeizhu()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * ��������
	 * @param dd ������ʵ����
	 * @return
	 */
	public int addDingdan(DingdansInfo dd){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="insert into dingdans(dTime,dState,dPrice,uId,hId) values (?,?,?,?,?)";
		String[] para={dd.getdTime(),dd.getdState(),dd.getdPrice(),dd.getuId(),dd.gethId()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * �����û�ID��ѯ����ӵ���������������
	 * @param uId
	 * @return
	 */
	public DingdansInfo getDingdansInfo(String uId){
		DingdansInfo info=null;
		//����Ҫִ�е�SQL���
		String sql="select top 1 * from dingdans where uId=? order by dId desc";
		String[] para={uId};
		//���ò�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			if(rs.next()){
				String dId=rs.getString("dId");
				String time=rs.getString("dTime");
				String state=rs.getString("dState");
				String price=rs.getString("dPrice");
			    String uid=rs.getString("uId");
				String hId=rs.getString("hId");
				//����һ������ʵ����
				info=new DingdansInfo(dId, time, state, price, uid, hId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	/**
	 * ���ݶ���ID��ѯ�����������Ʒ�������Ϣ
	 * @param did ����ID
	 * @return
	 */
	public List<DetailsInfo> getDetail(String did){
		List<DetailsInfo> list=new ArrayList<DetailsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select gName,gCount,gPrice,deBeizhu from details,goods where details.gId=goods.gId and dId=?";
		String[] para={did};
		//���ò�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){
				String gName=rs.getString("gName");
				String count=rs.getString("gCount");
				String gPrice=rs.getString("gPrice");
				String deBeizhu=rs.getString("deBeizhu");
				//����һ����������ʵ����
				DetailsInfo info=new DetailsInfo(gName, count,deBeizhu,gPrice);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * ��ҳ��ѯ��ǰ�û�����
	 * @param pIndex ��ǰҳ��
	 * @param uId �û�ID
	 * @return
	 */
	public List<DingdansInfo> getDingdan(int pIndex,String uId){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//����Ҫִ�е�SQL���
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState " 
				  +"from dingdans,harvests "
				  +"where dingdans.hId=harvests.hId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and dingdans.uId=?";
		String[] para={uId};
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				//����һ������ʵ����
				DingdansInfo dingdan=new DingdansInfo(dId,null,null,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//��������ӵ�����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
	/**
	 * ��ѯ��ǰ�û�����������
	 * @param uId �û�ID
	 * @return
	 * @throws SQLException
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from dingdans where uId=?";
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
	 * ���ݶ���IDɾ����������
	 * @param dId ����ID
	 * @return
	 */
	public int delDetail(String dId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="delete from details where dId=?";
		String[] para={dId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * ���ݶ���IDɾ������
	 * @param dId ����ID
	 * @return
	 */
	public int delDingdan(String dId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="delete from dingdans where dId=?";
		String[] para={dId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * ���ݶ���ID�޸Ķ���״̬
	 * @param dId ����ID
	 * @param dState ����״̬
	 * @return
	 */
	public int updState(String dId,String dState){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="update dingdans set dState=? where dId=?";
		String[] para={dState,dId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
}
