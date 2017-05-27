<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
<%
       
//立即购买（作者：周华）
   //判断是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
} 
   request.setCharacterEncoding("utf-8");//设置字符编码
   String gId=request.getParameter("gId");//接收gId参数并据此查找goods对象
   int num=Integer.parseInt(request.getParameter("num"));//接收数量
   String notice=request.getParameter("notice");//接收备注
   UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");//获得用户参数
   GoodsDao dao=new GoodsDao();
   GoodsInfo good=dao.xiangxi(gId);//查询商品相关信息
   String dPrice=Double.parseDouble(good.getgPrice())*num+"";//订单总价
   //临时保存立即购买的商品信息
   DingdansInfo info=new DingdansInfo(null,gId,dPrice,num+"",notice,good.getgName(),good.getgPrice());
   session.setAttribute("LIJI", info);
   if(session.getAttribute("LIJI")!=null){
    response.sendRedirect("../Book/shipping_Step3_.jsp");
    }else{
    session.setAttribute("404","系统出错啦！请联系管理员！");
    response.sendRedirect("../index/404.jsp");
    }
%>