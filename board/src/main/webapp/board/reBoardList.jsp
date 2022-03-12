<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../include/dbCon.jsp" %>

<%
String view = request.getParameter("view"); 


/* 한 페이지의 게시물 수 */
int pageSize = 5;

/* 한 블럭( range : 범위 ) 의 페이지 수 */
int rangeSize = 5; 

/* 현재 페이지 */
int viewPage = (view == null)?1:Integer.parseInt(view);

/* 시작 index */
int index = (viewPage-1)*pageSize;


String cnt = " SELECT count(*) total FROM reboard";
ResultSet rsCnt = stmt.executeQuery(cnt);
rsCnt.next(); 

/* 총 게시글 수 */
int total = rsCnt.getInt("total");


/* 마지막 페이지 */
int endPage = (int)Math.ceil((double)total/pageSize);


/* 게시물 행번호 */
int rowNo = total - index;


/* ( range : 범위 ) */
int Range = (viewPage % rangeSize == 0)?viewPage/rangeSize:(viewPage/rangeSize)+1;


/* 이전버튼 블럭( range : 범위 ) */
int startRange = (Range-1)*rangeSize+1;


/* 다음버튼 블럭( range : 범위 ) */
int endRange = startRange + rangeSize-1;


/* 마지막 블락에서 총페이지수를 넘어가면 끝 페이지를 마지막 페이지 숫자로 넣어줍니다. */
endRange = (endRange >= endPage) ? endPage : endRange;


String sql = " SELECT unq,";
		sql+=" title,";
		sql+=" name,";
		sql+=" date_format(rdate,'%Y-%m-%d') rdate,"; 
		// left(rdate,10), substring(1,10)
		sql+=" hits, ";
		sql+=" gid, ";
		sql+=" thread ";
		sql+=" FROM reboard ";
		sql+=" ORDER BY gid DESC,thread ASC"; //답글이 글 사이에 들어갈수있도록 작성해준다.
		sql+=" LIMIT "+index+","+pageSize+" "; //limit 시작번호,출력갯수 예(0,10)
	   
ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ Q & A list ∙</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>

<%@ include file="../include/topmenu.jsp" %>
<div class="row">	
    <h2>∙ Q & A Content ∙</h2>
    <div class="L">
    ∙ 게시물 총갯수 <%=total%> 개</div>
    <div class="R">
    <% if(session_id != null){
    	userlocation = "reBoardWrite.jsp";
    }%>
   	<button class="button" type="button" onclick="location='<%=userlocation%>' ">
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
			String thread = rs.getString("thread");
			
			title = title.replaceAll("<[^>]*>","");
			
			// a(원글) , (aa,ab,ac,ad ~)(답글), (aaa,aab,aac ~)(답글의 답글)
			int len = thread.length();
			String re = "";
			String space = "";
			if(len > 1){
				while(len>0){
					space+="&nbsp;&nbsp;"; len--;
				}
				re=space+"<img src='../img/reply_icon.png'>";		
			}
		%>
		<tr>
			<td style="color:#848484"><%=rowNo%></td> 
			<td align="left">			
			<%=re%>
			<a href="reBoardDetail.jsp?unq=<%=unq%>"><%=title %></a></td>
			<td><%=name %></td>
			<td><%=rdate %></td>
			<td><%=hits %></td>
		</tr>
		<%	rowNo--;}%>		
	</table>
	<div class="view">
	<%
	String startStyle = "";
	String startURL = "reBoardList.jsp?view="+(startRange-1)+"";
	if(startRange == 1){
		startStyle = "color:#5d5e5e";
		startURL = "#";
	}
	%>
	<a href="<%=startURL %>" style="<%=startStyle %>">이전</a>
	<% 
	for(int i=startRange; i<=endRange; i++){
		String style = (viewPage == i)?"text-decoration:underline":"";
	%>		
	<a href="reBoardList.jsp?view=<%=i%>" style="<%=style%>"><%=i%></a>
	<% 
	}
	String endStyle = "";
	String endURL = "reBoardList.jsp?view="+(endRange+1)+"";
	if(endRange >= endPage){
		endStyle = "color:#5d5e5e";
		endURL = "#";
	}
	%>
	<a href="<%=endURL%>" style="<%=endStyle %>">다음</a>	
	</div>

</div>
<footer>by yunamom</footer>
</body>
</html>