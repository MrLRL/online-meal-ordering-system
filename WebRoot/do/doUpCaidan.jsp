<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%
  //逻辑处理
	request.setCharacterEncoding("utf-8");//设置字符编码
 //获得传递过来的参数
 String gId=request.getParameter("txtgId");
 String gName=request.getParameter("menu.menu_name");
 String gCaixi=request.getParameter("menu.menu_caixi");
 String gPrice=request.getParameter("menu.menu_price");
 String count=request.getParameter("menu.menu_count");
 String gFood=request.getParameter("menu.menu_food");
 String gImages=request.getParameter("menu.menu_images");
 String gDetails=request.getParameter("menu.menu_content");
  //调用订单CaidanDao中根据id修改的方法
  CaidanDao dao=new CaidanDao();
  GoodsInfo info=new GoodsInfo(gId,gName,gPrice,gCaixi,gFood,count,gImages,gDetails,null);
  
  int res=dao.upCaidan(info);//根据商品ID修改商品信息
  if(res>0){
         session.setAttribute("404","修改成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","修改失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 
 %>