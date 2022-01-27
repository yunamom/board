<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
	
	f.title.focus();
	f.onload();
	
}
</script>
<body onload="fn_onload()" >
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
    <h2>Main Content</h2>
	<form name="frm" method="post" action="boardWriteSave.jsp">
	<table class="table">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>제목</th>
			<td style="text-align:left"><input size="40" type="text" name="title" required></td>
		</tr>			
		<tr>
			<th>암호</th>
			<td style="text-align:left"><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td style="text-align:left"><input type="text" name="name" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align:left">
			<textarea name="content" rows="10" cols="40" placeholder="내용을 입력하세요."></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
	</table>
		<div class="view">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset" onclick="location='boardList.jsp'">취소</button>
		</div>
	</form>	
</div>
</body>
</html>