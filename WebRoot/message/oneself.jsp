<!-- 查看留言（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.*,dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的留言记录</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
#chakan a{
color:blue;
}
#chakan a:hover{
color:red;
text-decoration:underline;
}
#index{
font-size:15px;
height:25px;
}
#index a:hover{
color:#F00;
text-decoration:underline;
}
#index a{
color:#00F;
text-decoration:none;
}
</style>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "message/oneself.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  NoteDao dao=new NoteDao();
  int pIndex=1;//当前页数
	if(request.getParameter("pages")!=null){
	pIndex=Integer.parseInt(request.getParameter("pages"));
	}
	//调用查询方法
  List<LiuyansInfo> list=dao.sel(pIndex,user.getuId());
  %>
<body>
		<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
		<table align="center"><tr><td height="10px"></td></tr></table>
		<center><font size="5" ><%=user.getuPetname() %>的留言</font></center>
		<table align="center"><tr><td align="right" width="400px" id="chakan"><a href="addnote.jsp">返回</a></td></tr></table>
		<table width="550px" align="center">
		<%if(list!=null){ 
		HuifusInfo huifu=null;
		for(int i=0;i<list.size();i++){
		LiuyansInfo info=list.get(i);
		%>
		<tr><td>
		<fieldset style="border:1px solid  #FF9900;	padding:8px ;" >
			主题：<%=info.getlBiaoti() %><br/><br/>&nbsp;&nbsp;<%=info.getlNeirong() %><br/><br/>
			<div align="right">时间:<%=Time.time(info.getlTime()) %></div>	
		</fieldset>
		<%huifu=dao.huifu(info.getlId());
		  if(huifu!=null){ %>
		<fieldset style="border:1px solid  #FF9900;	padding:8px ;" >
			管理员回复：<%=huifu.getfNeirong() %>
			<div align="right">时间:<%=Time.time(huifu.getfTime()) %></div>	
		</fieldset><%} %><br/>
        </td></tr>	
        <%} } %>
	</table>
			<!-- -------------------------------以下是实现分页显示------------------------------------ -->
		
<%
     int sum=dao.num(user.getuId());//获得总条数
     if(sum==0){
     sum=1;
     }
     int n=0;//总页数
     if(sum%3==0){
     n=sum/3;
     }else{
     n=sum/3+1;
     }
   %>
		<%
  if(pIndex==1&&pIndex==n){
 %>
<div id="index" align="center">首页&nbsp; 上一页&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
 }else if(pIndex==1){
 %>
<div id="index" align="center">首页&nbsp; 上一页&nbsp; <a href="oneself.jsp?pages=<%=pIndex+1 %>">下一页</a>&nbsp; <a href="oneself.jsp?pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>

<%
} else if(pIndex==n){
%>
<div id="index" align="center"><a href="oneself.jsp?pages=1">首页</a>&nbsp; <a href="oneself.jsp?pages=<%=pIndex-1%>">上一页</a>&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
} else{
%>
<div id="index" align="center"><a href="oneself.jsp?pages=1">首页</a>&nbsp; <a href="oneself.jsp?pages=<%=pIndex-1%>">上一页</a>&nbsp; <a href="oneself.jsp?pages=<%=pIndex+1%>">下一页</a>&nbsp; <a href="oneself.jsp?pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>
<%
}
%>
			<div align="center" style="height:35;"><font size="3">共<%=sum %>条 &nbsp;&nbsp;
			第<%=pIndex %>页&nbsp;&nbsp;
			共<%=n %>页&nbsp;&nbsp;&nbsp;</font></div>
		<div align="center">
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

		</div>

</body>
</html>