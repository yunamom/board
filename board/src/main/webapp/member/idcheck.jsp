<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbCon.jsp" %>

<%
String userid = request.getParameter("userid"); //중복체크를 위한 id값
String check = request.getParameter("check"); //중복확인후 다시 클릭했을때

String replaced_id = userid.replace(" ","");


if(userid == null || userid.trim().equals("")){
%>
	<script>
	document.write ="아이디를 입력해주세요!";
	self.close();	
	</script>
<%
	return;
}
if(replaced_id.length() != userid.length()){
%>
	<script>
	document.write="공백은 포함할수없습니다.";
	self.close();
	</script>
<%
	return;
}
if(userid.length() < 4 || userid.length() > 12){
%>
	<script>
	alert("아이디를 4자 ~ 12자 사이로 입력해주세요.");
	self.close();
	</script>
<%
	return;
}
String sql = " SELECT count(*) cnt FROM memberInfo ";
       sql+= " WHERE userid='"+userid+"' ";
       
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt"); //중복아이디가있으면 1 없으면 0
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkId</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<div class="row">
<div style="padding-top:25%">
<%
if(cnt==0){
	out.print(userid+" 사용 가능한 아이디입니다:)");
%>
	<script> //*중요 ! 부모창으로 아이디중복을 확인할수있는 check 값을 전달한다.
			
		opener.document.frm.check.value = "1";
		opener.document.frm.userid.readOnly=true;
		opener.document.frm.button.value = "modify ID";
		
	</script>

<%}else{//아이디 중복확인후 다시 클릭한경우

	out.print("이미 사용중인 아이디입니다.");
}
%>
</div>
<button type="button" onclick="self.close()">닫기</button>
<!-- self.close() 창닫기  -->
</div>
</body>
</html>