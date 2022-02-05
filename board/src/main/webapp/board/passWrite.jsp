<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%

String unq = request.getParameter("unq");
String gubun = request.getParameter("gubun");
// 답변형 게시판은 gubun=R 일반은 null

if(unq == null) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "../main/main.jsp";
	</script>
<%
	return;
}
String pass_url = ""; //뒤로가기 변수
String delete_url = ""; // 구분을 위해 변수를 생성해준다.
if(gubun == null){
	pass_url = "boardList.jsp";
	delete_url = "boardDelete.jsp";
}
else if(gubun.equals("R")) { 
	pass_url = "reBoardList.jsp";
	delete_url = "reBoardDelete.jsp";
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
	<form name="frm" method="post" action="<%=delete_url%>">
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
		<div class="view">
			<button type="reset" onclick="location='<%=pass_url%>'">뒤로</button>	
			<button type="submit" onclick="fn_submit();return false;">삭제</button>
		</div>
	</form>	
</div>
</body>
<script src="../script/script.js"></script>
</html>