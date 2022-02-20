<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<%@ include file="../include/certificate.jsp" %>
<%
String strReferer = request.getHeader("referer");
if(USERID == null || strReferer == null){ 
//비정상적인 URL 접근차단을 위해 request.getHeader("referer") 메소드를 사용하였습니다.
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location="../main/index.jsp";
	</script>
<%
	return;
}
String pdate = request.getParameter("pdate");

String sql = " SELECT unq,title,content,week ";
       sql+= " FROM plan WHERE userid='"+USERID+"' AND pdate='"+pdate+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String unq = rs.getString("unq");
String title = rs.getString("title");
String content = rs.getString("content");
String week = rs.getString("week");

content = content.replace("<br>","\r\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ planWrite ∙</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/layout.css">
<style>
input,textarea{
	width:100%;
}
textarea{
	height:300px;
}
</style>
</head>
<body onload='document.frm.title.focus()'>
<div class="header" style="background-color:white">
  <h2><%=week%>✱</h2>
</div>
<div align="center">
	<form name="frm" method="post" action="planModifySave.jsp">
	<input type="hidden" name="unq" value="<%=unq%>">
	<table class="table">		
		<tr>
			<td><input type="text"name="title" value="<%=title%>" placeholder="제목" required></td>
		</tr>
		<tr>
			<td><textarea name="content"placeholder="내용" required><%=content %></textarea></td>
		</tr>
	</table>
		<div class="view">
			<button type="submit" onclick="fn_plan(); return false;">저장</button>	
			<button type="button" onclick="self.close()">취소</button>
		</div>
	</form>
</div>
</body>
<script src="../script/script.js"></script>
</html>