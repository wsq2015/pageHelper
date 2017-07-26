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
  
  <body>
      <table class="table">
<caption>show:  ${usernameShow }</caption>

<thead>
<tr>
<th>姓名</th>
<th>手机号码</th>
</tr>
</thead>
<tbody>
   <c:forEach items="list" var="lists">
	<tr>
	<td>lists.username</td>
	<td>list.phone</td>
	</tr>
	</c:forEach>
<tr>
<td>Sachin</td>
<td>Mumbai</td>
</tr>
</tbody>
</table>
  
    
  
  </body>
</html>
