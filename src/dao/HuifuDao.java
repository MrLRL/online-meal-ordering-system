package dao;
//�ظ���  �����ߣ���ԣ�
import entity.*;
public class HuifuDao {	 
	 /**
	  *  �ظ���������
	  * @param info
	  * @return
	  */
			public int addHuifu(HuifusInfo info){
				int res=0;
				//ִ��SQL���
				String sql="insert into huifus(lId,fNeirong,fTime) values (?,?,?)";
				String[] para={info.getlId(),info.getfNeirong(),info.getfTime()};
				//����BaseDao����ɾ�ķ���
				res=BaseDao.updateDate(sql, para);
					return res;
			}
}
