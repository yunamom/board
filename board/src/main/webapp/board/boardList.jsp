<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../include/dbCon.jsp" %>

<%
int p = 10; //한페이지에 보여질 게시물 갯수
String view = request.getParameter("view");

if(view == null){
	view = "1"; //현재 페이지
}

int vpage = Integer.parseInt(view);

int index = (vpage-1)*p;

String cnt = " SELECT count(*) total FROM board";
ResultSet rsCnt = stmt.executeQuery(cnt);
rsCnt.next(); //게시물 총갯수
int total = rsCnt.getInt("total");


//전체 페이지 갯수를 구한다.

/*페이징 처리를 위한 추가
 
 ex)
 게시물 갯수가 10개씩 이라고 할경우
 19/10 -> 1.9 -> ceil(1.9) -> 2.0 
 29/10 -> 2.9 -> ceil(2.9) -> 3.0
 
 소숫점을 얻기위해 total 이라는 변수를 나누기 처리를 할때 double 을 넣어준다.
 * 실수(double)는 for 문에 적용할수없다.
 고로 lastpage 받는 변수에 맞춰서 (int)를 추가해준다.
*/
int lastpage = (int)Math.ceil((double)total/p);
		 
/*
삼항연산자를 적용한 예 
int lastpage = total%p==0?total/p:(total/p)+1;
*/
int rowNo = total - index; //행번호 * 아주 중요합니다 *
//제목 옆에 나올 게시물 번호
		 
String sql = " SELECT unq,";
		sql+=" title,";
		sql+=" name,";
		sql+=" date_format(rdate,'%Y-%m-%d') rdate,"; 
		// left(rdate,10), substring(1,10)
		sql+=" hits ";
		sql+=" FROM board ";
		sql+=" ORDER BY unq DESC LIMIT "+index+","+p+" ";
	   
ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>∙ Board List ∙</title>
	<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<div class="row">	
    <h2>∙ Board List ∙</h2>
    <div class="L">
    ∙ 게시물 총갯수 <%=total%> 개</div>
     <div class="R">   
   	<%
   	if(session_id != null){
   		userlocation="boardWrite.jsp";		
   	}
   	%>
   	<button class="button" type="button" onclick="location='<%=userlocation%>'">
   	글쓰기</button></div>
   	
	<table class="table">		
	<colgroup>
		<col width="8%"/>
		<col width="50%"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>	
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%while(rs.next()){	
			int unq = rs.getInt("unq");
			String title = rs.getString("title");
			String name = rs.getString("name");
			String rdate = rs.getString("rdate");
			String hits = rs.getString("hits");	
			
			title = title.replaceAll("<[^>]*>","");
		%>
		<tr>
			<td style="color:#848484"><%=rowNo%></td> 
			<!-- unq 를 넣을수없는 이유는 번호가 삭제된 게시물을 건너띄고 나오기 때문이다.-->
			<td align="left">
			<a href="boardDetail.jsp?unq=<%=unq%>"><%=title %></a></td>
			<td><%=name %></td>
			<td><%=rdate %></td>
			<td><%=hits %></td>
		</tr>
		<%	rowNo--;}%>		
	</table>
	<div class="view">
	<%
	for(int i=1; i<=lastpage; i++){
	//페이지 화면 2가지 방법으로 작성할수 있다. 
	//	out.print("<a href='boardList.jsp?view="+i+"'>"+i+"</a>   ");
	%>		
	<a href="boardList.jsp?view=<%=i%>"><%=i%></a>
	<% 
	}	
	%>
	</div>
</div>
<footer>by yunamom</footer>
</body>
</html>