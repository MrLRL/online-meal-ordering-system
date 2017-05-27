<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<%
//添加地址信息（作者：周华）
   //判断是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
}
    UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
    request.setCharacterEncoding("utf-8");//设置字符编码
    String address=request.getParameter("shi")+request.getParameter("qu")+request.getParameter("jie")+" "+request.getParameter("juti");//获得地址
    String tel=request.getParameter("order_movPho");//获得电话号码
    String name=request.getParameter("order_name");//获得姓名
    AddressDao dao=new AddressDao();
    HarvestsInfo h=new HarvestsInfo(null,user.getuId(),address,name,tel);
    int res=dao.address(h);
    if(res>0){
    session.setAttribute("404","添加成功！");
    response.sendRedirect("../index/404.jsp");
    }else{
    session.setAttribute("404","添加失败！");
    response.sendRedirect("../index/404.jsp");
    }
%>