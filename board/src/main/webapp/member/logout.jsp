<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("SessionUserId");
%>
<script>
alert("로그아웃 되었습니다.");
location.replace("../main/index.jsp");
</script>