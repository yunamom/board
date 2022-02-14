<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String strReferer = request.getHeader("referer");
if(strReferer == null){ 
//비정상적인 URL 접근차단을 위해 request.getHeader("referer") 메소드를 사용하였습니다.
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location="../main/index.jsp";
	</script>
<%
	return;
}

Calendar cal = Calendar.getInstance();

request.setCharacterEncoding("UTF-8");
int year = Integer.parseInt(request.getParameter("y"));
int month = Integer.parseInt(request.getParameter("m"));
int date = Integer.parseInt(request.getParameter("d"));


cal.set(year,month-1,date); //월 은 0부터 시작하기때문에 -1 을 해주자!
int days = cal.get(Calendar.DAY_OF_WEEK);//요일 구하기 일:1 월:2 화:3 수:4 목:5 금:6 토:7
String daysOfweek = days+"";

switch(days){
	case 1 : daysOfweek = "일"; break;
	case 2 : daysOfweek = "월"; break;
	case 3 : daysOfweek = "화"; break;
	case 4 : daysOfweek = "수"; break;
	case 5 : daysOfweek = "목"; break;
	case 6 : daysOfweek = "금"; break;
	case 7 : daysOfweek = "토"; break;
}				

String pdate = year+"년 "+month+"월 "+date+"일 "+daysOfweek+"요일";


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ planWrite ∙</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/layout.css">
<style>
input,textarea{
	width:100%;
}
textarea{
	height:300px;
}
</style>
</head>
<body onload='document.frm.title.focus()'>
<div class="header" style="background-color:white">
  <h2><%=pdate%>✱</h2>
</div>
<div align="center">
	<form name="frm" method="post" action="planWriteSave.jsp">
	<input type="hidden" name="unq" value="">
	<table class="table">		
		<tr>
			<td><input type="text"name="title" placeholder="제목"></td>
		</tr>
		<tr>
			<td><textarea name="content" placeholder="내용"></textarea></td>
		</tr>
	</table>
		<div class="view">
			<input type="hidden"name="pdate" value="<%=pdate %>">	
			<button type="submit" onclick="location=''">저장</button>	
			<button type="button" onclick="self.close()">취소</button>
		</div>
	</form>
</div>
</body>
</html>