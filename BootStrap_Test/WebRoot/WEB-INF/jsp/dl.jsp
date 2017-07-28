<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	  <style type="text/css">
	     
	     .bg{ margin:0 auto; width:1000px; height:480px; 
	     margin-top:30px;
	     border:1px solid #F00;
	     background-color: gray;} 
	     .imgs{
	     margin-top:20px;
	          margin-left:600px;
	     }
	  </style>
	<script type="text/javascript">
	
	
	$(function(){
	
	$("#ename").blur(function(){
	$("#sa").empty();
	if($("#ename").val().trim()=="" || $("#ename").val().trim()==null ){
	    $("#ename").next().text("用户名为空").prop("style","color:red");
	}
	});
	$("#email").blur(function(){
	 $("#ss").empty(); 
	 var span=$("<span id='ss' style='color: red'>邮箱为空</span>");
	 if($("#email").val().trim()=="" || $("#email").val().trim()==null){
	 $("#email").after(span);
	 
	}
	});
	/* if($("#ename").val().trim()=="" && $("#email").val().trim()==""){
	  $("#submit").prop("class","btn btn-info disabled");
	}else{
	 $("#submit").prop("class","btn btn-info");
	
	  $("#submit").removeProp("class","disabled"); 
	} */
			 
	 
	});
										
					
	  
	</script>
  </head>
  
  <body>
  <div class="container imgs">
	<img src="static/img/yu.jpg" class="img-circle" alt="Cinque Terre" width="100" height="100"> 
    </div>
<div class="row bg ">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid col-md-3 col-md-offset-5">
			<div class="navbar-header">
				<a class="navbar-brand" href="test/dl" style="background-color:blue;">登录页面
					&nbsp;&nbsp;&nbsp;</a> <a class="navbar-brand active"
					style="background-color:red;" href="index.jsp">注册页面</a>
			</div>

		</div>
		</nav>



		<form class="form-horizontal col-md-offset-5" action="test/login" role="form"
			 method="get">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">名字</label>
				<div class="col-md-3 ">
					<input type="text" class="form-control" name="ename" id="ename"
						placeholder="名字">
						<span id="sa"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">邮箱</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="email" id="email"
						placeholder="邮箱">
				</div>
			</div>
				<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<button type="submit" id="submit" class="btn btn-info">登陆</button>
				</div>
			</div>
			
			</form>
			</div>
			
			
			

  </body>
</html>
