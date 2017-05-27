<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<%
//找回密码验证（作者：周华）
    request.setCharacterEncoding("utf-8");//设置字符编码
    String name=request.getParameter("person.user_name");//获得用户名
    String realname=request.getParameter("person.user_realname");//获得真实姓名
    String mail=request.getParameter("person.user_mail");//获得邮箱
    UserDao dao=new UserDao();
    int res=dao.zhaohui(name, mail, realname);
    if(res>0){
    	 response.sendRedirect("../user/NewPass.jsp?uName="+name);
    }else{
         session.setAttribute("404","您输入的信息有误！");
    	 response.sendRedirect("../index/404.jsp");
    }
%>