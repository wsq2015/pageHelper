<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
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
    
    
  </head>
  
  <body>
    	<span id="mySpan">你好！</span>
   <script type="text/javascript">
   
   		var spanEle = 	document.getElementById("mySpan");
   		spanEle.innerHTML = "大家好才是真的好！";
   		spanEle.style.color = "red";
  		/* var stu = {name:"张三",age:18,sex:"男"};
  		for(var prop in stu){
  			alert(prop+"--->"+stu[prop]);
  		}
  		
  		 */
  		
  		/* var name = window.prompt("你是名字是?","");
  		
  		alert(name);  */
  		
  		
  		/* function show(){
  			alert("3秒钟过去了！");
  		}
  		
  		//window.setTimeout(show,3000);
  		window.setInterval(show,3000); */
  		
  		
  		
  	</script>

  
  </body>
</html>
