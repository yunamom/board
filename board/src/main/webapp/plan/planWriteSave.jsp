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
String pdate = request.getParameter("pdate");
String title = request.getParameter("title");
String content = request.getParameter("content");
String week = request.getParameter("week");

content = content.replace("\r\n","<br>");

if(pdate == null || title == null || content == null || week == null){
%>
	<script>
	alert("다시 확인해주세요.");
	history.back();
	</script>
<%
	return;
}

String sql = " INSERT INTO plan(userid,pdate,title,content,week) ";
       sql+= " VALUES('"+USERID+"',";
       sql+= " '"+pdate+"',";
       sql+= " '"+title+"',";
       sql+= " '"+content+"',";
       sql+= " '"+week+"')";
int result = stmt.executeUpdate(sql);

if(result == 1){
%>
	<script>
	self.close();
	opener.location = "planList.jsp";
	</script>
<%
}else{
%>
	<script>
	self.close();
	opener.location = "planList.jsp";
	</script>
<%
}
%>