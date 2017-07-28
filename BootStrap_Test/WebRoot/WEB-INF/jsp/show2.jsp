<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show2.jsp' starting page</title>
    
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
	
	var models = angular.module("models",[]);
	models.controller("controllers",["$scope","$http",function($scope,$http){
	
	  $scope.toPage=function(num){
	  
			// 简单的 GET 请求，可以改为 POST
		$http({
			method:"POST",
			url:"test/show?pageno="+num
		}).then(function successCallback(response) {
				// 请求成功执行代码
				$scope.pageInfo= response.data.data.pageInfo;
				$scope.employeeList=$scope.pageInfo.list;
			}, function errorCallback(response) {
				// 请求失败执行代码
		});
		$scope.toPage(1);
	  
	  };
	
	}]);
	
	</script>

  </head>
  
  <body ng-app="models" ng-controller="controllers">
   
    <div class="container">
  <div class="row">
   <div class="col-md-10 col-md-offset-1">
 <table class="table">
  <caption>信息列表</caption>
  <thead>
    <tr>
      <th>姓名</th>
	  	<th>出生年月</th>
	  	<th>性别</th>
	  	<th>邮箱</th>
	  	<th>所在部门</th>
  </thead>
  <tbody>
   <tr ng-repeat="user in employeeList">
     	<th>{{user.ename}}</th>
	  	<th>{{user.ebirthday}}</th>
	  	<th>{{user.gender}}</th>
	  	<th>{{user.email}}</th>
	  	<td>{{user.department.dname}}</td>
   </tr>
  </tbody>
</table>
 </div>
  </div>
  </div>
  
  <div class="row">
	  <div class="col-md-6">共有{{pageInfo.total}}条数据,共有{{pageInto.pages}}页 </div>
     <nav class="navbar navbar-default" role="navigation">
     <ul class="pagination">
	    <li><a href="#">&laquo;</a></li>
	    <li ng-show="pageInfo.hasPreviousPage"><a href="javascript:opener.location.reload()" ng-click="toPage(1)">首页</a></li>
	    <li ng-hide="pageInfo.hasPreviousPage" class="disabled"><a href="javascript:opener.location.reload()">首页</a></li>
	   
	    <li><a ng-show="pageInfo.hasPreviousPage" href="javascripe:opener.location.reload()" ng-click="toPage(pageInfo.pageNum-1)" aria-label="Previous">
	    <span aria-hidden="true">&laquo;</span>
	    </a></li>
	    
	    <li><a ng-hide="pageInfo.hasPreviousPage" href="javascripe:opener.location.reload()" aria-label="Previous" class="disabled">
	    <span aria-hidden="true">&laquo;</span>
	    </a></li>
	    
	    <li ng-repeat="num in pageInfo.navigatepageNums" ng-class="num==pageInfo.pageNum?'active':''">
	    <a href="javascript:opener.location.reload()" ng-click="toPage(num)">{{num}}</a></li>
	    
	    <li><a href="#">5</a></li>
	    <li><a href="#">&raquo;</a></li>
     </ul>
     </nav>
  </div>
   
   
   
   
  </body>
</html>
