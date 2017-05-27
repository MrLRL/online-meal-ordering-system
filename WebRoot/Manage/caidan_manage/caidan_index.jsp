<!-- 菜单管理 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理</title>
<link href="../../css/order_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function searchContent() {
	var objVal = document.getElementById('searchCont').value;
		location.href = "caidan_index.jsp?name=" + objVal;
}
</script>
</head>
<% 
//保存当前页面信息
session.setAttribute("THIS", "caidan_manage/caidan_index.jsp");
//判断管理员是否已登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("GUANLI")==null){
response.sendRedirect("../../Book/shipping_Step1.jsp");
return;
}
  int currPages=1;  //当前页数
 if(request.getParameter("pages")!=null){
  	currPages=Integer.parseInt(request.getParameter("pages"));
  }
  CaidanDao dao=new CaidanDao();  //调用方法，显示当前页，每页显示5条
  List<GoodsInfo> list =null;  
  int sum=dao.getCount();  //获得总条数
  if(request.getParameter("name")!=null){
String search=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
  list=dao.search(currPages, search);
  sum=dao.num(search);
  if(sum==0){
  sum=1;}
  }else{
  list=dao.selectGoods(currPages);
  if(sum==0){
  sum=1;}
  }
  int n=0;   //总页数
  if(sum%5==0){
  	 n=sum/5;
  }else{
     n=sum/5+1;
  }
   %>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
<table align="center" width="650px">
	<tr>
		<td><a href="caidan_add.jsp"><img src="../../images/13.gif" border="0"></a></td>
		<td width="250px"></td>
		<td align="center">
			<form action="" name="sForm" method="post">
			搜索菜单：<input type="text" id="searchCont"/>
			<a href="#"><img src="../../images/i_fdj.gif" border="0" width="23px" height="23px" onclick="searchContent()"/></a>
			</form>
		</td>
	</tr>
</table>
<table align="center" width="650px">
	<tr class="tr_sty" align="center">
		<td width="50px">ID</td><td width="100px">菜名</td><td width="50px">菜系</td><td width="50px">单价</td><td width="100px">食材</td><td width="150px">简介</td><td width="150px">操作</td>
	</tr>
	<%
                 if(list!=null){
                 for(int i=0;i<list.size();i++){
  	              GoodsInfo info=list.get(i);     
           %>
	<tr class="tr_sty0" height="25px" align="center">
		<td><%=(i+1) %> </td><td><%=info.getgName() %></td><td><%=info.getgCaixi() %></td><td><%=Double.parseDouble(info.getgPrice()) %>元</td><td><%=info.getgFood() %></td><td><%=info.getgDetails() %></td>
		<td align="center">
		<%if(Integer.parseInt(info.getgShangjia())==1){ %>
  <a href="../../do/doUpXiajia.jsp?gId=<%=info.getgId() %>&gShangjia=0">下架</a>&nbsp;
        <%}else if(Integer.parseInt(info.getgShangjia())==0){ %>
  <a href="../../do/doUpShangjia.jsp?gId=<%=info.getgId() %>&gShangjia=1">上架</a>&nbsp;
        <%} %>
  <a href="caidan_update.jsp?gId=<%=info.getgId() %>">修改</a>&nbsp;
	<%}
	         } %>
</table>
<!-- -------------------------------以下是实现分页显示------------------------------------ -->
<p>&nbsp;</p><%
 if(n==1){  //如果只有一页
 %>
 <div align="center" >首页  &nbsp;上一页 &nbsp;  下一页 &nbsp; 末页 </div>
<%}else if(currPages==1){  //如果是首页%> 
 <div align="center">首页  &nbsp;上一页 &nbsp;  <a href="caidan_index.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="caidan_index.jsp?pages=<%=n%>">末页</a></div>
 <%
}else if(currPages==n){  //如果是末页
 %>
 <div align="center"><a href="caidan_index.jsp?pages=1">首页</a>  &nbsp;<a href="caidan_index.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  下一页 &nbsp; 末页 </div>
 <%}else{ %>
 <div align="center"><a href="caidan_index.jsp?pages=1">首页</a>  &nbsp;<a href="caidan_index.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  <a href="caidan_index.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="caidan_index.jsp?pages=<%=n%>">末页</a></div>
 <%} %><br/>
<jsp:include page="../manageBottom.jsp"/>
</body>
</html>