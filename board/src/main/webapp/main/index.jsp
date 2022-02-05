<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
.main {
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 50px;
}
.main a {
	font-size: 20px;
	text-decoration: none;
	color: #454545;
}
.main a:hover {
	color: #9c6071;
}
</style>
<link rel="stylesheet" href="../css/layout.css">
<body>
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
<%
  String main="";
  if(session_id != null){
	  main = session_id+" 님 환영합니다 !";
  }
%>
	<div class="main">
	<a href="https://yunamom.duckdns.org">
	∙ Project File List ∙</a>
	</div>
	<div class="main"><%=main%></div>
</div>
<div class="footer">
  <p>by yunamom</p>
</div>
</body>
</html>