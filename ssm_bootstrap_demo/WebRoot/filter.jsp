<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>综合案例--员工信息管理</title>
	
	<!-- 引入bootstrap的css样式 -->
	<link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
	<!-- 引入jquery -->
	<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
	
	<!-- 引入angular的js-->
	<script type="text/javascript" src="static/angular/angular.min.js"></script>
  
  	
  	<script type="text/javascript">
  		var app = angular.module("app",[]);
  		app.controller("AppController",["$scope",function($scope){
  			$scope.firstname = "张三";
  			
  			$scope.myRadio = "c";
  			
  			$scope.mySelect = "d";
  		}]);
  		
  	
  	</script>
  
  </head>
  
  <body ng-app="app">
  	

  	<div class="container" ng-controller="AppController">
  		

		<form>
			First Name: <input type="text" ng-model="firstname">
			<br>
			<!-- 对于复选框而言，ng-model表示一个boolean值 -->
			<input type="checkbox" ng-model="myVar" value="足球">足球
			<input type="checkbox" ng-model="myVar" value="篮球">篮球
			<input type="checkbox" ng-model="myVar" value="排球">排球
			<br>
			    选择一个选项:
			    <input type="radio" ng-model="myRadio" value="a">Apple
			    <input type="radio" ng-model="myRadio" value="b">Bag
			    <input type="radio" ng-model="myRadio" value="c">cat
			    <input type="radio" ng-model="myRadio" value="d">dog
			    
			   <br>
			   选择一个选项:
				<select ng-model="mySelect">
				    <option value="a">Apple</option>
				    <option value="b">Bag </option> 
				    <option value="c">cat</option>  
				    <option value="d">dog </option> 
				</select>
		</form>
		 
		<h1>文本框: {{firstname}}</h1>
		
		<h1 ng-show="myVar">复选框：你选中了！</h1>
		
		<h1>单选框：{{myRadio}}</h1>
		
		<h1>下拉框：{{mySelect}}</h1>
  		
  	</div>
    
    
    
  </body>
</html>
