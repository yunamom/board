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
	sql += " content,";
	sql += " DATE_FORMAT(rdate,'%Y년%m월%d일')rdate";
	sql += " FROM board";
	sql += " WHERE unq = '"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String content = "";
String rdate = "";

if(rs.next()){ //예외처리
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
	// replace 
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
<title>게시글작성</title>
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
    <h2>boardDetail</h2>
	<form name="frm" method="post" action="boardWriteSave.jsp">
	<table class="table" width="80%">		
	<colgroup>
		<col width="25%"/>
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
			<th>내용</th>
			<td>
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
		<div>
			<button type="button" onclick="location='boardModify.jsp?unq=<%=unq%>'">수정</button>	
			<button type="button" onclick="location='boardList.jsp'">목록</button>
			<button type="button" onclick="#">삭제</button>
		</div>
	</form>	
</div>
<div class="footer">
<p>by yunamom</p>
</div>
</body>
</html>