<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
<%

String unq = request.getParameter("unq");

if( unq == null || unq.equals("")){
%>
	<script>
	alert("잘못된 경로의 접근!");
	location="boardList.jsp";
	</script>
<%
	return; //JSP 종료
}

String sql = "SELECT ";
	sql += " title,";
	sql += " name,";
	sql += " content ";
	sql += " FROM reboard ";
	sql += " WHERE unq='"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String content = "";

if(rs.next()){ //예외처리
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
} else {	
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "reBoardList.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 게시판 수정</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<script>

function fn_submit() {
	var f = document.frm; 
	
	if(f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	if(f.pass.value == "") {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	if(f.name.value == "") {
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(f.content.value == "") {
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	f.submit();
	
}
function fn_onload() {
	var f = document.frm;	
	f.title.focus(); //제목에 커서를 준다.
	f.onload();	
}
</script>
<body onload="fn_onload()" >
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>Q & A 수정</h2>
	<form name="frm" method="post" action="reBoardModifySave.jsp">
	<input type="hidden" name="unq" value="<%=unq%>"> <!-- 키 값을 보내준다. -->
	
	<table class="table">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>제목</th>
			<td style="text-align:left"><input size="40" type="text" name="title" value="<%=title%>"></td>
		</tr>			
		<tr>
			<th>암호</th>
			<td style="text-align:left"><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td style="text-align:left"><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align:left">
			<textarea name="content" rows="10" cols="40"><%=content%></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
	</table>
		<div>
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset" onclick="location='reBoardList.jsp'">취소</button>
		</div>
	</form>	
</div>
</body>
</html>