<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%
 //登录操作（作者：徐辉、周华）
	//获得用户名和密码
	request.setCharacterEncoding("utf-8");//设置字符编码
	String name=request.getParameter("person.user_name");//获得用户名
	String pass=request.getParameter("person.user_pass");//获得密码
	int shengfen=Integer.parseInt(request.getParameter("person.user_flag"));//获得身份
	UserDao dao=new UserDao();
	if(shengfen==1){
	//调用UsersDao中的login的方法,然后根据结果做出处理
   UsersInfo  user= dao.login(name, pass);//用变量接收 
    //处理
    if(user!=null){
       //把当前的登录对象保存 到session中，键-获取-值
       session.setAttribute("LOGIN", user);
    	//登录成功
         session.setAttribute("CLICK","登录成功！");
    	 response.sendRedirect("../index/click.jsp");
    }else{
       //登录失败
         session.setAttribute("CUO","账号或密码错误！");
    	 response.sendRedirect("../Book/shipping_Step1.jsp");
    }
    }else if(shengfen==0){
    AdminInfo info=dao.Adminlogin(name, pass);
     if(info!=null){
       //把当前的登录对象保存 到session中，键-获取-值
       session.setAttribute("GUANLI", info);
    	//登录成功
         session.setAttribute("CLICK","登录成功！");
    	 response.sendRedirect("../index/click.jsp");
    }else {
       //登录失败
         session.setAttribute("CUO","账号或密码错误！");
    	 response.sendRedirect("../Book/shipping_Step1.jsp");
    }
    }
 %>