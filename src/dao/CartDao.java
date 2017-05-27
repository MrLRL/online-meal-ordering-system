package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import entity.*;
//���ﳵ�ࣨ���ߣ��ܻ���
public class CartDao {
	/**
	 * ��������ӵ����ﳵ
	 * @param c
	 * @return
	 */
	public int addCart(CartsInfo c){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="insert into carts(gCount,gId,uId,cBeizhu) values (?,?,?,?)";
		String[] para={c.getgCount(),c.getgId(),c.getuId(),c.getcBeizhu()};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * �޸Ĺ��ﳵ��ĳ����Ʒ�������ͱ�ע(���ݹ��ﳵID�����޸�)
	 * @param c
	 * @return
	 */
	public int updateCount(String Count,String Beizhu,String CartId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="update carts set gCount=?,cBeizhu=? where cartId=?";
		String[] para={Count,Beizhu,CartId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * �����û�ID��ѯ���û��Ĺ��ﳵ
	 * @param uid �û�ID
	 * @return
	 * @throws Exception
	 */
	public List<CartsInfo> getCarts(String uid) throws Exception{
		List<CartsInfo> list=new ArrayList<CartsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select * from carts where uId=?";
		String[] para={uid};
		//����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String cId=rs.getString("cartId");
			String count=rs.getString("gCount");
			String gId=rs.getString("gId");
		    String uId=rs.getString("uId");
		    String beizhu=rs.getString("cBeizhu");
			//ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
		    CartsInfo info=new CartsInfo(cId, count, gId, uId, beizhu);//ʵ�������
            list.add(info);//�����ݱ��浽������
		}
		return list;
	}
	
	/**
	 * ���ݹ��ﳵIDɾ�����ﳵ��Ϣ
	 * @param cartId
	 * @return
	 */
	public int close(String cartId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="delete from carts where cartId=?";
		String[] para={cartId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	
	/**
	 * ��ѯ��ʾ���ﳵ
	 * @param uId
	 * @return
	 */
	public List<CartsInfo> getCartInfo(String uId){
		List<CartsInfo> list=new ArrayList<CartsInfo>();
		//����Ҫִ�е�SQL���
		String sql="select cartId,gName,gPrice,gCount,goods.gId,cBeizhu"
				  +" from carts,goods"
				  +" where carts.gId=goods.gId and uId=?";
		String[] para={uId};
		//���ò�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		try {
			while(rs.next()){
				String cId=rs.getString("cartId");
				String name=rs.getString("gName");
				String price=rs.getString("gPrice");
				String count=rs.getString("gCount");
				String gId=rs.getString("gId");
				String beizhu=rs.getString("cBeizhu");
				//����һ�����ﳵʵ����
				CartsInfo info=new CartsInfo(cId, count, gId, name, beizhu, price);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * ��չ��ﳵ�ķ���(�����û�ID����ɾ��)
	 * @param uId �û�ID
	 * @return
	 */
	public int clearCart(String uId){
		int res=0;
		//����Ҫִ�е�SQL���
		String sql="delete from carts where uId=?";
		String[] para={uId};
		//����BaseDao�е�ͨ�÷���
		res=BaseDao.updateDate(sql, para);
		return res;
	}
	/**
	 * ��ѯ��ǰ�û����ﳵ�е�������
	 * @return ������
	 * @throws SQLException �׳�SQL�쳣
	 */
	public int num(String uId) throws SQLException {
		int num=0;
		// ����Ҫִ�е�SQL���
		String sql = "select count(*) from carts where uId=?";
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
	 * ���㹺�ﳵ�е���Ʒ�ܼ�
	 * @param uId
	 * @return
	 * @throws SQLException
	 */
	public double sum(String uId) throws SQLException {
		double sum=0;
		// ����Ҫִ�е�SQL���
		String sql = "select gCount,gPrice from carts,goods where carts.gId=goods.gId and uId=?";
		// ����BaseDao�в�ѯ��ͨ�÷���
		String para[]={uId};
		ResultSet rs = BaseDao.selectData(sql, para);
		while (rs.next()) {
			double count = rs.getDouble("gCount");
			double price = rs.getDouble("gPrice");
			sum=sum+count*price;
			// ��ʵ������󱣴浽������
		}
		return sum;
	}
	/**
	 * ������ƷID���û�ID��ѯ��Ӧ���ﳵ���Ƿ��Ѵ��ڸ���Ʒ
	 * @param gid ��ƷID
	 * @return ���ﳵ��Ϣ
	 * @throws Exception �׳��쳣
	 */
	public CartsInfo getCart(String gid,String uid) throws Exception{
		CartsInfo info=null;
		//����Ҫִ�е�SQL���
		String sql="select * from carts where gId=? and uId=?";
		String[] para={gid,uid};
		//����BaseDao�в�ѯ��ͨ�÷���
		ResultSet rs=BaseDao.selectData(sql, para);
		if(rs.next()){
			String cId=rs.getString("cartId");
			String count=rs.getString("gCount");
			String gId=rs.getString("gId");
		    String uId=rs.getString("uId");
		    String beizhu=rs.getString("cBeizhu");
			//ͨ�����캯�������ݱ��浽ʵ�������ĸ���������
		    info=new CartsInfo(cId, count, gId, uId, beizhu);//ʵ�������
		}
		return info;
	}
	
}