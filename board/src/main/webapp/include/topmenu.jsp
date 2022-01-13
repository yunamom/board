<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//log 기록을 가져와서 로그인한 회원은 회원가입,로그인 메뉴를 없애고 로그아웃을보여준다.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="nav">
		<a href="../main/main.jsp">홈</a>
		<a href="../board/boardList.jsp">게시판</a>
		<a href="../board/reBoardList.jsp">답변게시판</a>
		<a href="#">대화방</a>
		<a href="#">일정관리</a>
		<a href="../member/memberWrite.jsp">회원가입</a>
		<a href="../member/loginWrite.jsp">로그인</a>
	</div>
</body>
</html>