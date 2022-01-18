<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbCon.jsp" %>

<%
String cnt = " SELECT count(*) total FROM board";
ResultSet rsCnt = stmt.executeQuery(cnt);
rsCnt.next(); //게시물 총갯수
int total = rsCnt.getInt("total");

String sql = " SELECT unq,";
		sql+=" title,";
		sql+=" name,";
		sql+=" date_format(rdate,'%Y-%m-%d') rdate,"; 
		// left(rdate,10), substring(1,10)
		sql+=" hits ";
		sql+=" FROM board ";
		sql+=" ORDER BY unq DESC ";
	   
ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
	<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>Main Content</h2>
				총 게시물 갯수 : <%=total%> 개</td>
			<button type="button" onclick="location='boardWrite.jsp'">글쓰기</button>
		<table class="table" width="600px">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<%while(rs.next()){		
				String title = rs.getString("title");
				String name = rs.getString("name");
				String rdate = rs.getString("rdate");
				String hits = rs.getString("hits");	
			%>
			<tr>
				<td><%=total%></td>
				<td><%=title %></td>
				<td><%=name %></td>
				<td><%=rdate %></td>
				<td><%=hits %></td>
			</tr>
			<%	total--;}%>	
		</table>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>