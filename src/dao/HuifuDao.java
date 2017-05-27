package dao;
//回复类  （作者：徐辉）
import entity.*;
public class HuifuDao {	 
	 /**
	  *  回复留言内容
	  * @param info
	  * @return
	  */
			public int addHuifu(HuifusInfo info){
				int res=0;
				//执行SQL语句
				String sql="insert into huifus(lId,fNeirong,fTime) values (?,?,?)";
				String[] para={info.getlId(),info.getfNeirong(),info.getfTime()};
				//调用BaseDao中增删改方法
				res=BaseDao.updateDate(sql, para);
					return res;
			}
}
