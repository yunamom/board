<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbCon.jsp" %>

<%
String sql = " SELECT unq,title,name,date_format(rdate,'%Y-%m-%d') rdate,hits ";
	   sql+= " FROM board ORDER BY unq DESC ";
	   
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
	<header>
		<div class="header">
		</div>
	</header>
	<nav>
		<%@ include file="../include/topmenu.jsp" %>
		
	</nav>
	<aside>
		<%@ include file="../include/leftmenu.jsp" %>
	</aside>
	<section>
		<div class="row">
			<div class="right">
				<h2> 게시판 목록 </h2>
					<table align="center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>이름</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				<%while(rs.next()){
					String unq = rs.getString("unq");
					String title = rs.getString("title");
					String name = rs.getString("name");
					String rdate = rs.getString("rdate");
					String hits = rs.getString("hits");
				%>
					<tr>
						<td><%=unq %></td>
						<td><%=title %></td>
						<td><%=name %></td>
						<td><%=rdate %></td>
						<td><%=hits %></td>
					</tr>
				<%}%>	
					</table>			
				</div>
			</div>
		</div>
	</section>
	<footer>
		<%@ include file="../include/footer.jsp" %>
	</footer>
</body>
</html>
</html>