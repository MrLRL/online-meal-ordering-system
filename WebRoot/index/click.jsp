<!-- 登录提示页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
<%
String click=(String)session.getAttribute("CLICK"); 
%>
</head>
<body>
<h1 align="center"><%=click %></h1><div align="center">
<%if(session.getAttribute("GUANLI")!=null){
%><a href="../Manage/manage_index.jsp">点击进入后台管理页面</a><br/>
<%}else if(session.getAttribute("LOGIN")!=null){
%><a href="../<%=session.getAttribute("THIS") %>">点击返回登录前的页面</a>&nbsp;
<a href="../index.jsp">点击进入首页</a><br/>
<%} %></div>
</body>
</html>