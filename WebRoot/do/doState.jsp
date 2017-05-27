<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
    //修改订单状态操作（作者：周华）
    String dId=request.getParameter("dId");//获得订单ID
    String dState=request.getParameter("dState");//获得新订单状态
    DetailDao dao=new DetailDao();
    int res=dao.updState(dId, dState);//执行修改
    
    if(res>0){
    session.setAttribute("404","操作成功！");
    response.sendRedirect("../index/404.jsp");
    }else{
    session.setAttribute("404","操作失败！");
    response.sendRedirect("../index/404.jsp");
    }
%>