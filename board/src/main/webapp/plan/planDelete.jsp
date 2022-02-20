<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
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

String pdate = request.getParameter("pdate");

String sql = "DELETE FROM plan WHERE userid='"+USERID+"' AND pdate='"+pdate+"' ";

int result = stmt.executeUpdate(sql);
if(result == 1){
	%>
	<script>
	alert("삭제완료!");
	self.close();	
	</script>
	
	<%
}else{
	%>
	<script>
	alert("삭제실패!");
	self.close();
	</script>
	<%
}
%>