<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
<%
//注销操作（作者：周华）
    if(session.getAttribute("LOGIN")!=null){
	session.removeAttribute("LOGIN");//注销用户
    response.sendRedirect("../"+session.getAttribute("THIS"));//跳转到注销前的页面
	}else{
	session.removeAttribute("GUANLI");//注销管理员
    response.sendRedirect("../index.jsp");//跳转到首页
	}
%>