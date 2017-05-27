package dao;
//����������
import java.sql.*;
import java.util.*;
import entity.*;

public class DingdansDao {

	/**
	 * ���ݶ���״̬��ҳ��ѯ����
	 * @param pIndex ��ǰҳ��
	 * @return
	 */
	public List<DingdansInfo> getDingdan2(int pIndex,String dStade){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//����Ҫִ�е�SQL���
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and dState=?";
		String para[]={dStade};
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//����һ������ʵ����
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//��������ӵ�����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
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
	 * ��ѯ����������
	 * @return
	 * @throws SQLException
	 */
	public int num1() throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from dingdans";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		if (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}

	/**
	 * ��ҳ��ѯ����
	 * @param pIndex ��ǰҳ��
	 * @return
	 */
	public List<DingdansInfo> getDingdan1(int pIndex){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//����Ҫִ�е�SQL���
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans)";
		ResultSet rs=BaseDao.selectData(sql, null);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//����һ������ʵ����
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//��������ӵ�����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
	/**
	 * �����������ݷ�ҳ��ѯ����
	 * @param pIndex ��ǰҳ��
	 * @return
	 */
	public List<DingdansInfo> getDingdan3(int pIndex,String search){
		List<DingdansInfo> list=new ArrayList<DingdansInfo>();
		//����Ҫִ�е�SQL���
		String sql="select top 10 dId,dPrice,hTel,dTime,hAddress,dState,uPetname,users.uId " 
				  +"from dingdans,harvests,users "
				  +"where dingdans.hId=harvests.hId and users.uId=harvests.uId and users.uId=dingdans.uId "
				  +"and dId not in "
			      +"(select top "+((pIndex-1)*10)+" dId from dingdans) and uPetname like '%"+search+"%'";
		ResultSet rs=BaseDao.selectData(sql, null);
		try {
			while(rs.next()){ 
				String dId =rs.getString("dId");
				String  dPrice=rs.getString("dPrice");
				String  hTel=rs.getString("hTel");
				String  dTime=rs.getString("dTime");
				String  hAddress=rs.getString("hAddress");
				String  state=rs.getString("dState");
				String  uPetname=rs.getString("uPetname");
				String  uId=rs.getString("uId");
				//����һ������ʵ����
				DingdansInfo dingdan=new DingdansInfo(dId,uId,uPetname,dPrice,hTel,dTime,hAddress,state);
				list.add(dingdan);//��������ӵ�����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	  return list;
	}
}
