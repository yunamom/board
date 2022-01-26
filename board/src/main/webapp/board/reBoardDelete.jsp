<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 데이터 받기 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>

<!-- 유효성 체크 -->
<%
if(unq == null || pass==null || unq.equals("") || unq.equals("")){
%>
	<script>
	alert("잘못된 경로의 접근입니다.");
	location="../main/index.jsp";
	</script>
<%
	return;
}
%>
<!-- 암호 일치 검사 -->
<%
String sql = " SELECT count(*) cnt FROM reboard ";
       sql+= " WHERE unq='"+unq+"' and pass='"+pass+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt"); // 비밀번호가 일치할시에는 cnt = 1; 그외에는 0
if(cnt == 0){
%>
	<script>
	alert("암호가 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 자식레벨(댓글)의 존재 유무 -->
<% 
String sql2 = " SELECT gid,thread FROM reboard ";
       sql2+= " WHERE unq='"+unq+"' ";

rs = stmt.executeQuery(sql2);
rs.next();
int gid = rs.getInt("gid");
String thread = rs.getString("thread");

String sql3 = " SELECT count(*) cnt2 FROM reboard ";
       sql3+= " WHERE gid='"+gid+"' and thread like '"+thread+"_' ";
//like 검색의 _ 언더바는 문자 1개를 의미, % 는 문자열 <% 이거는 포함된 문자를 다 불러온다>
rs = stmt.executeQuery(sql3);
rs.next();
int cnt2 = rs.getInt("cnt2");
%>
<!-- 답글이 존재하는 경우 설정(UPDATE SQL) -->
<%
int result = 0;
if(cnt2 > 0){
	String sql4 = " UPDATE reboard SET title='작성자에 의한 삭제',content='' ";
           sql4+= " WHERE unq='"+unq+"' ";
	result = stmt.executeUpdate(sql4);
}else{
	// 존재하지 않는 경우 설정(DELETE SQL)
	String sql5 = " DELETE FROM reboard WHERE unq='"+unq+"' ";
	result = stmt.executeUpdate(sql5);
}
%>
<!-- 결과 메세지 -->
<%
if(result == 1){
%>
	<script>
	alert("삭제완료");
	location="reBoardList.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("삭제실패");
	location="reboardList.jsp";
	</script>
<%
}
%>