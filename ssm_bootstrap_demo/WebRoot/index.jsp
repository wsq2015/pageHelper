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
	
	<!-- 引入bootstrap的js-->
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	<!-- 引入angularJS -->
	<script type="text/javascript" src="static/angular/angular.min.js"></script>
	<script type="text/javascript">
	
		
		//创建模块
		var empApp = angular.module("empApp",[]);
		
		var pages;//记录总页数
		
		//创建控制器
		empApp.controller("EmpAppController",["$scope","$http",function($scope,$http){
			//跳转到指定页码
			$scope.toPage = function(num){
				//发送http请求
			    $http({
			        url:"emp/selectPageJson?pageno="+num,
			        method:"GET"
			    }).then(function successCallback(response) {
			          // console.log(response.data);
			          $scope.pageInfo = response.data.data.pageInfo;
			          //定义员工数据列表模型
			          $scope.empList = $scope.pageInfo.list;
			          //为总页数赋值
			          pages = $scope.pageInfo.pages;
			    });
			    
			   /*  $http({
					url:'data.json',
					method:'GET'
				}).success(function(data,header,config,status){
					//响应成功
				
				}); */
			};
			
			//默认跳转到第1页
			$scope.toPage(1);
			
			//加载部门列表
			$scope.loadDepts = function(){
				$http({
			        url:"emp/selectDepts",
			        method:"GET"
			    }).then(function successCallback(response) {
			    	$scope.deptList = response.data;
			    	//console.log($scope.deptList);
			    });
			};
			//重置表单
			$scope.resetForm = function(type){
			
			};
			
			//定义显示新增模态框的函数
			$scope.showAddModal = function(){
				//重置表单
				angular.element("#addEmpModal form").empty();
				//加载部门列表
				$scope.loadDepts();
				//打开模态框
				angular.element("#addEmpModal").modal("show");
			};
			
		    //给保存按钮绑定事件，执行保存操作
			$scope.saveEmp = function(){
				var data = angular.element("#addEmpModal form").serialize();
				//alert(data);
				$http({
			        url:"emp/save",
			        method:"POST",
			        data:data,
			        headers:{"Content-Type":"application/x-www-form-urlencoded"}
			    }).then(function successCallback(response) {
			    	
			    	//alert("处理成功！");
			    	angular.element("#addEmpModal").modal("hide");
			    	$scope.toPage(pages+1);
			    	
			    });
				
			
			};
						
			//使用jquery绑定事件时，如果元素已经存在，可以使用$(选择器).click(...)
			//				如果元素是后来动态生成的，则使用$(document).on(事件名称,选择器,回调函数);
			/* $(document).on("click",".editEmpBtn",function(){
				//打开模态框
				angular.element("#updateEmpModal").modal("show");
			}); */
			
			//定义显示修改模态框的函数
			$scope.showUpdateModal=function(){
				//加载部门列表
				$scope.loadDepts();
				//打开模态框
				angular.element("#updateEmpModal").modal("show");
			};
		}]);
	
	
	</script>
  
  </head>
  
  <body ng-app="empApp" ng-controller="EmpAppController">
  	
  	<!-- 删除用的模态框 -->
  	<div id="deleteEmpModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">是否确认要删除该数据?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-danger">确定</button>
				</div>
	    </div>
	  </div>
	</div>

  	<!--修改用的模态框  -->
	<div class="modal fade" id="updateEmpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmpName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-6">
								<input type="hidden" name="emp_id">
								<input type="text" class="form-control" id="inputEmpName2"
									name="emp_name" placeholder="请输入员工姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-6">
								<label class="radio-inline"> <input type="radio"
									name="gender" value="男" checked> 男 </label> <label
									class="radio-inline"> <input type="radio" name="gender"
									value="女"> 女 </label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputEmail"
									name="email" placeholder="请输入员工邮箱">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-3">
								<select class="form-control" name="dept.dept_id">
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="updateEmpBtn" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
  	<!--新增用的模态框  -->
	<div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmpName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputEmpName"
									name="emp_name" placeholder="请输入员工姓名">
								<span class="help-block"></span>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-6">
								<label class="radio-inline"> <input type="radio"
									name="gender" value="男" checked> 男 </label> <label
									class="radio-inline"> <input type="radio" name="gender"
									value="女"> 女 </label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputEmail"
									name="email" placeholder="请输入员工邮箱">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-3">
								<select  class="form-control" name="dept.dept_id">
									<option ng-repeat="d in deptList" value="{{d.dept_id}}">{{d.dept_name}}</option>
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="saveEmpBtn" ng-click="saveEmp()" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>


  	<div class="container">
  		
  		<div class="row">
  			<div class="col-md-6 col-md-offset-3">
  				<h1>员工信息管理</h1>
  			</div>
  		</div> 
  		<div class="row">
  			<div class="col-md-2 col-md-offset-10">
  				<!-- 禁用按钮：disabled="disabled" -->
  				<button id="addEmpBtn" ng-click="showAddModal()" class="btn btn-success btn-lg" >
  					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  					新增
  				</button>
  			</div>
  		</div>
  		<div class="row">
    		<div class="col-md-10 col-md-offset-1">
		    	<table id="empTable" class="table  table-hover">
		    		<tr>
		    			<td>id</td>
		    			<td>员工姓名</td>
		    			<td>性别</td>
		    			<td>邮箱</td>
		    			<td>所属部门</td>
		    			<td>操作</td>
		    		</tr>
		    		<tr ng-repeat="emp in empList">
		    			<td>{{emp.emp_id }}</td>
		    			<td>{{emp.emp_name}}</td>
		    			<td>{{emp.gender}}</td>
		    			<td>{{emp.email}}</td>
		    			<td>{{emp.dept.dept_name}}</td>
		    			<td>
		    				<button ng-click="showUpdateModal()" class="btn btn-primary editEmpBtn">
		    					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		    					修改
		    				</button>

		    				<button class="btn btn-danger delEmpBtn">
		    					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
		    					删除
		    				</button>
		    			</td>
		    		</tr>
		    		
		    	</table>
    		</div>
    	</div>
    	
    	<!-- 分页条 -->
    	<div class="row">
    		<div class="col-md-6">共有{{pageInfo.total}}条数据,共有{{pageInfo.pages}}页</div>
    		
   			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li ng-show="pageInfo.hasPreviousPage"><a href="#" ng-click="toPage(1)">首页</a></li>
			  	<li ng-hide="pageInfo.hasPreviousPage" class="disabled"><a href="#" >首页</a></li>
			    <li>
			      <a ng-show="pageInfo.hasPreviousPage" href="#" ng-click="toPage(pageInfo.pageNum-1)" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li>
			      <a ng-hide="pageInfo.hasPreviousPage" href="#"  aria-label="Previous" class="disabled">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li ng-repeat="num in pageInfo.navigatepageNums" ng-class="num==pageInfo.pageNum?'active':''">
			    	<a href="#" ng-click="toPage(num)">{{num}}</a>
			    </li>
			    <li>
			      <a href="#" ng-click="toPage(pageInfo.pageNum+1)" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    <li><a href="#" ng-click="toPage(pageInfo.pages)">尾页</a></li>
			  </ul>
			</nav>
    	</div>
    	
  	</div>
    
    
  </body>
</html>
