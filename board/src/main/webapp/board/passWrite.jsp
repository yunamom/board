<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String unq = request.getParameter("unq");

if(unq == null) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "../main/main.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link rel="stylesheet" href="../css/layout.css">
<style>
td{
text-align:left;
}
</style>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>pass Word</h2>
	<form name="frm" method="post" action="boardDelete.jsp">
	<input type="hidden" name="unq" value="<%=unq%>">
	<table class="table" width="70%">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>password</th>
			<td><input type="password" size="30" name="pass"></td>
		</tr>
	</table>
		<div>
			<button type="reset" onclick="location='boardList.jsp'">뒤로</button>	
			<button type="submit">삭제</button>
		</div>
	</form>	
</div>
</body>
</html>