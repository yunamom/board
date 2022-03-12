<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 게시글 작성</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<body onload="fn_onload()" > <!-- 화면이 열리면 커서가 제목에 갈수있게 적용한다. -->
<%@ include file="../include/topmenu.jsp" %>
<section>
<div class="row">
    <h2>Q & A Board</h2>
	<form name="frm" method="post" action="reBoardWriteSave.jsp">
	<input type="hidden" name="name" value="<%=session_id %>">
	<table class="table">
		<tr>
			<td><input size="30" type="text" name="title" placeholder="제목" required></td>
		</tr>			
		<tr>
			<td>
			<textarea name="content" rows="10" cols="30" placeholder="내용을 입력하세요."></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
		<tr>
			<td><input type="password" name="pass" placeholder="비밀번호" required></td>
		</tr>
	</table>
		<div class="view">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset" onclick="location='reBoardList.jsp'">취소</button>
		</div>
	</form>	
</div>
</section>
<footer>by yunamom</footer>
</body>
<script src="../script/script.js"></script>
</html>