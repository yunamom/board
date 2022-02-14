<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.modify a:hover{
	font-size:0;
}
.modify a:hover:before {
	content:'∙ Modify';
	font-size:15px;
}
</style>
<div class="header">
  <h2>Have a lovely day ✱</h2>
</div>

<div class="topnav">
  <a href="../main/index.jsp">∙ Main</a>
  <a href="../board/boardList.jsp">∙ Board</a>
  <a href="../board/reBoardList.jsp">∙ Q&A</a>
 
  <a href="../board/game.jsp">∙ Game</a>
  <%
  String session_id = (String)session.getAttribute("SessionUserId");
  String userlocation = "../member/loginWrite.jsp"; //로그인회원만 글작성할수있게 로그인화면 경로를 작성합니다.
 
  if(session_id == null){
  %>
  <a href="../member/loginWrite.jsp">∙ Login</a>
  <a href="../plan/planList.jsp">∙ Calendar</a>
  <%
  }else{ //로그인 했을 경우의 상황
  %>
  <div class="modify">
  <a href="../member/memberModify.jsp">∙ <%=session_id%></a>
  </div>
  <a href="../plan/planList.jsp">∙ Calendar</a>
  <a href="../member/logout.jsp">∙ Logout </a> 
  <%
  }
  %>
</div>