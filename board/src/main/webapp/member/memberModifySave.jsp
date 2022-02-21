<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/certificate.jsp" %>
<%
String strReferer = request.getHeader("referer");
if(USERID == null || strReferer == null){ 
//비정상적인 URL 접근차단을 위해 request.getHeader("referer") 메소드를 사용하였습니다.
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location="../main/index.jsp";
	</script>
<%
	return;
}
if(USERID == null || USERID.equals("")){ //세션 아이디가 없는경우
%>
	<script>
	location="../main/index.jsp";
	</script>
<%
	return;
}

%>
<!-- DB -->
<%@ include file="../include/dbCon.jsp" %>
<!-- 데이터 받기 -->
<%

String pass = request.getParameter("pass");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
%>
<!-- 유효성 체크 -->
<%
if(pass == null || name == null){
%>
	<script>
	alert("잘못된 경로의 접근!!");
	location="../main/index.jsp";	
	</script>
<%
	return;
}

%>
<!-- 중복아이디 체크 -->
<%
String sql = " SELECT ";
       sql+= " COUNT(*) cnt FROM memberInfo WHERE userid='"+USERID+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt < 1){ //수정할 아이디가 일치하지 않은경우
%>
	<script>
	alert("아이디를 확인해주세요.");
	history.back();	
	</script>
<%
	return;
}else if(cnt > 1){//비정상적인 상황 일치하는 아이디가 여러개인경우 
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
String sql2 = " UPDATE memberInfo SET ";
       sql2+= " pass='"+pass+"',";
       sql2+= " name='"+name+"',";
       sql2+= " mobile='"+mobile+"',";
       sql2+= " zipcode='"+zipcode+"',";
       sql2+= " addr='"+addr+"' ";
       sql2+= " WHERE userid='"+USERID+"' ";

int result = stmt.executeUpdate(sql2);
%>
<!-- 메시지 출력 후 메인으로 이동 -->
<%

if(result == 1){
%>
	<script>
	alert("<%=name%>님 회원수정을 완료하였습니다.");
	location="../main/index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("시스템 장애입니다. 회원수정 실패");
	history.back();
	</script>	
<%
}
%>