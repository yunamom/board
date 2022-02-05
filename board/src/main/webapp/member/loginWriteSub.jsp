<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");

if(userid == null || pass == null){
%>
	<script>
	alert("잘못된 경로의 접근입니다!");
	location="../main/index.jsp";
	</script>
<%
	return;
}

String sql = " SELECT count(*)cnt FROM memberInfo ";
       sql+= " WHERE userid = '"+userid+"' and pass = '"+pass+"' ";
       
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");

if(cnt==0){
%>
	<script>
	alert("아이디 & 비밀번호가 \n 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}else{
	//로그인 세션 SessionUserId = "userid";
	session.setAttribute("SessionUserId",userid);
	session.setMaxInactiveInterval(600); // 세션의 지속시간 *초단위
}
%>
	<script>
	alert("<%=userid%> 님 환영합니다.");
	location="../main/index.jsp";
	</script>