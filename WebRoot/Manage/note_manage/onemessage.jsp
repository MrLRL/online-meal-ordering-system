<!-- 留言详情 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function huifu(){
var Ly=document.getElementById("lId").value;
location.href="note.jsp?lId="+Ly;//修改地址栏
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理留言板</title>
<link href="../../css/css.css" rel="stylesheet" type="text/css">
</head>
<%
  	String lId="1";
     //获得传递过来的参数lId
     if(request.getParameter("lId")!=null){
     	lId=request.getParameter("lId");
     }
     
     //调用方法，根据传递过来的lId
     LiuyanDao dao=new LiuyanDao();
     LiuyansInfo info=dao.getLiuyanById(lId);
       %>
<body>
		<jsp:include page="../orderMange/manageTop.jsp"/>
		<table align="center"><tr><td height="10px"></td></tr></table>
		<center><font size="5" >查看留言</font></center><br/>
		<div style="font-size: 15px;color: #333333;">
		<table align="center">
		<tr height="35px"><td class="ziti"> 标 题 ：</td><td class="ziti"><%=info.getlBiaoti() %></td></tr>
		<tr height="35px"><td class="ziti"> 作 者 ：</td><td class="ziti"><%=info.getuPetName() %></td></tr>
		<tr height="35px"><td class="ziti"> 时 间 ：</td><td class="ziti"><%=info.getlTime() %></td></tr>
		<tr height="35px"><td class="ziti"> 内 容 ：</td><td class="ziti"><%=info.getlNeirong() %></td></tr>
		</table>
		</div><br/>
		<center><div style="width:550px;text-align:center;"><hr/></div></center>
		<div style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button" id="button" value="回复此留言" onclick="huifu()">
		<input type="hidden" id="lId" value="<%=info.getlId() %>" />
		<font size="4" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="manage.jsp"><img src="../../images/fanhui.gif" border="0" align="top"/></a></font></div>
		<jsp:include page="../manageBottom.jsp"/>
</body>
</html>