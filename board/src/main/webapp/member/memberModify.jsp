<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<style>
td{
	text-align:left;
}
</style>
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
<body onload='document.frm.pass.focus()'> <!-- 비밀번호 입력창에 커서가 깜빡거릴수있도록 한다. -->
<%@ include file="../include/topmenu.jsp" %> 
<% //topmenu 안에 session_id 를 체크합니다.
if(session_id == null || session_id == ""){
%>
	<script>
	alert("비정상적인 접근입니다.");
	location="../main/index.jsp";
	</script>
<%
	return;
}
String sql = " SELECT ";
       sql+= " userid, ";
       sql+= " name, ";
       sql+= " gender, ";
       sql+= " birthday, ";
       sql+= " mobile ";
       sql+= " FROM memberInfo ";
       sql+= " WHERE userid = '"+session_id+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
String name = rs.getString("name");
String gender = rs.getString("gender");
%>

<div class="row">
	<h2>  Account </h2>
	<form name="frm" method="post" action="memberWriteSave.jsp">
		<table class="table" style="max-width:500px">
		<colgroup>
		<col width="25%">
		<col width="*">
		</colgroup>
		<tr>
			<th>아이디</th>
			<td><%=session_id %></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td><input type="password" name="pass2" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=name%>" required></td>
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
			<td>
			<input type="text" name="birthday" id="birthday" required>
			</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td>
			<input type="text" name="mobile">
			</td>
		</tr>
		<tr>
			<th>주소</th> <!-- 우편번호,주소 -->
			<td>
			<input type="text" name="zipcode">
			<button type="button">우편번호찾기</button>
			<input style="margin-top:10px" type="text" size="30" name="addr">
			
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