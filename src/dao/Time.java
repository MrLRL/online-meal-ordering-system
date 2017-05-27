package dao;
//显示时间类（作者：周华）
import java.text.*;
public class Time {
	/**
	 * 将时间按照想要的格式显示到页面上
	 * @param Time 数据库中获得的时间
	 * @return
	 */
	public static String time(String Time){
		String str=null;
	    DateFormat Format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			str = Format.format(Format.parse(Time));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return str;
	}
}
