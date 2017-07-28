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
  
  	<script type="text/javascript">
  		$(function(){
  			//对新增按钮绑定事件
  			$("#addEmpBtn").click(function(){
  			
  				
  				
  				//通过ajax请求获取部门信息
  				$.ajax({
  					url:"emp/selectDepts",
  					type:"POST",
  					success:function(data){
						//清空下拉框中数据
						$("#addEmpModal select").empty();
						
  						//data表示要遍历的集合或数组
  						//index表示下标
  						//obj表示各个元素
  						$.each(data,function(index,obj){
  							//创建option标签
  							var option = $("<option value='"+obj.dept_id+"'>"+obj.dept_name+"</option>");
  							//添加到部门的下拉框中
  							$("#addEmpModal select").append(option);
  						});
  					}
  				});
  				
  				//打开新增用的模态框
  				$("#addEmpModal").modal("show");
  			});
  			
  			//对保存按钮绑定事件
  			$("#saveEmpBtn").click(function(){
  				var data = $("#addEmpModal form").serialize();
  				$.post("emp/save",data,function(){
  					//关闭模态框
  					$("#addEmpModal").modal("hide");
  					//重新加载当前页面
  					window.location.reload();
  				} );
  			});
  			
  			//对删除按钮绑定事件
  			$(".delEmpBtn").click(function(){
  				$("#deleteEmpModal").modal("show");
  			});
  			
  			
  			
  			//对各行的修改按钮绑定事件
  			$(".editEmpBtn").click(function(){
  				//
  				$("#updateEmpModal :radio").attr("checked",false);
  				$("#updateEmpModal select option").attr("selected",false);
  			
  				//获取该行员工数据
  				//var empId = $(this).parent().parent().find("td:first-child").text();
  				var trEle = $(this).parent().parent();
  				var empId = $(trEle).find("td:eq(0)").text().trim();
  				var empName = $(trEle).find("td:eq(1)").text().trim();
  				var empGender = $(trEle).find("td:eq(2)").text().trim();
  				var empEmail = $(trEle).find("td:eq(3)").text().trim();
  				var empDept = $(trEle).find("td:eq(4)").text().trim();
  				
  				//alert(empId+","+empName+","+empGender+","+empEmail+","+empDept);
  				//对修改用的模态框进行赋值
  				$("#updateEmpModal input[name=emp_id]").val(empId);
  				$("#updateEmpModal input[name=emp_name]").val(empName);
  			    $("#updateEmpModal :radio[value="+empGender+"]").attr("checked",true);
  				$("#updateEmpModal select option").attr("selected",false);
  				
  				//打开修改用的模态框
  				$("#updateEmpModal").modal("show");
  			});
  		});
  		
  	</script>
  
  </head>
  
  <body>
  	
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
								<input type="text" class="form-control" id="inputEmpName"
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
									<option value="开发部">开发部</option>
									<option value="测试部">测试部</option>
									<option value="人事部">人事部</option>
									<option value="实施部">实施部</option>
									<option value="财务部">财务部</option>
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
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
									name="emp_name" placeholder="请输入员工姓名"  aria-describedby="helpBlock2">
								<span id="helpBlock2" class="help-block"></span>
								
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
								
									
										<option value="开发部">开发部</option>
										<option value="测试部">测试部</option>
										<option value="人事部">人事部</option>
										<option value="实施部">实施部</option>
										<option value="财务部">财务部</option>
							
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="saveEmpBtn" type="button" class="btn btn-primary">保存</button>
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
  				<button id="addEmpBtn" class="btn btn-success btn-lg" >
  					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  					新增
  				</button>
  			</div>
  		</div>
  		<div class="row">
    		<div class="col-md-10 col-md-offset-1">
		    	<table class="table  table-hover">
		    		<tr>
		    			<td>id</td>
		    			<td>员工姓名</td>
		    			<td>性别</td>
		    			<td>邮箱</td>
		    			<td>所属部门</td>
		    			<td>操作</td>
		    		</tr>
		    		<c:forEach items="${pageInfo.list}" var="emp">
			    		<tr>
			    			<td>${emp.emp_id }</td>
			    			<td>${emp.emp_name }</td>
			    			<td>${emp.gender}</td>
			    			<td>${emp.email}</td>
			    			<td>${emp.dept.dept_name}</td>
			    			<td>
			    				<button class="btn btn-primary editEmpBtn">
			    					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			    					修改
			    				</button>
	
			    				<button class="btn btn-danger delEmpBtn">
			    					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
			    					删除
			    				</button>
			    			</td>
			    		</tr>
		    		</c:forEach>
		    		
		    		
		    	</table>
    		</div>
    	</div>
    	
    	<!-- 分页条 -->
    	<div class="row">
    		<div class="col-md-6">共有${pageInfo.total }条数据,共有${pageInfo.pages}页</div>
    		
   			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="emp/selectPage?pageno=1">首页</a></li>
			  	 <li>
			      <a href="emp/selectPage?pageno=${pageInfo.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  	<c:forEach items="${pageInfo.navigatepageNums }" var="num">
				    <c:if test="${num == pageInfo.pageNum }">
					    <li class="active"><a href="emp/selectPage?pageno=${num }">${num }</a></li>
				    </c:if>
				    <c:if  test="${num != pageInfo.pageNum }">
					    <li><a href="emp/selectPage?pageno=${num }">${num }</a></li>
				    </c:if>
			  	</c:forEach>
			    <li>
			      <a href="emp/selectPage?pageno=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    <li><a href="emp/selectPage?pageno=${pageInfo.pages}">尾页</a></li>
			    
			  </ul>
			</nav>
    	</div>
    	
  	</div>
    
    
    lastPage:${pageInfo.lastPage }
  </body>
</html>
