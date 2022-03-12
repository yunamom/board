<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String unq = request.getParameter("unq");
String sql2 = "UPDATE board SET hits = hits+1 WHERE unq = '"+unq+"' ";

stmt.executeUpdate(sql2);

String sql = "SELECT ";
	sql += " title,";
	sql += " name,";
	sql += " pass,";
	sql += " content,";
	sql += " DATE_FORMAT(rdate,'%Y년%m월%d일')rdate";
	sql += " FROM board";
	sql += " WHERE unq = '"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String pass = "";
String content = "";
String rdate = "";

if(rs.next()){ //예외처리
	title = rs.getString("title");
	name = rs.getString("name");
	pass = rs.getString("pass");
	content = rs.getString("content");
	// replace 
	title = title.replaceAll("<[^>]*>","");
	
	content = content.replace("\n","<br>");
	content = content.replace(" ","&nbsp;");
	rdate = rs.getString("rdate");
}else{
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
<title>∙ board Detail ∙</title>
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
    <h2>∙ board Detail ∙</h2>
	<form name="frm" method="post" action="boardWriteSave.jsp">
	<table class="table">		
	<colgroup>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>제목</th>
			<td><%=title %></td>
		</tr>		
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<td colspan="2" style="width: 100%; height: 300px; text-align:left;" valign="top">
			<!-- rows 세로 cols 가로 -->
			<%=content %>
			</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>
			<%=rdate %>
			</td>
		</tr>
	</table>
		<div class="view">
			<button type="button" onclick="location='boardList.jsp'">목록</button>
		<%if(session_id != null){ %>
			<button type="button" onclick="location='passModify.jsp?unq=<%=unq%>'">수정</button>	
			<button type="button" onclick="location='passWrite.jsp?unq=<%=unq%>'">삭제</button>
		<%} %>
		</div>
	</form>	
</div>
<footer>by yunamom</footer>
</body>
</html>