<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<%
//删除地址（作者：周华）
	request.setCharacterEncoding("utf-8");//设置字符编码
	String hId=request.getParameter("hId");//获得地址ID
	HarvestsDao dao=new HarvestsDao();
	int res=dao.delete(hId);//调用删除的方法
    if(res>0){
    	 response.sendRedirect("../user/message.jsp");
    }else{   
         session.setAttribute("404","删除失败！");
    	 response.sendRedirect("../index/404.jsp");
    }
%>