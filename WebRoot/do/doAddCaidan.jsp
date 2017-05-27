<!-- (作者：徐辉) -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%   //添加操作(作者：徐辉)
  //逻辑处理
	//获得相关数据
	request.setCharacterEncoding("utf-8");//设置字符编码
	String gName=request.getParameter("menu.menu_name");
	String gPrice=request.getParameter("menu.menu_price");
	String gCaixi=request.getParameter("menu.menu_caixi");
	String gFood=request.getParameter("menu.menu_food");
	String gImages=request.getParameter("menu.menu_images");
	 String gDetails=request.getParameter("menu.menu_content");
	  //out.print(gName+gPrice+gCaixi+gFood+gDetails+gImages);
	//调用CaidanDao中的方法
	 CaidanDao dao=new CaidanDao();
	 GoodsInfo info=new GoodsInfo("",gName,gPrice,gCaixi,gFood ,"0",gImages,gDetails,"1");
     int res=dao.addGoods(info);//用变量接收
     //根据结果判定是否添加成功
  if(res>0){
         session.setAttribute("404","添加成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","添加失败！");
    	 response.sendRedirect("../Manage/404.jsp");
    }
 
 %>
