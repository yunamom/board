<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/certificate.jsp" %>
<%@ include file="../include/dbCon.jsp" %>
<%
String strReferer = request.getHeader("referer");
if(strReferer == null){ 
//비정상적인 URL 접근차단을 위해 request.getHeader("referer") 메소드를 사용하였습니다.
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location="../main/index.jsp";
	</script>
<%
	return;
}

if(USERID == null || USERID.equals("")){
%>
	<script>
	alert("로그인해주세요.");
	location="../member/loginWrite.jsp";
	</script>
<%
	return;
}

String sql = " SELECT ";
       sql+= " pass, ";
       sql+= " name, ";
       sql+= " mobile, ";
       sql+= " zipcode, ";
       sql+= " addr ";
       sql+= " FROM memberInfo ";
       sql+= " WHERE userid = '"+USERID+"' ";

ResultSet rs = stmt.executeQuery(sql);

rs.next();
String pass = rs.getString("pass");
String name = rs.getString("name");
String mobile = rs.getString("mobile");
String zipcode = rs.getString("zipcode");
String addr = rs.getString("addr");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ Modify ∙</title>
<link rel="stylesheet" href="../css/layout.css">
<style>
td{text-align:left;}
</style>
</head>
<body> <!-- 비밀번호 입력창에 커서가 깜빡거릴수있도록 한다. -->
<%@ include file="../include/topmenu.jsp" %> 

<div class="row">
	<h2> Modify Account </h2>
	<form name="frm" method="post" action="memberModifySave.jsp">
		<table class="table" style="max-width:450px">
		<colgroup>
		<col width="25%">
		<col width="*">
		</colgroup>
		<tr>
			<td><%=USERID %></td>
		</tr>
		<tr>
			<td><input type="password" name="pass" placeholder="비밀번호" value="<%=pass %>" required></td>
		</tr>
		<tr>
			<td><input type="password" name="pass2" placeholder="비밀번호 확인" required></td>
		</tr>
		<tr>
			<td><input type="text" name="name" placeholder="이름" value="<%=name%>" required></td>
		</tr>
		<tr>
			<td>
			<input type="text" name="mobile" placeholder="010 0000 0000" value="<%=mobile%>">
			</td>
		</tr>
		<tr>
			<!-- 우편번호,주소 -->
			<td>
			<input type="text" name="zipcode" style="width:60%;" value="<%=zipcode%>" required>
			<input style="cursor:pointer; width:20%;" type="button" onclick="fn_post()" value="우편번호">
			<input style="margin-top:10px" type="text" size="30" name="addr" value="<%=addr%>" required>	
			</td>
		</tr>		
		</table>
		<div class="view">
			<button type="submit" onclick="fn_memberModify(); return false;">저장</button>
			<button type="reset">취소</button>
		</div>			
	</form>	
</div>
</body>
<script src="../script/script.js"></script>