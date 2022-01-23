<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	background-color: #9c6071;
}
.column.side {
 	overflow: hidden;
	float: left;
}
.column.side a {
	padding-top: 45px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	text-decoration: none;
	color: #fff;
	font-size: 25px;
}
.column.side a:hover {
   background: #ddddd;
   color: #454545;
}
.header a {
	text-decoration: none;
	color: #9c6071;
}
.header a:hover {
    color: #fff;
}
</style>
<div class="header">
  <h1><a href="../board/game.jsp">
  ∙ game ∙
  </a></h1>
</div>
<div class="column side">
	<a href="../board/boardList.jsp">∙ Board ∙</a>
	<a href="../board/reBoardList.jsp">∙ Q & A ∙</a>
	<a href="#">∙ Chat ∙</a>
	<a href="#">∙ Login ∙</a>
</div>