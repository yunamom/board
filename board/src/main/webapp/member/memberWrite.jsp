<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ Join Account ∙</title>

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
<style>
textarea,input{
	font-size:17px;
	color:#555555;
	padding: 5px;
	width: 80%;
}

</style>

<body onload='document.frm.userid.focus()'> <!-- 아이디 입력창에 커서가 깜빡거릴수있도록 한다. -->
<%@ include file="../include/topmenu.jsp" %>
<%
if(session_id != null){
%>
	<script>
	location="../main/index.jsp";	
	</script>
<%	return;
}	
%>
<div class="row">
	<h2> Join Account </h2>
	<form name="frm" method="post" action="memberWriteSave.jsp">
		<table class="table" style="max-width:450px">
		<colgroup>
		<col width="25%">
		<col width="*">
		</colgroup>
		<tr>
			<td>	
			<input type="text" name="userid" placeholder="아이디" required>
			<input style="cursor:pointer; width:20%;" type="button" onclick="fn_idcheck()" name="button" value="check ID">
			<input type="hidden" name="check" value="0"><!-- 중요합니다! 중복체크확인할수있는 변수를 생성 -->		
			</td>
		</tr>
		<tr>
			<td><input type="password" name="pass" placeholder="비밀번호" required></td>
		</tr>
		<tr>
			<td><input type="password" name="pass2" placeholder="비밀번호 확인" required></td>
		</tr>
		<tr>
			<td><input type="text" name="name" placeholder="이름" required></td>
		</tr>
		<tr>
			<td>
			남성<input style="width:20%" type="radio" name="gender" value="M">
			여성<input style="width:20%" type="radio" name="gender" value="F">
			</td>
		</tr>
		<tr>
			<td>
			<input type="text" name="birthday" id="birthday" required>
			</td>
		</tr>
		<tr>
			<td>
			<input type="text" name="mobile" placeholder="010 0000 0000">
			</td>
		</tr>
		<tr>
			<!-- 우편번호,주소 -->
			<td>
			<input type="text" name="zipcode">
			<input style="cursor:pointer; width:20%;" type="button" onclick="fn_post()" value="우편번호">
			<input style="margin-top:10px" type="text" size="30" name="addr">
			
			</td>
		</tr>		
		</table>	
		<div class="view">
			<button type="submit" onclick="fn_memberSubmit();return false;">저장</button>
			<button type="reset">취소</button>
		</div>			
	</form>	
</div>
</body>
<script src="../script/script.js"></script>
</html>