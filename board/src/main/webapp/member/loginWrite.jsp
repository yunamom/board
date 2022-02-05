<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ Login ∙</title>
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
<%
if(session_id != null){
	//로그인한 회원이 있을경우 접근할수없게 메인화면으로 이동합니다.
%>
	<script>
	location="../main/index.jsp";	
	</script>
<%	return;
}	
%>
<div class="row">
	
	<form name="frm" method="post" action="loginWriteSub.jsp">
	
	<table class="table" style="width:400px; margin-top:100px;">
		<tr>	
			<td style="text-align:left">
			<input style="width:100%" type="text" name="userid" placeholder="Username">
 			</td>
		</tr>
		<tr>
			<td style="text-align:left">
			<input style="width:100%" type="password" name="pass" placeholder="Password">
 			</td>
		</tr>
	
	</table>
	<div class="R" style="width:400px; padding-top:10px; padding-bottom:10px;">
		<a href="memberWrite.jsp">Create account</a>
	</div>	
		<button class="login" type="submit" onclick="fn_submit();return false;">Sign in</button>
		<!--Enter 에 반응이있는게 submit -->
	
	</form>
</div>
<div class="footer">
  <p>by yunamom</p>
</div>
</body>
</html>