//ע����֤
function check(){
	//�û�����֤
	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name");
	var textBox = document.getElementById("username");
	if(name.value=="")
	{
		textBox.innerHTML = "���û�������Ϊ�գ�";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!/^[A-Za-z]/.test(name.value)){
		textBox.innerHTML = "���û�����������ĸ��ͷ��";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(name.value.length < 2 || name.value.length > 16){
		textBox.innerHTML = "���û�����������2-16֮�䣡";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!d.test(name.value)){
		textBox.innerHTML = "���û���ֻ�ܰ������֣���ĸ�����»��ߣ�";
		textBox.style.color = "red";
		name.focus();
		return false;
	}
	//������֤
	var pass = document.getElementById("pass").value;
	var pass2=document.getElementById("pass");
	textBox = document.getElementById("password");
	if(pass==""){
		textBox.innerHTML = "�����벻��Ϊ�գ�";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	}
	else if(pass.length < 6 || pass.length > 16){
		textBox.innerHTML = "�����볤������6-16֮�䣡";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	}
	//ȷ��������֤
	var repass = document.getElementById("checkpass").value;
	var repass2 = document.getElementById("checkpass");
	textBox = document.getElementById("repass");
	if(repass==""){
		textBox.innerHTML = "���ظ����벻��Ϊ�գ�";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	}
else if(pass!=repass){
		textBox.innerHTML = "��������������벻һ�£�";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	}
	//�ǳ���֤
	var PetName = document.getElementById("petname");
	textBox = document.getElementById("pname");
	if(PetName.value==""){
		textBox.innerHTML = "���ǳƲ���Ϊ��";
		textBox.style.color = "red";
		PetName.focus();
		return false;
	}
	//��ʵ������֤
	var realname= document.getElementById("realname");
	textBox = document.getElementById("rname");
	if(realname.value==""){
		textBox.innerHTML = "����ʵ��������Ϊ��";
		textBox.style.color = "red";
		realname.focus();
		return false;
	}
	//������֤
	var mail = document.getElementById("email").value;
	var mail2 = document.getElementById("email");
	textBox = document.getElementById("mail");
	var dmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if(mail==""){
		textBox.innerHTML = "�����䲻��Ϊ��";
		textBox.style.color = "red";
		mail2.focus();
		return false;
	}
	else if(!dmail.test(mail)){
		textBox.innerHTML = "�������ʽ����ȷ";
		textBox.style.color = "red";
		mail2.focus();
		return false;
	}
	//��������
	var d=/^\d{6}$/;
	var transPass = document.getElementById("transPass").value;
	var transPass2 = document.getElementById("transPass");
	textBox = document.getElementById("textTran");
	if(transPass==""){
		textBox.innerHTML = "���������벻��Ϊ��";
		textBox.style.color = "red";
		transPass2.focus();
		return false;
	}
	else if(!d.test(transPass)){
		textBox.innerHTML = "�������������Ϊ6λ������";
		textBox.style.color = "red";
		transPass2.focus();
		return false;
		}
	
	 return true;
	
}
//��¼��֤
function denglu(){

	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name");
	var textBox = document.getElementById("username");
	if(name.value=="")
	{
		textBox.innerHTML = "���û�������Ϊ�գ�";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!/^[A-Za-z]/.test(name.value)){
		textBox.innerHTML = "���û�����������ĸ��ͷ��";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(name.value.length < 2 || name.value.length > 16){
		textBox.innerHTML = "���û�����������2-16֮�䣡";
		textBox.style.color = "red";
		name.focus();
		return false;
	}else if(!d.test(name.value)){
		textBox.innerHTML = "���û���ֻ�ܰ������֣���ĸ�����»��ߣ�";
		textBox.style.color = "red";
		name.focus();
		return false;
	}
	//������֤
	var pass = document.getElementById("pass");
	textBox = document.getElementById("password");
	if(pass.value==""){
		textBox.innerHTML = "�����벻��Ϊ�գ�";
		textBox.style.color = "red";
		pass.focus();
		return false;
	}
	else if(pass.value.length < 6 || pass.value.length > 16){
		textBox.innerHTML = "�����볤������6-16֮�䣡";
		textBox.style.color = "red";
		pass.focus();
		return false;
	}
	return true;
}
//�û�����֤
function checkName()
{
	var d=/^[A-Za-z]\w+$/;
	var name = document.getElementById("name").value;
	var textBox = document.getElementById("username");
	if(name=="")
	{
		textBox.innerHTML = "���û�������Ϊ�գ�";
		textBox.style.color = "red";
	}else if(!/^[A-Za-z]/.test(name)){
		textBox.innerHTML = "���û�����������ĸ��ͷ��";
		textBox.style.color = "red";
	}else if(name.length < 2 || name.length > 16){
		textBox.innerHTML = "���û�����������2-16֮�䣡";
		textBox.style.color = "red";
	}else if(d.test(name)){
		textBox.innerHTML = "��";
		textBox.style.color = "green";
		}else{
		textBox.innerHTML = "���û���ֻ�ܰ������֣���ĸ�����»��ߣ�";
		textBox.style.color = "red";
	}
}
//������֤
function checkPass()
{
	var pass = document.getElementById("pass").value;
	var textBox = document.getElementById("password");
	if(pass==""){
		textBox.innerHTML = "�����벻��Ϊ�գ�";
		textBox.style.color = "red";
	}
	else if(pass.length < 6 || pass.length > 16){
		textBox.innerHTML = "�����볤������6-16֮�䣡";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}
}
//ȷ��������֤
function checkRepass()
{
	var pass = document.getElementById("pass").value;
	var repass = document.getElementById("checkpass").value;
	var textBox = document.getElementById("repass");
	if(repass==""){
		textBox.innerHTML = "���ظ����벻��Ϊ�գ�";
		textBox.style.color = "red";
	}
else if(pass!=repass){
		textBox.innerHTML = "��������������벻һ�£�";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}
}
//��ʵ������֤
function checkRealName()
{
	var realname = document.getElementById("realname").value;
	var textBox = document.getElementById("rname");
	if(realname==""){
		textBox.innerHTML = "����ʵ��������Ϊ��";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}
}
//�ǳ���֤
function checkPetName()
{
	var PetName = document.getElementById("petname").value;
	var textBox = document.getElementById("pname");
	if(PetName==""){
		textBox.innerHTML = "���ǳƲ���Ϊ��";
		textBox.style.color = "red";
	}
	else{
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}
}
//����������֤
function checkTransPass()
{
	var d=/^\d{6}$/;
	var transPass = document.getElementById("transPass").value;
	var textBox = document.getElementById("textTran");
	if(transPass==""){
		textBox.innerHTML = "���������벻��Ϊ��";
		textBox.style.color = "red";
	}
	else if(d.test(transPass)){
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}else{
		textBox.innerHTML = "�������������Ϊ6λ������";
		textBox.style.color = "red";
		}
	}
//������֤
function checkMail()
{
	var mail = document.getElementById("email").value;
	var textBox = document.getElementById("mail");
	var d = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if(mail==""){
		textBox.innerHTML = "�����䲻��Ϊ��";
		textBox.style.color = "red";
	}
	else if(d.test(mail)){
		textBox.innerHTML = "��";
		textBox.style.color = "green";
	}
	else{
		textBox.innerHTML = "�������ʽ����ȷ";
		textBox.style.color = "red";
	}
}