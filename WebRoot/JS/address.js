// JavaScript Document
       //�����ͽֵ���������
     var qu=new Array();
	  qu["������"]=["������ֵ�","����·�ֵ�","����·�ֵ�","�¿��ֵ̽�","���ӽֵֽ�","ԣ�Ͻֵֽ�","��԰�ֵ�","��ƺ�ֵ�","��Դ�ֵ�","�ȷ�ֵ�","��ʯ·�ֵ�","�����ֵ̽�"];
	  qu["�껨��"]=["������ֵ�","������ֵ�","�����ֵ�","ɰ�����ֵ�","�����ֵ�","�껨ͤ�ֵ�","���Žֵ�","�����ֵ�","���нֵ�","�����ӽֵ�","ͬ���ֵ�","��ɽ�ֵ�"];
	  qu["��´��"]=["���º��ֵ�","��´�ֵ�","�����޽ֵ�","������ֵ�","��ɳ��ֵ�","�����½ֵ�","�����ֵ�","�̼κ��ֵ�","�����ֵ�","÷Ϫ���ֵ�","´�Ƚֵ�","ƺ���ֵ�","���ֵֽ�","�춥�ֵ�","����ֵ�","ѧʿ�ֵ�","��������","������","�골ƺ��"];
	  qu["ܽ����"]=["����·�ֵ�","�����ֵֽ�","�²�԰�ֵ�","�����ƽֵ�","�����ѽֵ�","����ֵ�","���Ͷɽֵ�","����ֵ�","����̨�ֵ�","�ɻ�԰�ֵ�","�����ֵ�","������ֵ�","�����ֵ�","¡ƽ�Ƽ�԰"];
	  qu["������"]=["ܽ�ر�·�ֵ�","����·�ֵ�","��ˮ���ֵ�","��´԰�ֵ�","����·�ֵ�","�����ֵ�","�ºӽֵ�","̩ͨ·�ֵ�","�ķ�ƺ�ֵ�","��ˮ�ֵ�","����ӽֵ�","�º��ֵ�","���ֵ�","�¸۽ֵ�","ɳƺ�ֵ�","�뵶�ӽֵ�","�������"];
      function jiedao3(){
		  var quyu=document.getElementById("qu5").value;//��ѡ�е������±�
		  document.getElementById("jiedao").options.length=0;//��սֵ��б�
		  for(var i in qu[quyu]){
			  var jiedao=new Option(qu[quyu][i],""); //�����ֵ�ѡ��
			  document.getElementById("jiedao").options.add(jiedao);//���ֵ�ѡ����ӵ������б�
		      }
		  }
    function tel(){
    	var obj=document.getElementById('tel');
    	var zhengze=/\d{11}/;
    	if(zhengze.test(document.getElementById("order_movPho").value)){
    		obj.innerHTML = "��";
    		obj.className = "green";
    	}else{
			obj.innerHTML = "��������11λ�ֻ�����";
			obj.className = "red";
    	}
    }
    function menpai(){
    	var menpai=document.getElementById("menpaihao");
    	menpai.value="";
    	menpai.style.color="black";
    }
    function names(){
    	var obj=document.getElementById('uname');
    	if(document.getElementById("order_name").value==""){
			obj.innerHTML = "����������������";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "��";
    		obj.className = "green";
    	}
    }
    function menpai2(){
    	var obj=document.getElementById('address');
    	var juti=document.getElementById("menpaihao").value;
    	if(juti==""||juti=="���������ƺ�"){
			obj.innerHTML = "������������ַ��Ϣ";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "��";
    		obj.className = "green";
    	}
    }
    function  tianjia(){
    	var obj=document.getElementById('uname');
    	var name=document.getElementById("order_name");
    	if(name.value==""){
			obj.innerHTML = "����������������";
			obj.className = "red";
			name.focus();
			return false;
    	}
    	var obj2=document.getElementById('tel');
    	var zhengze=/\d{11}/;
    	var shouji=document.getElementById("order_movPho");
    	if(!zhengze.test(shouji.value)){
    		obj2.innerHTML = "��������11λ�ֻ�����";
    		obj2.className = "red";
			shouji.focus();
			return false;
    	}
    	var obj3=document.getElementById('address');
    	var juti=document.getElementById("menpaihao");
    	if(juti.value==""||juti.value=="���������ƺ�"){
			obj3.innerHTML = "������������ַ��Ϣ";
			obj3.className = "red";
			juti.focus();
			return false;
    	}
    	   return true;
    }

    function menpai4(){
    	var obj=document.getElementById('address');
    	var juti=document.getElementById("menpaihao").value;
    	if(juti==""){
			obj.innerHTML = "���������ַ";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "��";
    		obj.className = "green";
    	}
    }