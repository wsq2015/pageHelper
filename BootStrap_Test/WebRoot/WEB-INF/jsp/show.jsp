<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

     <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>

  <script type="text/javascript">
  
  
  //創建模塊
    var empApp = angular.module("empApp",[]);
      var pages;
      empApp.controller("EmpAppController",["$scope",function($scope,$http){
      $scope.toPage = function(num){
         $http({
           url:"test/show"+num,
           method:"get"   
         });      
      }.then(function successCallback(response){
             $scope.pageInfo = response.data.data.pageInfo;
             $scope.empList = $scope.pageInfo.list;
             pages=$scope.pageInfo.pages;
      });
      
      $scope.toPage(1);
      //加載部門列表
      $scope.queryList = function(){
      $http({
      url:"test/queryList",
      method:"get"
      }).then(function successCallback(response){
      $scope.queryLists = response.data;
      
      });
      
      };
      	//定义显示新增模态框的函数
      	$scope.showAddModel = function(){
      	//重置表單
      	angular.element("#addElement form").empty();
      	$scope.querylsit();
      	angular.element("#addEmpModel").modal("show");
      	
      	};
      
      
      
      
      
      
      
      
     
      
      }]);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
		//创建模块
		var empApp = angular.module("empApp",[]);
		//创建控制器
		empApp.controller("EmpAppController",["$scope","$http",function($scope,$http){
			//跳转到指定页码
			$scope.toPage = function(num){
				//发送http请求
			    $http({
			        url:"test/show?pageno="+num,
			        method:"GET"
			    }).then(function successCallback(response) {
			            
			          // console.log(response.data);
			          $scope.pageInfo = response.data.data.pageInfo;
			          //定义员工数据列表模型
			          $scope.empList = $scope.pageInfo.list;
			          //
			          $scope.pages = $scope.pageInfo.pages;
			          
			    }, function errorCallback(response) {
			            // 请求失败执行代码
			    });
			};
			
			//默认跳转到第1页
			$scope.toPage(1);
			//加载部门列表
			$scope.loadDeptment = function(){
			$http({
			  url:"test/queryDep",
			  method:"POST",
			  }).then(function successCallback(response){
			  $scope.listDep=response.data;
			  });
			};
			
			$scope.userAddbtn = function(){
			
			//刷新表单
			angular.element("#addUser form").empty();
			//加载部门列表
			$scope.loadDeptment();
			//打开模态框
			angular.element("#addUser").modal("show");
			};
			
			
			
			
		
				
		}]);
	
	
  
    
   /*  //修改事件
    $(function(){
    
    $(".eidtBtn").click(function(){
    
    var ids = $(this).parent().parent();
     ///////////var id = $(ids).find("input a1").val().trim(); 
     var id = $(this).parent().parent().find("th input:first-child").val();
     var ename = $(ids).find("th:eq(0)").text().trim();
     var ebirthday = $(ids).find("th:eq(1)").text().trim();
     var gender = $(ids).find("th:eq(2)").text().trim();
     var email = $(ids).find("th:eq(3)").text().trim();
     
         
    $("#eitdModel input[name=id]").val(id);
    $("#eitdModel input[name=ename]").val(ename);
    $("#eitdModel input[name='email']").val(email);
    $("#eitdModel input[name='ebirthday']").val(ebirthday);
    $("#eitdModel :radio[value="+gender+"]").prop("checked",true);
    
    // $("#eitdModel select option[value="+sel+"]").prop("selected",true); 
  
  
      
    $("#eitdModel").modal("show");
    });
    
    
    }); */
    
    
/*     
     //新增事件
    $("#userAddbtn").click(function(){
    
    //打开新增用的模态框
    $("#addUser").modal("show");
    
    });
    $(function(){
  			//对新增按钮绑定事件
  			$("#userAddbtn").click(function(){
    
		   $.ajax({
		   
		      url:"test/queryDep",
		      type:"POST",
		      success:function(data){
		      $("#addUser select").empty();
		      
		     
		      $.each(data,function(index,obj){
		      
  			  //添加到部门的下拉框中
  			 $("#addUser select").append( $("<option value='"+obj.did+"'>"+obj.dname+"</option>") );
		   
		      
		
		      
		      });
		      }
		      
		   });
  				//打开新增用的模态框
  				$("#addUser").modal("show");
  				
  			});
   
   }); */
    
    
  

  
  </script>
  <body ng-app="empApp" ng-controller="EmpAppController">
  
  <center>
  <h1>列表查询</h1>
      <h3>用户名:${empdl.ename}</h3>
      
   <div class="container">
	    <div class="row">
		    <div class="col-md-9"></div>
		    <div class="col-md-3">
		    <div>
		    
		       <button type="button" id="userAddbtn" class="btn btn-success">
		        <span class="glyphicon glyphicon-plus"></span>
		                       添加用户
		       </button>
		      </div>
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            
            
            
        <form class="form-horizontal" action="test/add" method="post">
            <div class="modal-body">

           
		  <div class="form-group">
		    <label for="Addname" class="col-sm-2 control-label">名字:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="ename" name="ename" placeholder="请输入名字">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="Addpassword" class="col-sm-2 control-label">密码:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" name="email" id="email" placeholder="请输入密码">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="Addage" class="col-sm-2 control-label">年龄:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" name="ebirthday" id="ebirthday" placeholder="请输入年龄">
		    </div>
		  </div>
		  
		
		  <div class="form-group">
		   <label for="Addage" class="col-sm-2 control-label">性别:</label>
		    <div class="col-sm-3">
		     <input type="radio" name="gender" checked="checked" value="男">男
		     <input type="radio" name="gender"  value="女">女
		    </div>
		  </div>

           </div>
		 
		 
		<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">学生</label>
							<div class="col-sm-3">
								<select name="student.uid">
								
									
										<option>---请选择---</option>
									
							
								</select>
							</div>
						</div>
		 
           
           
           
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="添加">
            </div>
            
            
         </form>
         
         
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


	
  </div>
    </div>
    </div>
    
    
    <div class="modal fade" id="eitdModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="myModalLabel">修改页面</h4>
            </div>

             <form class="form-horizontal" action="test/update" method="post">
            <div class="modal-body">

           
		    <input type="hidden" value="id" name="id">
		      
		      
		      
		  <div class="form-group">
		    <label for="Addname" class="col-sm-2 control-label">名字:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" value="ename" name="ename">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="Addpassword" class="col-sm-2 control-label">邮箱:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" name="email" value="email" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="Addage" class="col-sm-2 control-label">出生日期:</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" name="ebirthday" value="ebirthday" >
		    </div>
		  </div>
		  
		
		  <div class="form-group">
		   <label for="Addage" class="col-sm-2 control-label">性别:</label>
		    <div class="col-sm-3">
		    
		     <input type="radio" name="gender" value="男">男
		    
		     <input type="radio" name="gender" value="女">女
		     
		    </div>
		  </div>

           </div>
           
           
           
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="修改">
            </div>
            
            
         </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
    
    
    
    
    
  <div class="container">
  <div class="row">
   <div class="col-md-10 col-md-offset-1">
     <table class="table table-bordered">
	  <tr>
	  	<th>姓名</th>
	  	<th>出生年月</th>
	  	<th>性别</th>
	  	<th>邮箱</th>
	  	<th>所在部门</th>
	  	
	  	<th >修改</th>  
	  	<td><input type="checkbox" id="fix"/>
	  	<input type="button" id="Abutton" value="全部删除" class="btn btn-danger" >
	  	</td>
	 
	  	
	  </tr>
	  
	   <tr ng-repeat="user in empList">
	  	<th><input class="a1" type="checkbox" name="items" >{{user.ename}}</th>
	  	<th>{{user.ebirthday}}</th>
	  	<th>{{user.gender}}</th>
	  	<th>{{user.email}}</th>
	  	<td>{{user.department.dname}}</td>
	  	<th><button class="btn btn-primary eidtBtn">
	     <span class="glyphicon glyphicon-edit"></span>
	  	   修改
	  	 </button></th>
	  	 <td> <a href="test/delete2?ids={{user.Department.id}}" class="btn btn-danger">
	     <span class="glyphicon glyphicon-trash"></span>
	  	      删除
	  	</a> </td>
	  </tr>
	  
  </table>
   </div>
  </div>
  </div>
	





<!-- 分页条 -->
<div class="row">
  <div class="col-md-6">共有{{pageInfo.total}}条数据,{{pageInfo.pageNum}}/{{pageInfo.pages}}</div>
    		
<nav aria-label="Page navigation">
 <ul class="pagination">
<li ng-show="pageInfo.hasPreviousPage"><a href="javascript:opener.location.reload()" ng-click="toPage(1)">首页</a></li>
<li ng-hide="pageInfo.hasPreviousPage" class="disabled"><a >首页</a></li>
			    <!-- 判断是否有上一页 -->
<li><a ng-show="pageInfo.hasPreviousPage" href="javascript:opener.location.reload()" ng-click="toPage(pageInfo.pageNum-1)" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a></li>
			    <!-- 判断是否有上一页，如果没有隐藏 -->
 <li><a ng-hide="pageInfo.hasPreviousPage" href="javascript:opener.location.reload()"  aria-label="Previous" class="disabled"><span aria-hidden="true">&laquo;</span></a></li>
			    
<li ng-repeat="num in pageInfo.navigatepageNums" ng-class="num==pageInfo.pageNum?'active':''"><a href="javascript:opener.location.reload()" ng-click="toPage(num)">{{num}}</a></li>
			    
<li><a ng-show="pageInfo.hasNextPage" href="javascript:opener.location.reload()" ng-click="toPage(pageInfo.pageNum+1)" aria-label="Next"><span aria-hidden="true">&raquo;</span> </a></li>
<li><a ng-hide="pageInfo.hasNextPage" href="javascript:opener.location.reload()" class="disabled" aria-label="Next"><span aria-hidden="true">&raquo;</span> </a></li>

<li><a ng-show="pageInfo.hasNextPage" href="javascript:opener.location.reload()" ng-click="toPage(pageInfo.pages)">尾页</a></li>
<li><a ng-hide="pageInfo.hasNextPage" class="disabled">尾页</a></li>
</ul>
	</nav>
</div>
    	
  	</div>
    
    
   
		
		
	
  
  </center>
  
  </body>
  <script type="text/javascript">
  
  $(function(){
  $("#fix").click(function(){
     var falg = this.checked;
  $(":checkbox[name='items']").prop("checked",falg);
    
   });
  
 $(":checkbox[name='items']").click(function(){
      alert("111111");
      $("#fix").prop("checked",$(":checkbox[name='items']").length == $(":checkbox[name='items']:checked").length );
      });
  });
  
  $(function(){
  
  $("#Abutton").click(function(){
    var ids="";
    var arr = $(":checkbox[name='items']:checked");
    for(var i=0;i< $(":checkbox[name='items']:checked").length;i++){
      ids+= ","+arr[i].value;
    }
    
    alert(ids);
    ids= ids.substring(1);
     if(ids==''){
        alert("没有要删除的元素");
        return false;
     }
     var ios = confirm("确认要删除所选记录吗？");
     if(ios){
        window.location.href="<%=basePath%>test/delete2?ids="+ids;
     }
    });
  
    });
  
  </script>
</html>