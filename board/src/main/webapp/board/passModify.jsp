<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String unq = request.getParameter("unq");
String gubun = request.getParameter("gubun");
// 답변형 게시판은 수정버튼을 눌렀을때 gubun=R 일반은 null

if(unq == null) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "../main/main.jsp";
	</script>
<%
	return;
}
String modify_url = ""; // 구분을 위해 변수를 생성해준다.
String modifypass_url = "";

if(gubun == null) { 
	modify_url = "boardModify.jsp";
	modifypass_url = "boardList.jsp";
}
else if(gubun.equals("R")) {
	modify_url = "reBoardModify.jsp";
	modifypass_url = "reBoardList.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>delete</title>
	<link rel="stylesheet" href="../css/layout.css">
</head>

<!--  onload : 화면이 열릴 때 발생하는 이벤트 핸들러 속성-->
<body onload='document.frm.pass.focus()'> 
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>pass Word</h2>
	<form name="frm" method="post" action="<%=modify_url%>">
	<input type="hidden" name="unq" value="<%=unq%>">
	<table class="table" style="width:40%">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>password</th>
			<td style="text-align:left"><input type="password" size="20" name="pass"></td>
		</tr>
	</table>
		<div class="view"><!-- 버튼과 테이블 간격을 위해 추가! -->
			<button type="reset" onclick="location='<%=modifypass_url%>'">뒤로</button>	
			<button type="submit" onclick="fn_submit(); return false;">확인</button>
		</div>
	</form>	
</div>
<footer>by yunamom</footer>
</body>
<script src="../script/script.js"></script>
</html>