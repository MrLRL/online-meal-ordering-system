<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<%
//找回密码验证（作者：周华）
    request.setCharacterEncoding("utf-8");//设置字符编码
    String name=request.getParameter("uName");//获得用户名
    String pass=request.getParameter("person.user_pass");//获得密码
    UserDao dao=new UserDao();
    int res=dao.pass(name, pass);
    if(res>0){
         session.setAttribute("404","修改成功！");
    	 response.sendRedirect("../index/404.jsp");
    }else{
         session.setAttribute("404","修改失败！");
    	 response.sendRedirect("../index/404.jsp");
    }
%>