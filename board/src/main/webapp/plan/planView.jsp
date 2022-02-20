<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/certificate.jsp" %>
<%@ include file="../include/dbCon.jsp" %>
<%
String pdate = request.getParameter("pdate");
if(pdate == null || USERID == null){
%>
	<script>
	alert("잘못된 경로의 접근입니다.");
	self.close();
	</script>	
<%
	return;
}
String sql = " SELECT title,content,pdate,week FROM plan ";
       sql+= " WHERE userid='"+USERID+"' and pdate='"+pdate+"' ";
ResultSet rs = stmt.executeQuery(sql);

String title = "";
String content = "";
String week = "";
if(rs.next()){
	title = rs.getString("title");
	content = rs.getString("content");	
	week = rs.getString("week");
}else{
%>
	<script>
	alert("정보를 불러올수없습니다.");
	self.close();
	</script>
<%
	return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ planView ∙</title>
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
	<form name="frm" method="post" action="planWriteSave.jsp">
	<input type="hidden" name="unq" value="">
	<table class="table">		
		<tr>
			<td><%=title %></td>
		</tr>
		<tr>
			<td style="height:300px; float:left;" valign="top"><%=content %></td>
		</tr>
	</table>
		<div class="view">
			<input type="hidden"name="pdate" >	
			<button type="button" onclick="fn_modify('<%=pdate%>')">수정</button>
			<button type="button" onclick="fn_delete('<%=pdate%>')">삭제</button>
			<button type="button" onclick="self.close()">확인</button>
		</div>
	</form>
</div>
</body>
<script src="../script/script.js"></script>
</html>