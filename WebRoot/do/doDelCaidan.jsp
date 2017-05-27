<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*"  pageEncoding="utf-8"%>
 <%
  //获得传递过来的参数
 String gId=request.getParameter("gId");
  //调用订单CaidanDao中根据id删除的方法
  CaidanDao dao=new CaidanDao();
 dao.close(gId);//根据商品ID删除购物车信息
 dao.closepj(gId);//根据商品ID删除评价信息
  int res=dao.delectGoods(gId); //根据商品ID删除商品信息
   if(res>0){
         session.setAttribute("404","删除成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","删除失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 %>