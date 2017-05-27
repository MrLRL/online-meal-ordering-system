<!-- 评论页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.*,dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String gId=request.getParameter("gId");//获得商品ID
	 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品评论</title>
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
<script type="text/javascript">
function pinglun1() {
	location.href="Pingjia.jsp?leixing=1&gId=<%=gId %>";
}
function pinglun2() {
	location.href="Pingjia.jsp?leixing=2&gId=<%=gId %>";
}
function pinglun3() {
	location.href="Pingjia.jsp?leixing=3&gId=<%=gId %>";
}
</script>
</head>
<%
  PinglunDao dao=new PinglunDao();
  int pIndex=1;//当前页数
	if(request.getParameter("pages")!=null){
	pIndex=Integer.parseInt(request.getParameter("pages"));
	}
	//调用查询方法
  List<PingjiasInfo> list=dao.getNew(pIndex,gId);
  %>
<body>
		<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
		<table align="center"><tr><td align="right" width="550px" id="chakan">
		<input type="radio" name="leixing" value="1" onclick="pinglun1()">好评<input type="radio" name="leixing" value="2" onclick="pinglun2()">中评<input type="radio" id="leixing3" name="leixing" value="3" onclick="pinglun3()">差评
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addnote.jsp">返回</a></td></tr></table>
		<table width="550px" align="center">
		<%if(list!=null){ 
		for(int i=0;i<list.size();i++){
		PingjiasInfo info=list.get(i);
		%>
		<tr><td>
		<fieldset style="border:1px solid  #FF9900;	padding:8px ;" >
			评价用户：<%=info.getuPetname() %><br/>&nbsp;&nbsp;评价内容：<%=info.getpContent() %><br/>
			<div align="right">时间:<%=Time.time(info.getpDate()) %></div>	
		</fieldset><br/>
        </td></tr>	
        <%} } %>
	</table>
			<!-- -------------------------------以下是实现分页显示------------------------------------ -->
		
<%
     int sum=dao.num(gId);//获得总条数
     int n=0;//总页数
     if(sum%5==0){
     n=sum/5;
     }else{
     n=sum/5+1;
     }
   %>
		<%
  if(pIndex==1&&pIndex==n){
 %>
<div id="index" align="center">首页&nbsp; 上一页&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
 }else if(pIndex==1){
 %>
<div id="index" align="center">首页&nbsp; 上一页&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&pages=<%=pIndex+1 %>">下一页</a>&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>

<%
} else if(pIndex==n){
%>
<div id="index" align="center"><a href="Pinglun.jsp?gId=<%=gId %>&pages=1">首页</a>&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&pages=<%=pIndex-1%>">上一页</a>&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
} else{
%>
<div id="index" align="center"><a href="Pinglun.jsp?gId=<%=gId %>&pages=1">首页</a>&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&gId=<%=gId %>&pages=<%=pIndex-1%>">上一页</a>&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&pages=<%=pIndex+1%>">下一页</a>&nbsp; <a href="Pinglun.jsp?gId=<%=gId %>&pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>
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
