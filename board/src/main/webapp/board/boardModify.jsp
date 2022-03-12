<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String strReferer = request.getHeader("referer");
if(strReferer == null){
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location='../main/index.jsp';
	</script>
<%
	return;
}

String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>
<!-- 유효성 체크 -->
<%
if( unq == null || pass == null){
%>
	<script>
	alert("잘못된 경로의 접근입니다.");
	location="boardList.jsp";	
	</script>
<%
	return;
}
%>
<!-- 패스워드 일치 검사 -->
<%
// 게시물 번호와 게시물 비밀번호가 일치할시에 1 그외에는 0 이다.

String sql2 = " SELECT count(*) cnt FROM board ";
       sql2+= " WHERE unq = '"+unq+"' and pass = '"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql2);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt==0){
%>
	<script>
	alert("암호를 다시 확인해 주세요.");
	history.back();
	</script>
<%
	return;
}

String sql = "SELECT ";
	sql += " title,";
	sql += " name,";
	sql += " content, ";
	sql += " pass ";
	sql += " FROM board ";
	sql += " WHERE unq='"+unq+"' ";

rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String content = "";
String pw = "";

if(rs.next()){ //예외처리
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
	pw = rs.getString("pass");
} else {	
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "boardList.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ Board Modify ∙</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<body onload="fn_onload()" >
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>∙ Board Modify ∙</h2>
	<form name="frm" method="post" action="boardModifySave.jsp">
	<input type="hidden" name="unq" value="<%=unq%>"> <!-- 키 값을 보내준다. -->
	
	<table class="table">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<td style="text-align:left"><input size="30" type="text" name="title" value="<%=title%>"></td>
		</tr>			
		<tr>
			<td style="text-align:left">
			<textarea name="content" rows="10" cols="30"><%=content%></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
		<tr>
			<td style="text-align:left"><input type="text" name="name" value="<%=name%>" readonly></td>
		</tr>
		<tr>
			<td style="text-align:left"><input type="password" name="pass" value="<%=pw%>" required></td>
		</tr>
	</table>
		<div class="view"> <!-- 버튼과 테이블의 간격을 위해추가 -->
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset" onclick="location='boardList.jsp'">취소</button>
		</div>
	</form>	
</div>
<footer>by yunamom</footer>
</body>
<script src="../script/script.js"></script>
</html>