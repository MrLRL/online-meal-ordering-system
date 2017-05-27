<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
<% 
//加入购物车（作者：周华）
   //判断是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
} 
   request.setCharacterEncoding("utf-8");//设置字符编码
   String goodId=request.getParameter("gId");//接收gId参数并据此查找goods对象
   String num=request.getParameter("num");//接收数量
   String notice=request.getParameter("notice");//接收备注
   CartDao dao=new CartDao();
   UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
   CartsInfo cart=dao.getCart(goodId,user.getuId());//查找商品对应的购物车
   if(cart!=null){//购物车中已经存在该商品
   cart.setgCount(Integer.parseInt(cart.getgCount())+Integer.parseInt(num)+"");//只对该书本的数量加n
   dao.updateCount(cart.getgCount(),notice, cart.getCartId());
         session.setAttribute("CART","添加成功！");
    	 response.sendRedirect("../index/tishi.jsp");
   }else{//该商品不存在
   CartsInfo c=new CartsInfo(null,num,goodId,user.getuId(),notice);
         dao.addCart(c);//将数据添加到数据库
         session.setAttribute("CART","添加成功！");
    	 response.sendRedirect("../index/tishi.jsp");
   }
%>