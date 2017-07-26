<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript">
	//默认的阅读状态:  0---全部，1----未读,2----已读
	var status = 0;
	//默认的排序： 0---不排序，1----按时间升序,2----按时间排序
	var orderFlag = 0;
	//默认的页码
	var pageNum = 1;
	//默认每页的条数
	var pageSize = 3;
	
	//创建模块
	var app = angular.module("app", []);
	app.controller("MyController", [ "$scope", "$http",function($scope, $http) {
		
		//跳转到第num页
		$scope.toPage = function(num,pageSize,status,orderFlag){
		 	$http({
				method : "GET",
				url : "${pageContext.request.contextPath}/user/select?pageno="+num+"&pagesize="+pageSize+"&status="+status+"&orderFlag="+orderFlag
				//data:{pageno:num,pagesize:pageSize,status:status,orderFlag:orderFlag},
				//headers:{"Content-Type":"application/x-www-form-urlencoded"}
			}).then(function successCallback(response) {
				//pageInfo
				$scope.pageInfo = response.data;
				//集合数据
				$scope.emailList = $scope.pageInfo.list;
				
				//对当前页码赋值
				pageNum = $scope.pageInfo.pageNum;
			}, function errorCallback(response) {
			
			});
		
		};
		
		//默认跳转到第1页
		$scope.toPage(1,pageSize,status,orderFlag);
		
		
		//根据阅读状态进行分页查询
		$scope.selectByStatus = function(){
			//获取当前选中的阅读状态
			status = angular.element("#statusSelect").find("option:selected").val();
			//跳转到第1页
			$scope.toPage(1,pageSize,status,orderFlag);
			
		};
		
		
		//升序方法
		$scope.orderAsc = function(){
			orderFlag = 1;
			//跳转到第1页
			$scope.toPage(pageNum,pageSize,status,orderFlag);
		};
		//降序方法
		$scope.orderDesc = function(){
			orderFlag = 2;
			//跳转到第1页
			$scope.toPage(pageNum,pageSize,status,orderFlag);
		};
		
		
		$scope.flag = false;//默认不选
		//全选、全不选
		$scope.ck=function(){
			$scope.flag=!$scope.flag;
			angular.element(".comm").prop("checked",$scope.flag);
		};
		//校验是否全选
		$scope.cks=function(){
			//比较被选的和未选的多选框
			var ck=$(".comm").length;
			var cks=$(".comm:checked").length;
			$scope.flag=(ck==cks);
		};
		
		
		$scope.batchRead=function(){
			var id="";
			var cks=$(".comm:checked");
			
			for(var i=0;i<cks.length;i++){
			
				var ck=cks[i].value;
				if(i==0){
					id+=ck;
				}else{
					id+=","+ck;
				}
			}
			
			alert(id);
			
			$http({
				method : "GET",
				url : "${pageContext.request.contextPath}/user/batchRead?eids="+id
				//data:{pageno:num,pagesize:pageSize,status:status,orderFlag:orderFlag},
				//headers:{"Content-Type":"application/x-www-form-urlencoded"}
			}).then(function successCallback(response) {
				//回调
				$scope.toPage(pageNum,pageSize,status,orderFlag);
			}, function errorCallback(response) {
			
			});
			

			
			
			
		};

	} ]);
</script>
</head>

<body ng-app="app" ng-controller="MyController">



<div class="modal fade bs-example-modal-sm" tabindex="-1" id="delModal" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">是否确认删除?</h4>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" ng-click="qr()">确认</button>
      </div>
    </div>
  </div>
</div>
	<center>
		<h1>我的邮箱页面</h1>
		<select id="statusSelect" onchange="angular.element(this).scope().selectByStatus()">
			<option value="0">全部邮件</option>
			<option value="1">未读邮件</option>
			<option value="2">已读邮件</option>
		</select>
		<table border="1">
			<tr>
				<td>
					<button type="button"
						class="btn btn-default glyphicon glyphicon-user" ></button>
				</td>
				<td>
					<button type="button" class="btn btn-success" ng-click="batchRead()">批量设为已读</button>
				</td>
				<td>
					<button type="button" class="btn btn-danger" ng-click="delAll()">批量删除</button>
				</td>
				<td>
					<button type="button" class="btn btn-primary" ng-click="orderAsc()">按时间升序排列</button>
				</td>
				<td>
					<button type="button" class="btn btn-info" ng-click="orderDesc()">按时间降序排列</button>
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" ng-click="ck()" ng-checked="flag"></td>
				<td>发件人</td>
				<td>阅读状态</td>
				<td>邮件标题</td>
				<td>发送时间</td>
			</tr>
			<tr ng-repeat="email in emailList">
				<td><input type="checkbox" class="comm"  ng-click="cks()" value="{{email.id}}"></td>
				<td>{{email.efrom}}</td>
				<td>
				
					<!-- 未读 -->
					<div ng-if="email.status==1">
						<span class="glyphicon glyphicon-envelope status">
						</span>
					</div>
					<!-- 已读 -->
					<div ng-if="email.status==2">
						<span class="glyphicon glyphicon-ok"></span>
					</div>
				</td>
				<td>{{email.title}}</td>
				<td>{{email.createtime}}</td>
				<!-- <td  ng-bind="email.createtime | date:'yyyy-MM-dd HH:mm:ss'"></td> -->
			</tr>
		</table>
		
<ul class="pagination">
总条数:{{pageInfo.total}}
    <li ng-show="d.hasPreviousPage"><a href="javascript:void(0)">&laquo;</a></li>
     <li ng-hide="d.hasPreviousPage"><a href="javascript:void(0)">首页</a></li>
    <li class="active" ng-show="d.navigatepageNums"><a href="javascript:void(0)">1</a></li>
    <li class="disabled"><a href="javascript:void(0)">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li ng-show="d.hasNextPage"><a href="javascript:void(0)">尾页</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
	</center>
	<form action="user/update" id="form">
	<input name="id" type="hidden" id="ids">
	<input name="status" type="hidden" id="statuss">
	</form>
</body>

</html>
