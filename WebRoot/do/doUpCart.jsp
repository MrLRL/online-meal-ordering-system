<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
<% 
//修改购物车（作者：周华）
   request.setCharacterEncoding("utf-8");//设置字符编码
   String CartId=request.getParameter("cId");//接收购物车ID
   String Count=request.getParameter("count");//接收商品数量
   String Beizhu=request.getParameter("beizhu");//接收备注
   CartDao dao=new CartDao();
   int res=dao.updateCount(Count, Beizhu, CartId);//执行修改操作
   if(res>0){
   response.sendRedirect("../Book/shipping_Step2.jsp");
   }else{
    session.setAttribute("404","修改失败！");
    response.sendRedirect("../index/404.jsp");
   }
   %>