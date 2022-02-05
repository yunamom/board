<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String unq = request.getParameter("unq");

//조회수 증가 SQL
String sql2 = "UPDATE reboard SET hits = hits+1 WHERE unq = '"+unq+"' ";

stmt.executeUpdate(sql2);

//화면 출력 SQL
String sql = "SELECT ";
	sql += " title,";
	sql += " name,";
	sql += " pass,";
	sql += " content,";
	sql += " DATE_FORMAT(rdate,'%Y년%m월%d일')rdate";
	sql += " FROM reboard ";
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
	
	title = title.replaceAll("<[^>]*>","");
	
	/*
	content 부분에 \n 및 공백을 html 요소로 바꿈
	\n : 화면에서 데이터 저장 시 줄바꿈의 결과로 DB에 저장된 기호 (안보임)
	*/
	content = content.replace("\n","<br>");
	content = content.replace(" ","&nbsp;");
	rdate = rs.getString("rdate");
}else{
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "../main/index.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 게시판 화면</title>
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
    <h2>Q & A</h2>
	<table class="table">		
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
			<td style="top:0px; height:250px">
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
			<button type="button" onclick="location='reBoardList.jsp'">목록</button>
			<%
			if(session_id != null){
			%>
			<button type="button" onclick="location='replyWrite.jsp?unq=<%=unq%>'">답변</button>
			<!-- 현재 위치한 화면의 unq 값을 답변게시물 작성에 넘겨준다. -->
			<button type="button" onclick="location='passModify.jsp?unq=<%=unq%>&gubun=R'">수정</button>	
			<button type="button" onclick="location='passWrite.jsp?unq=<%=unq%>&gubun=R'">삭제</button>
			<!-- 게시판과 답변 게시판의 unq 넘버를 구분하기위해 check=R attribute 를 작성해준다. -->				
				
			<%
			}		
			%>
		</div>
</div>
</body>
</html>