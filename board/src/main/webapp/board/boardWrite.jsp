<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성</title>
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
	<table class="table" width="700px">		
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="box_title" required></td>
		</tr>			
		<tr>
			<th>암호</th>
			<td class="box_name"><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td class="box_name"><input type="text" name="name" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea name="content" placeholder="내용을 입력하세요."></textarea>
			<!-- rows 세로 cols 가로 -->
			</td>
		</tr>
	</table>
		<div>
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<!-- 오류가났을때 submit 멈추기위해 자바스크립트를 작성해준다. -->
			<button type="reset">취소</button>
		</div>
	</form>	
</div>
<div class="footer">
<p>by yunamom</p>
</div>
</body>
</html>