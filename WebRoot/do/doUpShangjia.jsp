<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%
   //逻辑处理
	request.setCharacterEncoding("utf-8");//设置字符编码
 //获得传递过来的参数
 String gId=request.getParameter("gId");
  String gShangjia=request.getParameter("gShangjia");
 //调用订单CaidanDao中根据id修改的方法
  CaidanDao dao=new CaidanDao();
  GoodsInfo info=new GoodsInfo(gId,null,null,null,null,null,null,null,gShangjia);
  int res=dao.upCaidanZT(info);//根据商品ID修改商品状态
   if(res>0){
         session.setAttribute("404","上架成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","上架失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 %>