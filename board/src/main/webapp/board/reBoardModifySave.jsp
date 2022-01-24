<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!--  데이터 받기 -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");

%>
<!--  데이터의 유효성 체크 -->
<%
if(unq == null || title == null || pass == null) {
%>
	<script>
	alert("잘못된 경로입니다.");
	location="boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- 암호 일치 검사 -->
<%
// unq : 7,,pass : 1234
// SELECT count(*) FROM board WHERE unq=7 and pass='1234'
// result : 1 (정상) , 0 (에러)
String sql = " SELECT count(*) cnt "; //alias 해준다.
      sql += " FROM reboard ";
      sql += " WHERE unq='"+unq+"' and pass='"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt==0){
%>
	<script>
	alert("암호를 확인해주세요.");
	history.back();
	</script>
<%
}
%>
<!--  UPDATE SQL 작성 및 적용 -->
<%
// title,name,content
String sql2 = " UPDATE reboard SET ";
       sql2+= " title='"+title+"', ";
       sql2+= " name='"+name+"', ";
       sql2+= " content='"+content+"', ";
       sql2+= " rdate=now() "; //현재시간
       sql2+= " WHERE ";
       sql2+= " unq='"+unq+"' ";
       
int result = stmt.executeUpdate(sql2);
%>
<!--  메세지 출력 -->
<%
if(result==1){
%>
	<script>
	alert("변경완료");
	location="reBoardList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("변경실패\n관리자에게 연락해주세요.");
	location="reBoardList.jsp";
	</script>
<% 
}
%>
