package dao;
//��Ʒ��(���ߣ��ܻ�)
import java.util.*;
import java.sql.*;
import entity.*;

public class GoodsDao {
	/**
	 * ��ѯ����ǰ���Ĳ�
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> getAll() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 3 * from goods where gShangjia=1 order by gNum desc";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * �����ѯ4����
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> get() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 4 * from goods where gShangjia=1 order by NEWID()";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ���µ��ĸ���
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsInfo> getNew() throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 4 * from goods where gShangjia=1 order by gId desc";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ����ID��ѯ��Ʒ��Ϣ
	 * @param gId
	 * @return
	 * @throws SQLException
	 */
	public  GoodsInfo xiangxi(String gId) throws SQLException {
		GoodsInfo info=null;
		// ����Ҫִ�е�SQL���
		String sql = "select * from goods where gId=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String[] para={gId};
		ResultSet rs = BaseDao.selectData(sql, para);
		if(rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
		}
		return info;
	}
	/**
	 * ��ҳ��ѯ������Ʒ��Ϣ
	 * @param pIndex ��ǰҳ��
	 * @return ����
	 * @throws SQLException �׳��쳣
	 */
	public List<GoodsInfo> sel(int pIndex) throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 12 * from goods where gId not in("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while(rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ��Ʒ������
	 * @return ��Ʒ������
	 * @throws SQLException
	 */
	public int num() throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from goods where gShangjia=1";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
	/**
	 * ���ݲ���������Ҫ�Ĳ˵�
	 * @param pIndex ҳ��
	 * @param search ����������
	 * @return ��Ʒ��
	 * @throws SQLException �׳�SQL�쳣
	 */
	public List<GoodsInfo> search(int pIndex,String search) throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 12 * from goods where gId not in ("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1"
		+" and gName like '%"+search+"%'";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while(rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ��ǰ�������ݵ�����
	 * @param search
	 * @return
	 * @throws SQLException
	 */
	public int num3(String search) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from goods where gShangjia=1 and gName like '%"+search+"%'";
		// ����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs = BaseDao.selectData(sql, null);
		while (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
	/**
	 * �����ѯ����ҳ��ʾ
	 * @param pIndex ҳ��
	 * @param gcaixi ��ϵ
	 * @return ��Ʒ����
	 * @throws SQLException
	 */
	public List<GoodsInfo> caixi(int pIndex,String gcaixi) throws SQLException {
		List<GoodsInfo> list = new ArrayList<GoodsInfo>();
		// ����Ҫִ�е�SQL���
		String sql = "select top 12 * from goods where gId not in ("
		+" select top "+((pIndex-1)*12)+" gId from goods) and gShangjia=1"
		+" and gCaixi=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={gcaixi};
		ResultSet rs = BaseDao.selectData(sql, para);
		while(rs.next()) {
			String id = rs.getString("gId");
			String name = rs.getString("gName");
			String price = rs.getString("gPrice");
			String caixi = rs.getString("gCaixi");
			String food = rs.getString("gFood");
			String num = rs.getString("gNum");
			String image = rs.getString("gImage");
			String details = rs.getString("gDetails");
			String shangjia = rs.getString("gShangjia");
			// ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
			GoodsInfo info = new GoodsInfo(id, name, price, caixi, food, num,
					image, details, shangjia);// ʵ�������
			// ��ʵ������󱣴浽������
			list.add(info);
		}
		return list;
	}
	/**
	 * ��ѯ��ǰ�����������
	 * @param caixi
	 * @return
	 * @throws SQLException
	 */
	public int num2(String caixi) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from goods where gShangjia=1 and gCaixi=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={caixi};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			num = rs.getInt(1);
			// ��ʵ������󱣴浽������
		}
		return num;
	}
	/**
	 * �޸���Ʒ�Ѿ����۵�����
	 * @param gNum ���ӵ�����
	 * @param gId ��ƷID
	 * @return
	 */
	public int upGood(String gNum,String gId){
	    int res=0;
	    String sql="update goods set gNum=gNum+? where gId=?";
	    String[] para={gNum,gId};
	  //����BaseDao����ɾ�ķ���
	    res=BaseDao.updateDate(sql, para);
		return res;
	}
}
