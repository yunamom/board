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
if(content.length() > 5000){//게시물 글자수 제한
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
//답변 게시판은 gid 와 thread 를 추가해준다. alias 앞에 as 는 생략가능 
String sql = "SELECT ifnull(max(gid),0)+1 as mygid FROM reboard";
//max(gid)+1 값이 NULL 일경우 gid 값에 0을 넣어주기 위해 if null 을 작성한다.
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int mygid = rs.getInt("mygid");

//rdate 는 mysql 함수중에 now() 를 사용합니다.
String sql2 = "INSERT INTO reboard(";
       sql2+= "title,pass,name,content,rdate,gid,thread)";
	   sql2+= "VALUES('"+title+"'";
	   sql2+= ",'"+pass+"'";
	   sql2+= ",'"+name+"'";
	   sql2+= ",'"+content+"'";
	   sql2+= ", now()";
	   sql2+= ",'"+mygid+"'";
	   sql2+= ",'a')";	   

int result = stmt.executeUpdate(sql2); 



if( result == 1){
%>
	<script>
	alert("저장완료\n목록으로 이동합니다.");
	location="reBoardList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패\n관리자에게 연락해주세요.");
	history.back();
	</script>
<%}%>
<!-- 결과메세지 -->
