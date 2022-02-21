<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/layout.css">
<link rel="preconnect" href="https://fonts.gstatic.com">


<script src="../script/script.js"></script>
<!-- defer 을 통해 코드를 받을때까지 화면에 표시되지 않는 것을 방지 -->
<script>
window.onload=function(){
	
	const toggleBtn = document.querySelector('.navbar__toogleBtn');
	const menu = document.querySelector('.navbar__menu');
	const icons = document.querySelector('.navbar__icons');
	
	toggleBtn.addEventListener('click',()=>{
		menu.classList.toggle('active'); //클릭시 active 
		icons.classList.toggle('active');
	})
}

</script>
</head>

<body>
<div class="header">
<a style="color:#bb899a;"href="../main/index.jsp">
<h1>Have a lovely day ✱</h1></a></div>

<nav class="navbar">
<div class="navbar_logo">
	<a href="#"><img src="../img/img.png"></a>
</div>
<!-- 일렬정렬을 위해 ul 태그 활용 -->
<ul class="navbar__menu">
  <li><a href="../board/boardList.jsp">∙Board</a></li>
  <li><a href="../board/reBoardList.jsp">∙Q&A</a></li>
 
  <li><a href="../board/game.jsp">∙Game</a></li>
  <%
  String session_id = (String)session.getAttribute("SessionUserId");
  String userlocation = "../member/loginWrite.jsp"; //로그인회원만 글작성할수있게 로그인화면 경로를 작성합니다.
 
  if(session_id == null){
  %>
  <li><a href="../member/loginWrite.jsp">∙Login</a></li>
  <li><a href="../plan/planList.jsp">∙Calendar</a></li>
  <%
  }else{ //로그인 했을 경우의 상황
  %>
  <li><a href="../member/memberModify.jsp">∙ <%=session_id%></a></li> 
  <li><a href="../plan/planList.jsp">∙Calendar</a></li>
  <li><a href="../member/logout.jsp">∙Logout </a></li>
  <%
  }
  %>
  </ul>
  <ul class="navbar__icons">
  	<li><i class="fab fa-facebook"></i></li>
  	<li><i class="fab fa-google"></i></li>
  </ul>
  <!-- 햄버거 메뉴 -->
  <a href="#" class="navbar__toogleBtn" >
  <img src="../img/ham.png">
  </a>
</nav>
</body>
</html>