<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%
  //逻辑处理
	request.setCharacterEncoding("utf-8");//设置字符编码
 //获得传递过来的参数
 String uId=request.getParameter("uId");
 String uName=request.getParameter("person.user_name");
 String uPass=request.getParameter("person.user_pass");
 String uRealname=request.getParameter("person.user_realname");
 String uEmail=request.getParameter("person.user_mail");
 String uBalance=request.getParameter("person.user_balance");
 String uTransPass=request.getParameter("transPass");
 String uSex=request.getParameter("person.user_sex");
  //调用订单UsersDao中根据id修改的方法
  UsersDao dao=new UsersDao();
  UsersInfo info=new UsersInfo(uId,uName,uPass,null,uRealname,uSex,uEmail,uTransPass,uBalance);
                                                      
  int res=dao.updataUsers(info);//根据用户ID修改用户信息
  if(res>0){
         session.setAttribute("404","修改成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","修改失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 
 %>