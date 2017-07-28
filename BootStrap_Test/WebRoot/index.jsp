<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript"
	src="static/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
.row {
	background: url(static/img/yu.jpg) no-repeat center fixed;
	height: 600px;
	background-size: contain
}
</style>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$(".select").one("click",function() {
		$.ajax({
		type : "POST",
        url : ("test/queryDep"),
	success : function(data) {
        $(".select").empty();
        $.each(data,function(index,obj) {
        var option = $("<option value='"+obj.did+"'>"+ obj.dname+ "</option>");
		$(".select").append(option);
		$(".select option[value='"+obj.did+ "']").prop("selected",true);});
		}
});	});
																			
		$(function(){
		$("#submit").click(function(){
		if($("#ename").val().trim()=="" || $("#ename").val().trim()==null ){
		    $("#ename").next().text("用户名为空").prop("style","color:red");
		    return false;
		}
		$("#ss").empty(); 
		var span=$("<span id='ss' style='color: red'>邮箱为空</span>");
		if($("#email").val().trim()=="" || $("#email").val().trim()==null){   
		    $("#email").after(span);
		    return false;
		}
		if($("#ebirthday").val().trim()=="" || $("#ebirthday").val().trim()==null){
		    $("#ebirthday").next().text("出生年月为空").prop("style","color:red");
		    return false;
		}
		return true;
	
	});
	});});
					
</script>

<body>


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



		<form class="form-horizontal col-md-offset-5" role="form"
			action="test/zhuce" method="post">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">名字</label>
				<div class="col-md-3 ">
					<input type="text" class="form-control" name="ename" id="ename"
						placeholder="名字">
						<span ></span>
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
				<label class="col-sm-2 control-label"
					for="ConstructionPlanAdd_planStartTime">出生年月</label>
				<div class="col-md-3">
					<input class="form-control input-sm Wdate" name="ebirthday" id="ebirthday"
						type="text" readonly="readonly"
						onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						placeholder="出生年月" />
						<span></span>
				</div>

			</div>



			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">性別</label>
				<div class="col-md-3">
					<label class="checkbox-inline"> <input type="radio"
						name="gender" value="男"> 男
					</label> <label class="checkbox-inline"> <input type="radio"
						name="gender" value="女"> 女
					</label>
				</div>
			</div>

			<div class="form-group xuanze">
				<label for="lastname" class="col-sm-2 control-label">选择列表</label>
				<div class="col-md-3">
					<select class="form-control select" name="Department.did">
						<option>--- 請選擇 ---</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<button type="submit" class="btn btn-default" id="submit">註冊</button>
				</div>
			</div>

		</form>
	</div>

</body>
</html>
