<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
   //修改地址信息操作（作者：周华）
     //判断是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
}
//获得用户相关信息
UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
    request.setCharacterEncoding("utf-8");//设置字符编码
    String hId=request.getParameter("id");//获得地址ID
    String address=request.getParameter("juti");//获得地址
    String tel=request.getParameter("order_movPho");//获得电话号码
    String name=request.getParameter("order_name");//获得姓名
    AddressDao dao=new AddressDao();
    HarvestsInfo info=new HarvestsInfo(hId,user.getuId(),address,name,tel);
    int res=dao.upAddress(info);
    if(res>0){
    session.setAttribute("404","修改成功！");
    response.sendRedirect("../index/xiugai.jsp");
    }else{
    session.setAttribute("404","修改失败！");
    response.sendRedirect("../index/404.jsp");
    }
%>