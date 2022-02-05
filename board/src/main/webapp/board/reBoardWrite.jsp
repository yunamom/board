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

<div class="row">
    <h2>Q & A Board</h2>
	<form name="frm" method="post" action="reBoardWriteSave.jsp">
	<table class="table">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>제목</th>
			<td style="text-align:left"><input size="30" type="text" name="title" required></td>
		</tr>			
		<tr>
			<th>내용</th>
			<td style="text-align:left">
			<textarea name="content" rows="10" cols="30" placeholder="내용을 입력하세요."></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td style="text-align:left">
			<input type="text" name="name" value="<%=session_id %>" readonly>
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td style="text-align:left"><input type="password" name="pass" required></td>
		</tr>
	</table>
		<div class="view">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset" onclick="location='reBoardList.jsp'">취소</button>
		</div>
	</form>	
</div>
</body>
<script src="../script/script.js"></script>
</html>