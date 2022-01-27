<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Account</title>

<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="../script/jquery-1.12.4.js"></script>
  <script src="../script/jquery-ui.js"></script>
  <script>
  $( function() {//#은 id 값을 의미한다.
    $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>
  
</head>

<script>
function fn_submit(){
	
	if(document.frm.id.value == ""){
		alert("아이디를 입력해주세요.");
		document.frm.id.focus();
		return false;
	}
	if(document.frm.pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	if(document.frm.name.value == ""){
		alert("이름을 입력해주세요.");
		document.frm.name.focus();
		return false;
	}
	
	document.frm.submit();
}
function fn_onload(){
	document.frm.id.focus();
	document.frm.onload();
}
</script>

<body onload="fn_onload()"> <!-- 아이디 입력창에 커서가 깜빡거릴수있도록 한다. -->
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
	<h2> Join Account </h2>
	<form name="frm" method="post" action="#">
		<table class="table" style="max-width:500px">
		<colgroup>
		<col width="25%">
		<col width="*">
		</colgroup>
		<tr>
			<th>아이디</th>
			<td style="text-align:left">
			<input type="text" name="id" required>
			<button type="button">중복 체크</button>
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td style="text-align:left"><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td style="text-align:left"><input type="text" name="name" required></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="gender" value="M">남성
			<input type="radio" name="gender" value="F">여성
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td style="text-align:left">
			<input type="text" name="birthday" id="birthday" required>
			</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td style="text-align:left">
			<input type="text" name="mobile">
			</td>
		</tr>
		<tr>
			<th>주소</th> <!-- 우편번호,주소 -->
			<td style="text-align:left">
			<input type="text" name="zipcode">
			<button type="button">우편번호찾기</button>
			<input type="text" size="40" name="addr">
			
			</td>
		</tr>
		
		</table>
		<div class="view">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<button type="reset">취소</button>
		</div>			
	</form>	
</div>
</body>
</html>