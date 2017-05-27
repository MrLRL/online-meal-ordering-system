<!-- 用户管理界面 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link href="../../css/order_style.css" rel="stylesheet" type="text/css" />
</head>
<% 
//保存当前页面信息
session.setAttribute("THIS", "userManage/usermanage_index.jsp");
  int currPages=1;  //当前页数
 if(request.getParameter("pages")!=null){
  	currPages=Integer.parseInt(request.getParameter("pages"));
  }
  UsersDao dao=new UsersDao();  //调用方法，显示当前页，每页显示10条
  List<UsersInfo> list =  dao.getAllUsers(currPages);
  int sum=dao.getCount(); //获得总条数
 if(sum==0){//如果总数为0，就让它默认为1.
  sum=1;
  }
  int n=0;   //总页数
  if(sum%10==0){
  	 n=sum/10;
  }else{
     n=sum/10+1;
  }
   %>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
<table align="center" width="650px">
	<tr>
		<td height="50px"><a href="addUser.jsp"><img src="../../images/14.gif" border="0"></a></td>
		<td width="250px"></td>
	</tr>
</table>
<table align="center" width="650px">
	<tr class="tr_sty" align="center">
		<td width="50px">ID</td><td width="100px">用户名</td><td width="100px">昵称</td><td width="50px">真实姓名</td><td width="50px">性别</td><td width="150px">E-mail</td><td width="50px">账户余额</td><td width="100px">操作</td>
	</tr>
	<%
	//循环读取
                 if(list!=null){
                 for(int i=0;i<list.size();i++){
  	              UsersInfo info=list.get(i);     
           %>
	<tr class="tr_sty1" height="25px" align="center">
		<td><%=(i+1) %></td><td><%=info.getuName() %></td><td><%=info.getuPetname() %></td>
		<td><%=info.getuRealname() %></td><td><%=info.getuSex() %></td><td><%=info.getuEmail() %></td><td><%=Double.parseDouble(info.getuBalance()) %></td>
		<td>
		        <a href="update.jsp?uId=<%=info.getuId() %>">修改</a></td>
	</tr>
		<%}
	         } %>
</table>
<!-- -------------------------------以下是实现分页显示------------------------------------ -->
<p>&nbsp;</p><%
 if(n==1){  //如果只有一页
 %>
 <div align="center" >首页  &nbsp;上一页 &nbsp;  下一页 &nbsp; 末页 </div>
<%}else if(currPages==1){  //如果是首页%> 
 <div align="center">首页  &nbsp;上一页 &nbsp;  <a href="usermanage_index.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="usermanage_index.jsp?pages=<%=n%>">末页</a></div>
 <%
}else if(currPages==n){  //如果是末页
 %>
 <div align="center"><a href="usermanage_index.jsp?pages=1">首页</a>  &nbsp;<a href="usermanage_index.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  下一页 &nbsp; 末页 </div>
 <%}else{ %>
 <div align="center"><a href="usermanage_index.jsp?pages=1">首页</a>  &nbsp;<a href="usermanage_index.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  <a href="usermanage_index.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="usermanage_index.jsp?pages=<%=n%>">末页</a></div>
 <%} %><br/>
<jsp:include page="../manageBottom.jsp"/>
</body>
</html>