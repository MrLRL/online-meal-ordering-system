<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
    //删除订单操作（作者：周华）
    String dId=request.getParameter("dId");//获得订单ID
    DetailDao dao=new DetailDao();
    int res=dao.delDetail(dId);//删除订单详情
    int res2=dao.delDingdan(dId);//删除订单
    if(res>0&&res2>0){
    	 response.sendRedirect("../order/queryOrder.jsp");
    }else{
         session.setAttribute("404","删除失败！");
    	 response.sendRedirect("../index/404.jsp");
    }
%>
