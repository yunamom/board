<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<script type="text/javascript">
	function fn_submit(){
		
		var f = document.frm;
		if( f.userid.value == ""){
			alert("아이디를 입력해주세요.");
			f.userid.focus(); return false;
		}
		if( f.pass.value == ""){
			alert("암호를 입력해주세요.");
			f.pass.focus(); return false;
		}
		f.submit();
	}
	function fn_onload(){
		document.frm.userid.focus();
	}

</script>
<body onload="fn_onload()"> <!--아이디 입력창에 커서가 깜빡일수있게 한다.-->
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
	<h2> Login </h2>
	<form name="frm" method="post" action="#">
	
	<table class="table" style="width:400px">
		<tr>
			<th>아이디</th>
			<td style="text-align:left">
			<input type="text" name="userid">
 			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td style="text-align:left">
			<input type="password" name="pass">
 			</td>
		</tr>
	
	</table>
	<div class="view">
		<button type="submit" onclick="fn_submit();return false;">로그인</button>
		<!--Enter 에 반응이있는게 submit -->
		<button type="button" onclick="location='memberWrite.jsp'">회원가입</button>
	</div>
	</form>
</div>
<div class="footer">
  <p>by yunamom</p>
</div>
</body>
</html>