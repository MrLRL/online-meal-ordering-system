// JavaScript Document
       //市区和街道二级联动
     var qu=new Array();
	  qu["天心区"]=["金盆岭街道","赤岭路街道","城南路街道","新开铺街道","坡子街街道","裕南街街道","青园街道","桂花坪街道","文源街道","先锋街道","黑石路街道","大托铺街道"];
	  qu["雨花区"]=["侯家塘街道","左家塘街道","圭塘街道","砂子塘街道","东塘街道","雨花亭街道","高桥街道","洞井街道","黎托街道","井湾子街道","同升街道","东山街道"];
	  qu["岳麓区"]=["望月湖街道","岳麓街道","桔子洲街道","银盆岭街道","观沙岭街道","望城坡街道","西湖街道","咸嘉湖街道","望岳街道","梅溪湖街道","麓谷街道","坪塘街道","含浦街道","天顶街道","洋湖街道","学士街道","东方红镇","莲花镇","雨敞坪镇"];
	  qu["芙蓉区"]=["文艺路街道","朝阳街街道","韭菜园街道","五里牌街道","马王堆街道","火里街道","东屯渡街道","湘湖街道","定王台街道","荷花园街道","东岸街道","马坡岭街道","东湖街道","隆平科技园"];
	  qu["开福区"]=["芙蓉北路街道","东方路街道","清水塘街道","望麓园街道","湘雅路街道","伍家岭街道","新河街道","通泰路街道","四方坪街道","洪水街道","浏阳河街道","月湖街道","秀峰街道","新港街道","沙坪街道","唠刀河街道","青竹湖镇"];
      function jiedao3(){
		  var quyu=document.getElementById("qu5").value;//所选中的区域下标
		  document.getElementById("jiedao").options.length=0;//清空街道列表
		  for(var i in qu[quyu]){
			  var jiedao=new Option(qu[quyu][i],""); //创建街道选项
			  document.getElementById("jiedao").options.add(jiedao);//将街道选项添加到城市列表
		      }
		  }
    function tel(){
    	var obj=document.getElementById('tel');
    	var zhengze=/\d{11}/;
    	if(zhengze.test(document.getElementById("order_movPho").value)){
    		obj.innerHTML = "√";
    		obj.className = "green";
    	}else{
			obj.innerHTML = "×请输入11位手机号码";
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
			obj.innerHTML = "×请输入您的姓名";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "√";
    		obj.className = "green";
    	}
    }
    function menpai2(){
    	var obj=document.getElementById('address');
    	var juti=document.getElementById("menpaihao").value;
    	if(juti==""||juti=="请输入门牌号"){
			obj.innerHTML = "×请输入具体地址信息";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "√";
    		obj.className = "green";
    	}
    }
    function  tianjia(){
    	var obj=document.getElementById('uname');
    	var name=document.getElementById("order_name");
    	if(name.value==""){
			obj.innerHTML = "×请输入您的姓名";
			obj.className = "red";
			name.focus();
			return false;
    	}
    	var obj2=document.getElementById('tel');
    	var zhengze=/\d{11}/;
    	var shouji=document.getElementById("order_movPho");
    	if(!zhengze.test(shouji.value)){
    		obj2.innerHTML = "×请输入11位手机号码";
    		obj2.className = "red";
			shouji.focus();
			return false;
    	}
    	var obj3=document.getElementById('address');
    	var juti=document.getElementById("menpaihao");
    	if(juti.value==""||juti.value=="请输入门牌号"){
			obj3.innerHTML = "×请输入具体地址信息";
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
			obj.innerHTML = "×请输入地址";
			obj.className = "red";
    	}else{
    		obj.innerHTML = "√";
    		obj.className = "green";
    	}
    }