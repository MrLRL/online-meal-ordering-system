package dao;
//��ʾʱ���ࣨ���ߣ��ܻ���
import java.text.*;
public class Time {
	/**
	 * ��ʱ�䰴����Ҫ�ĸ�ʽ��ʾ��ҳ����
	 * @param Time ���ݿ��л�õ�ʱ��
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
