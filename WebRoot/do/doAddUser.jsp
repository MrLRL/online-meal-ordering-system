<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%   //添加操作(作者：徐辉)
  //逻辑处理
	//获得相关数据
	request.setCharacterEncoding("utf-8");//设置字符编码
	String uName=request.getParameter("person.user_name");
	String uPass=request.getParameter("person.user_pass");
	String uRealname=request.getParameter("person.user_realname");
	String uEmail=request.getParameter("person.user_mail");
	 String uTransPass=request.getParameter("transPass");
	  String uSex=request.getParameter("person.user_sex");
	   
	 //out.print(uName+uPass+uRealname+uEmail+uTransPass+uSex);
	//调用UsersDao中的方法
	 UsersDao dao=new UsersDao();
	 UsersInfo info=new UsersInfo("",uName,uPass,"",uRealname,uSex,uEmail ,uTransPass,"");
     int res=dao.addUsers(info); //用变量接收
     //根据结果判定是否添加成功
   if(res>0){
         session.setAttribute("404","添加成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","添加失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 %>
 