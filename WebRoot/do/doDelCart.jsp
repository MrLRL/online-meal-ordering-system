<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<%
//删除购物车（作者：周华）
	request.setCharacterEncoding("utf-8");//设置字符编码
	String cId=request.getParameter("cId");//获得购物车ID
	CartDao dao=new CartDao();
	int res=dao.close(cId);//执行删除操作
    if(res>0){
    	 response.sendRedirect("../Book/shipping_Step2.jsp");
    }else{   
         session.setAttribute("404","删除失败！");
    	 response.sendRedirect("../index/404.jsp");
    }
%>