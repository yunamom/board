<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Cookies" %>
<%
String cookie_id = "";
String cookie_pw = "";
String check_id = "";
String check_pw = "";

Cookies cookies = new Cookies(request); //쿠키 객체화 
if(cookies.exists("CookieUserId") && !cookies.getValue("CookieUserId").equals("")){
//쿠키 변수의 존재유무를 확인합니다.
	cookie_id = cookies.getValue("CookieUserId");
	check_id = "checked";
}else{
	cookie_id = "";	
	check_id = "";
}
if(cookies.exists("CookieUserPw") && !cookies.getValue("CookieUserPw").equals("")){
	//쿠키 변수의 존재유무를 확인합니다.
		cookie_pw = cookies.getValue("CookieUserPw");
		check_pw = "checked";
	}else{
		cookie_pw = "";
		check_pw = "";
	}
%>

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
			<input style="width:100%" type="text" name="userid" placeholder="Username" value="<%=cookie_id%>">
 			</td>
		</tr>
		<tr>
			<td style="text-align:left;">
			<input style="width:100%" type="password" name="pass" placeholder="Password" value="<%=cookie_pw%>">
 			</td>
		</tr>	
	</table>
	<div style="padding:10px;"> <!-- 사이 간격을 위해 div 로 묶어준다. -->
	<div class="L" style="width:400px; font-size:13px;" >
		<input type="checkbox" name="idcheck" value="1" <%=check_id %>>ID
		<input type="checkbox" name="pwcheck" value="1" <%=check_pw %>>PW remember
		<!-- 쿠키 박스 -->
	</div>
	<div class="R" style="width:400px; margin-top:20px;  ">
		<a href="memberWrite.jsp">Create account</a>
	</div>
	</div>
		<input class="login" type="submit" onclick="fn_submit();return false;" value="Sign in">
		<!--Enter 에 반응이있는게 submit -->
	
	</form>
</div>
<footer>by yunamom</footer>
</body>
</html>