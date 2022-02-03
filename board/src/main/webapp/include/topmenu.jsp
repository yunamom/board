<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<div class="header">
  <h2>Unfinished project</h2>
</div>

<div class="topnav">
  <a href="../main/index.jsp">∙ Main</a>
  <a href="../board/boardList.jsp">∙ Board</a>
  <a href="../board/reBoardList.jsp">∙ Q&A</a>
  <a href="#">∙ Chat</a>
  <a href="../board/game.jsp">∙ Game</a>
  <%
  String session_id = (String)session.getAttribute("SessionUserId");
  if(session_id == null){
  %>
  <a href="../member/loginWrite.jsp">∙ Login</a>	  
  <a href="../member/memberWrite.jsp">∙ Join</a>
  <%
  }else{
  %>
  <a href="../member/logout.jsp">∙ Logout </a> 
  <%
  }
  %>
</div>