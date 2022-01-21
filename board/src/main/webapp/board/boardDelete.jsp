<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 데이터 받기 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>
<!-- 유효성 체크 -->
<%
if( unq == null || pass == null){
%>
	<script>
	alert("잘못된 경로의 접근입니다.");
	location="boardList.jsp";	
	</script>
<%
	return;
}
%>
<!-- 패스워드 일치 검사 -->
<%
// 게시물 번호와 게시물 비밀번호가 일치할시에 1 그외에는 0 이다.

String sql = " SELECT count(*) cnt FROM board ";
       sql+= " WHERE unq = '"+unq+"' and pass = '"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
if( rs.getInt("cnt")==0 ){
%>
	<script>
	alert("암호를 다시 확인해 주세요.");
	history.back();
	</script>
<%
	return;
}
%>
<!-- 삭제 SQL 작성 및 실행 -->
<%
String sql2 = " DELETE FROM board WHERE unq='"+unq+"' ";
int result = stmt.executeUpdate(sql2);
//제대로 삭제되었을경우 result 의 값은 1 그외에는 0 이다.
%>
<!-- 결과 메세지 -->
<%
if(result==1){ //성공적으로 삭제를 했을경우
%>
	<script>
	alert("삭제완료");
	location="boardList.jsp";
	</script>
<%
} else { //오류가 났을경우
%>
	<script>
	alert("삭제실패\n관리자에게 연락 부탁합니다.");
	location="boardList.jsp";
	</script>
<%
}
%>