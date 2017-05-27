//注册验证
function check(){
	//用户名验证
	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name");
	var textBox = document.getElementById("username");
	if(name.value=="")
	{
		textBox.innerHTML = "×用户名不能为空！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!/^[A-Za-z]/.test(name.value)){
		textBox.innerHTML = "×用户名必须以字母开头！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(name.value.length < 2 || name.value.length > 16){
		textBox.innerHTML = "×用户名长度须在2-16之间！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!d.test(name.value)){
		textBox.innerHTML = "×用户名只能包含数字，字母或者下划线！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}
	//密码验证
	var pass = document.getElementById("pass").value;
	var pass2=document.getElementById("pass");
	textBox = document.getElementById("password");
	if(pass==""){
		textBox.innerHTML = "×密码不能为空！";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	}
	else if(pass.length < 6 || pass.length > 16){
		textBox.innerHTML = "×密码长度须在6-16之间！";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	}
	//确认密码验证
	var repass = document.getElementById("checkpass").value;
	var repass2 = document.getElementById("checkpass");
	textBox = document.getElementById("repass");
	if(repass==""){
		textBox.innerHTML = "×重复密码不能为空！";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	}
else if(pass!=repass){
		textBox.innerHTML = "×两次输入的密码不一致！";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	}
	//昵称验证
	var PetName = document.getElementById("petname");
	textBox = document.getElementById("pname");
	if(PetName.value==""){
		textBox.innerHTML = "×昵称不能为空";
		textBox.style.color = "red";
		PetName.focus();
		return false;
	}
	//真实姓名验证
	var realname= document.getElementById("realname");
	textBox = document.getElementById("rname");
	if(realname.value==""){
		textBox.innerHTML = "×真实姓名不能为空";
		textBox.style.color = "red";
		realname.focus();
		return false;
	}
	//邮箱验证
	var mail = document.getElementById("email").value;
	var mail2 = document.getElementById("email");
	textBox = document.getElementById("mail");
	var dmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if(mail==""){
		textBox.innerHTML = "×邮箱不能为空";
		textBox.style.color = "red";
		mail2.focus();
		return false;
	}
	else if(!dmail.test(mail)){
		textBox.innerHTML = "×邮箱格式不正确";
		textBox.style.color = "red";
		mail2.focus();
		return false;
	}
	//交易密码
	var d=/^\d{6}$/;
	var transPass = document.getElementById("transPass").value;
	var transPass2 = document.getElementById("transPass");
	textBox = document.getElementById("textTran");
	if(transPass==""){
		textBox.innerHTML = "×交易密码不能为空";
		textBox.style.color = "red";
		transPass2.focus();
		return false;
	}
	else if(!d.test(transPass)){
		textBox.innerHTML = "×交易密码必须为6位纯数字";
		textBox.style.color = "red";
		transPass2.focus();
		return false;
		}
	
	 return true;
	
}
//登录验证
function denglu(){

	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name");
	var textBox = document.getElementById("username");
	if(name.value=="")
	{
		textBox.innerHTML = "×用户名不能为空！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!/^[A-Za-z]/.test(name.value)){
		textBox.innerHTML = "×用户名必须以字母开头！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(name.value.length < 2 || name.value.length > 16){
		textBox.innerHTML = "×用户名长度须在2-16之间！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!d.test(name.value)){
		textBox.innerHTML = "×用户名只能包含数字，字母或者下划线！";
		textBox.style.color = "red";
		name.focus();
		return false;
	}
	//密码验证
	var pass = document.getElementById("pass");
	textBox = document.getElementById("password");
	if(pass.value==""){
		textBox.innerHTML = "×密码不能为空！";
		textBox.style.color = "red";
		pass.focus();
		return false;
	}
	else if(pass.value.length < 6 || pass.value.length > 16){
		textBox.innerHTML = "×密码长度须在6-16之间！";
		textBox.style.color = "red";
		pass.focus();
		return false;
	}
	return true;
}
//用户名验证
function checkName()
{
	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name").value;
	var textBox = document.getElementById("username");
	if(name=="")
	{
		textBox.innerHTML = "×用户名不能为空！";
		textBox.style.color = "red";
	}else if(!/^[A-Za-z]/.test(name)){
		textBox.innerHTML = "×用户名必须以字母开头！";
		textBox.style.color = "red";
	}else if(name.length < 2 || name.length > 16){
		textBox.innerHTML = "×用户名长度须在2-16之间！";
		textBox.style.color = "red";
	}else if(d.test(name)){
		textBox.innerHTML = "√";
		textBox.style.color = "green";
		}else{
		textBox.innerHTML = "×用户名只能包含数字，字母或者下划线！";
		textBox.style.color = "red";
	}
}
//密码验证
function checkPass()
{
	var pass = document.getElementById("pass").value;
	var textBox = document.getElementById("password");
	if(pass==""){
		textBox.innerHTML = "×密码不能为空！";
		textBox.style.color = "red";
	}
	else if(pass.length < 6 || pass.length > 16){
		textBox.innerHTML = "×密码长度须在6-16之间！";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}
}
//确认密码验证
function checkRepass()
{
	var pass = document.getElementById("pass").value;
	var repass = document.getElementById("checkpass").value;
	var textBox = document.getElementById("repass");
	if(repass==""){
		textBox.innerHTML = "×重复密码不能为空！";
		textBox.style.color = "red";
	}
else if(pass!=repass){
		textBox.innerHTML = "×两次输入的密码不一致！";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}
}
//真实姓名验证
function checkRealName()
{
	var realname = document.getElementById("realname").value;
	var textBox = document.getElementById("rname");
	if(realname==""){
		textBox.innerHTML = "×真实姓名不能为空";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}
}
//昵称验证
function checkPetName()
{
	var PetName = document.getElementById("petname").value;
	var textBox = document.getElementById("pname");
	if(PetName==""){
		textBox.innerHTML = "×昵称不能为空";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}
}
//交易密码验证
function checkTransPass()
{
	var d=/^\d{6}$/;
	var transPass = document.getElementById("transPass").value;
	var textBox = document.getElementById("textTran");
	if(transPass==""){
		textBox.innerHTML = "×交易密码不能为空";
		textBox.style.color = "red";
	}
	else if(d.test(transPass)){
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}else{
		textBox.innerHTML = "×交易密码必须为6位纯数字";
		textBox.style.color = "red";
		}
	}
//邮箱验证
function checkMail()
{
	var mail = document.getElementById("email").value;
	var textBox = document.getElementById("mail");
	var d = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if(mail==""){
		textBox.innerHTML = "×邮箱不能为空";
		textBox.style.color = "red";
	}
	else if(d.test(mail)){
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}
	else{
		textBox.innerHTML = "×邮箱格式不正确";
		textBox.style.color = "red";
	}
}