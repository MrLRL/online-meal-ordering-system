<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
  //修改用户信息操作（作者：周华）
   request.setCharacterEncoding("utf-8");//设置字符编码
   //判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
//读取当前用户信息
UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
   String name=request.getParameter("person.user_name");//接收用户名
   String pass=request.getParameter("person.user_pass");//接收密码
   String realname=request.getParameter("person.user_realname");//接收真实姓名
   String petname=request.getParameter("person.user_petname");//接收昵称
	 String sex=request.getParameter("person.user_sex");//接收性别
	 String mail=request.getParameter("person.user_mail");//接收邮箱
	 String transPass=request.getParameter("transPass");//接收交易密码
   UserDao dao=new UserDao();
   UsersInfo info=new UsersInfo(user.getuId(),name,pass,petname,realname,sex,mail,transPass,user.getuBalance());
   int res=dao.upUser(info);//执行修改操作
   if(res>0){
    session.setAttribute("LOGIN",info);
    session.setAttribute("404","修改成功！");
    response.sendRedirect("../index/xiugai.jsp");
   }else{
    session.setAttribute("404","修改失败！");
    response.sendRedirect("../index/404.jsp");
   }
%>