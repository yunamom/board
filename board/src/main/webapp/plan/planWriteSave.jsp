<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>
<%
String userid = (String)session.getAttribute("SessionUserId");
if(userid == null || userid.equals("")){
%>
	<script>
	alert("로그인 이후에 이용가능합니다.");
	location="../member/loginWrite.jsp";
	
	</script>
<%
	return;
}
%>

<%
String pdate = request.getParameter("pdate");
String title = request.getParameter("title");
String content = request.getParameter("content");

String sql = " INSERT INTO plan(userid,pdate,title,content) ";
       sql+= " VALUES('"+userid+"','"+pdate+"','"+title+"','"+content+"')";
int result = stmt.executeUpdate(sql);

if(result == 1){
%>
	<script>
	alert("일정 저장완료!");
	self.close();
	opener.location = "planList.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("저장실패!");
	self.close();
	opener.location = "planList.jsp";
	</script>
<%
}
%>