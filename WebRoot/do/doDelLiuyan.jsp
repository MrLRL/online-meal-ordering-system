<!-- 留言do (作者：徐辉)-->
<%@ page language="java" import="java.util.*,dao.*,entity.*"  pageEncoding="utf-8"%>
 <%
  //获得传递过来的参数
  String lId=request.getParameter("lId");
   if(lId.endsWith(",")){
  	lId=lId.substring(0,lId.length()-1);//截取
  }
 // out.print(lId);
   //调用订单LiuyanDao中的删除方法
  LiuyanDao dao=new LiuyanDao();
  String[] ids=lId.split(","); 
  for(int i=0;i<ids.length;i++){
         dao.delectHuifus(ids[i]);//根据留言id删除回复
      }
      int rs=0;
  for(int s=0;s<ids.length;s++){
  	   rs=dao.delectLiuyan(ids[s]);//根据留言id删除留言
  	  }
  	  
      if(rs>0){
         session.setAttribute("404","删除成功！");
    	 response.sendRedirect("../Manage/404.jsp");
    }else{  
         session.setAttribute("404","删除失败！");
    	 response.sendRedirect("../Manage/404.jsp");
     } 
       
 %>