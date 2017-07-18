$(function(){ //页面dom结构加载完成，执行以下函数体	

	// 给用户名 输入框绑定失去焦点验证
	//在html中用onblur=函数名()，可读性差
	$("#msg_user").css({color:"red"});
	$("#mobile").click(function(){
		
		 $("#msg_user").html("");  
	});
	$("#psw").click(function(){
		
		 $("#msg_psw0").html("");  
	});
	$("#psw_ck").click(function(){
		
		 $("#msg_psw").html("");  
	});
	$("#mobile").blur(function(){
		// 失去焦点事件（匿名函数体中调用自定义的事件）
		checkUser_reg();
	});
	
	$("#psw").blur(function(){
		checkPassWord_reg0();
	});
	$("#psw_ck").blur(function(){
		checkPassWord_reg();
	});
	
});

function checkUser_reg(){
	var flag=false;//状态
	//判断输入是否为空
	var vv=$("#mobile").val();
	if(vv==""){
		$("#msg_user").html("用户名不能为空");
		$("#msg_user").css({color:"red"});
	}
	
	
	else {
		if(vv.length!=11){
			$("#msg_user").html("手机号必须是11位数字");
			$("#msg_user").css({color:"red"});
		}
		else{
		
		//用户名没有被占用
			$.ajax({
				type:"get",
				url:"UserServlet?tt=new Date()",
				data:{uname:vv,flag:"checkUserName"},
				success:function(recv_data){
					
				  if(recv_data==1){
				
					  $("#msg_user").html("手机号可用");
					  $("#msg_user").css({color:"green"});
				  }
                  if(recv_data==0){
					  $("#msg_user").html("手机号已被占用");
					  $("#msg_user").css({color:"red"});
					  $("#mobile").val("");  
				  }
			  } 
			}); 
			flag=true;
		}
	}
	
	return flag;
}


//验证密码
function checkPassWord_reg0(){
	var psw=$("#psw").val();
	
	if(psw==""){
		$("#msg_psw0").html("密码不能为空，请重新设置密码");
		$("#msg_psw0").css({color:"red"});
	}
	if(psw!=""){
		$("#msg_psw0").html("密码设置成功");
		$("#msg_psw0").css({color:"green"});
	}
}
function checkPassWord_reg(){

	var flag=false;//状态
	var psw=$("#psw").val();
	var psw_ck=$("#psw_ck").val();
	if(psw==""){
		$("#msg_psw0").html("密码不能为空，请重新设置密码");
		$("#msg_psw0").css({color:"red"});
	}
			
	else{
			if(psw!=(psw_ck)){
				$("#msg_psw").html("两次密码输入不一致");
				$("#msg_psw").css({color:"red"});
				$("#psw_ck").val("");  
			}else{
				$("#msg_psw").html("密码确认成功");
				$("#msg_psw").css({color:"green"});
				flag=true;
			}
	}
	return flag;
}

//提交验证
function checkForm(){
	var flag=false;
	if(checkUser_reg()&&checkPassWord_reg()){
		flag=confirm("确认注册吗？");
	}
     return flag;
   }

function checkForm_login(){
	var flag=false;
	if(checkUser_login()&&checkPassWord()){
		flag=true;
	}
     return flag;
   }
