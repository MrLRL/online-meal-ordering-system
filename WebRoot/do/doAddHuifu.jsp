<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java"  import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%   //添加操作(作者：徐辉)
  //逻辑处理
	//获得相关数据
	request.setCharacterEncoding("utf-8");//设置字符编码
	String lId=request.getParameter("lId");
	String neirong=request.getParameter("message.content");
	Date date=new Date();//获取当前时间
	DateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义时间格式
	String time=form.format(date);//将时间以字符串的格式储存
	//调用HuifuDao中的方法
	 HuifuDao dao=new HuifuDao();
	 HuifusInfo info=new HuifusInfo( "",lId,neirong,time);
     int res=dao.addHuifu(info);//用变量接收
     //根据结果判定是否回复成功
  if(res>0){
         session.setAttribute("404","回复成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","回复失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 
 %>