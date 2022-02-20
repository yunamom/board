<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>
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

String unq = request.getParameter("unq");
String title = request.getParameter("title");
String content = request.getParameter("content");

String sql = " UPDATE plan ";
       sql+= " SET title = '"+title+"', ";
       sql+= " content = '"+content+"' ";
       sql+= " WHERE unq = '"+unq+"' ";

int result = stmt.executeUpdate(sql);
if(result > 0){
	%>
	<script>
	alert("수정완료.");
	self.close();
	</script>
	<%
}else{
	%>
	<script>
	alert("수정실패.");
	self.close();
	</script>
	<%
}
	%>