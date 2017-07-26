<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
	
	<script type="text/javascript">
	  var app = angular.module("app",[]);
	  app.controller("controllers",["$scope",function($scope){
	  
		angular.element("#span").empty();
		$scope.all = false;
	    $scope.userTest = function(){
				  // 简单的 GET 请求，可以改为 POST
				var username = angular.element("#username").val().trim();
				
				
			  if(username=="" && username==null){
		        angular.element("#span").text("用户名为空").prop("style","color:red");
			    $scope.all = true;
				   
			  }else{
			   angular.element("#span").text("用户名可以使用").prop("style","color:red");
				 $scope.all = false;
				 }
				 
				};
				angular.element("#span2").empty();
	         $scope.passWd = function(){
				  // 简单的 GET 请求，可以改为 POST
				var password = angular.element("#password").val().trim();
				
				
			  if(password=="" && password==null){
		        angular.element("#span").text("密码为空").prop("style","color:red");
			    $scope.all = true;
				   
			  }else{
			   angular.element("#span2").text("密码可使用").prop("style","color:red");
				 $scope.all = false;
				 }
				 
				};
				
				
			
				    
	  }]);
	  
	
	</script>
	
  </head>
  
  <body>
  <nav class="navbar navbar-default col-xs-6 col-md-offset-3" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <h6 class="navbar-brand" >登陆页面</h6>
    </div>
    </div>
    </nav>
    
    <div class="col-xs-4 col-md-offset-4" ng-app="app" ng-controller="controllers">
    <form class="form-horizontal" role="form" action="test/login" method="post">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">UserName:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" ng-blur="userTest(this)" id="username" name="username" placeholder="请输入名字">
      <span id="span"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">PassWord:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="password" name="password" ng-blur="passWd(this)" placeholder="请输入密码">
      <span id="span2"></span>
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary" ng-disabled="all">登陆</button>
    </div>
  </div>
</form>
  </div>
    
    
  </body>
</html>
