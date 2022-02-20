<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>∙ main ∙</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

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
<footer>by yunamom</footer>
</body>
</html>