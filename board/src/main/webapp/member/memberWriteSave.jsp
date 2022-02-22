<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB -->
<%@ include file="../include/dbCon.jsp" %>
<!-- 데이터 받기 -->
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String mobile = request.getParameter("mobile");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
%>
<!-- 유효성 체크 -->
<%
if(userid == null || pass == null || name == null || gender == null){
%>
	<script>
	alert("잘못된 경로의 접근!!");
	location="../main/index.jsp";	
	</script>
<%
	return;
}
mobile = mobile.replace(" ","");
%>
<!-- 중복아이디 체크 -->
<%
String sql = " SELECT ";
       sql+= " COUNT(*) cnt FROM memberInfo WHERE userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 1){
%>
	<script>
	alert("이미 사용중인 아이디입니다.");
	history.back();	
	</script>
<%
	return;
}else if(cnt > 1){//비정상적인 상황
%>
	<script>
	alert("오류 \n 관리자에게 연락바랍니다.");
	history.back();
	</script>
<%
	return;
}
%>
<!-- 저장SQL 작성 및 실행 -->
<%
String sql2 = " INSERT INTO memberInfo (";
       sql2+= " userid,pass,name,gender,birthday,mobile,zipcode,addr,rdate) ";
       sql2+= " VALUES(";
       sql2+= " '"+userid+"',";
       sql2+= " '"+pass+"',";
       sql2+= " '"+name+"',";
       sql2+= " '"+gender+"',";
       sql2+= " '"+birthday+"',";
       sql2+= " '"+mobile+"',";
       sql2+= " '"+zipcode+"',";
       sql2+= " '"+addr+"',";
       sql2+= " now()) ";//현재시간

int result = stmt.executeUpdate(sql2);
%>
<!-- 메시지 출력 후 메인으로 이동 -->
<%

if(result == 1){
%>
	<script>
	alert("<%=name%>님 회원등록을 완료하였습니다.");
	location="../main/index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("시스템 장애입니다. 회원등록 실패");
	history.back();
	</script>	
<%
}
%>