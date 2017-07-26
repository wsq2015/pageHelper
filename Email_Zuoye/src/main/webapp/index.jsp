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
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <style type="text/css">
    </style>
    <script type="text/javascript">
     var app = angular.module("app",[]);
     app.controller("controllers",["$scope","$http",function($scope,$http){
		$http({
		    method:"GET",
			url:"test/selectByExample",
			dataType:"json"
		}).then(function successCallback(response) {
				$scope.emailList = response.data;
			
	   });
	       $scope.flag = false;
			$scope.checkAll = function(){
			$scope.flag = !$scope.flag;
			  angular.element(".checkOne").prop("checked",$scope.flag);
			}; 
			$scope.checkOne = function(index){
            angular.element(".checkAll").prop("checked",angular.element(".checkOne").length==angular.element(".checkOne:checked").length);
			}; 
			
			//批量设为已读
		
			$scope.readAll = function(){
			  var sendId = "";
			  var itemss = angular.element(".checkOne:checked");
			  var sendReads = "";			  
			  for(var i = 0; i < itemss.length; i++){
			  
		      	  var updateStu = angular.element(".checkOne:checked").parent().nextAll().find(".checkRead");
		      	  
			      var sendRead = updateStu[i].value;
			      var send = itemss[i].value;
			      if(i<0){
			          sendId += send;
			          sendReads += sendRead; 
			      }else{
			          sendId += send+",";
			          sendReads += sendRead+","; 
			      }
			  }
			  
			  window.location.href = "test/readAll?sendId="+sendId+"&sendRead="+sendReads;
			};
			
		
			var getId = function(){
			 var itemss = angular.element(".checkOne:checked");
		     var sendId = "";
		     for(var i=0; i<itemss.length; i++){
		        var send = itemss[i].value;
		        if(i<0){
		           sendId += send;
		        }else{
		           sendId += send+",";
		          
		        }
		     }
		      return sendId = sendId.substring(0, sendId.length-1);
			};
		
	        $scope.deleteAll = function(){
	         var sendId = getId();
		    
	         window.location.href = "test/deleteAll?sendId="+sendId;
   		      
	         };
	  
     }]);
     </script>
     
  </head>
    
  <body ng-app="app" ng-controller="controllers">
  <nav class="navbar navbar-default col-xs-6 col-md-offset-3" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <h3 style="color: gray">我的邮箱页面</h3>
        </div>
            <div class="col-xs-6 col-md-offset-5">
		                 <form>
			                 <select id="selectOp">
			                   <option>---请选择---</option>
			                   <option>已读邮箱</option>
			                   <option>未读邮箱</option>
			                 </select>
		                 </form>
              </div>
    </div>
    </nav>
    <div class="col-xs-8 col-md-offset-3">
	   <table class="table">
	  <thead>
	    <tr>
	      <th><span class="glyphicon glyphicon-user"></span></th>
	      <th><button type="button" class="btn btn-success" ng-click="readAll(this)">批量设为已读</button></th>
	      <th><button type="button" class="btn btn-danger" ng-click="deleteAll()">批量删除</button></th>
	      <th><button type="button" class="btn btn-primary">按时间升序排序</button></th>
	      <th><button type="button" class="btn btn-info">按时间降序排序</button></th>
	      </tr>
	    <tr>
	     <th>  <input type="checkbox" class="checkAll" ng-click="checkAll()" ng-checked="flag"></th>
	     <th>发件人</th>
	     <th>阅读状态</th>
	     <th>邮件标题</th>
	     <th>发件时间</th>
	      </tr>
	  </thead>
	 
	  <tbody>
		    <tr class="active" ng-repeat="list in emailList">
		    <th><input type="checkbox" class="checkOne" value="{{list.sendId}}" ng-click="checkOne($index)"></th>
				    <th>{{list.sendName}}</th>
				    
				    <th>
					<!-- 未读 -->
					<div ng-if="list.sendRead==='0'">
					<input ng-hide="true" class="checkRead" value="{{list.sendRead}}" >
						<span class="glyphicon glyphicon-envelope status">
						</span>
					</div>
					<!-- 已读 -->
					<div ng-if="list.sendRead==='1'">
					<input ng-hide="true" class="checkRead" value="{{list.sendRead}}" >
						<span class="glyphicon glyphicon-ok"></span>
					</div>
				   </th>
				   
				   
				    <th>{{list.sendTitle}}</th>
				    <th>{{list.sendTime|date:"yyyy-MM-dd HH:mm:ss"}}</th>
		    </tr>
	  </tbody>
	</table>
</div>
  </body>
</html>
