<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB 연결 -->
<%@ include file="../include/dbCon.jsp" %>
<!-- 전송데이터 받기 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");

title = title.trim();
pass = pass.trim();
%>
<!-- 데이터 유효성 체크 -->
<%
if(title == null || pass == null ||
   title.equals("") || pass.equals("")){ //앞뒤 공백을 제거해서 데이터 유효성 체크
%>
	<script>
	alert("다시 확인해주세요.");
	history.back();
	</script>
<%
	return; //jsp 종료
}
if(name == null){
	name = ""; //null 이 화면에 출력되는것을 방지
}
if(content == null){
	content = "";
}
content = content.trim();
if(content.length() > 500){//게시물 글자수 제한
%>
	<script>
	alert("내용의 양이 너무 많습니다.");
	history.back();
	</script>
<%
	return; //jsp 종료
}
%>
<!-- SQL/적용 -->
<%
//rdate 는 mysql 함수중에 now() 를 사용합니다.
String sql = "INSERT INTO board(title,pass,name,content,rdate)";
	   sql+= "VALUES('"+title+"','"+pass+"','"+name+"','"+content+"', now() )";

int result = stmt.executeUpdate(sql); 



if( result == 1){
%>
	<script>
	alert("저장완료\n 목록으로 이동합니다.");
	location="boardList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패 관리자에게 연락해주세요.");
	history.back();
	</script>
<%}%>
<!-- 결과메세지 -->









