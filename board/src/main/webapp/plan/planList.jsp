<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="../include/dbCon.jsp" %>
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

String yy = request.getParameter("y"); 
String mm = request.getParameter("m"); 

Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);//0~11
int d = cal.get(Calendar.DATE);
int thisY = y; //현재년도 변수


y = (yy != null && !yy.equals(""))?Integer.parseInt(yy):y;
m = (mm != null && !mm.equals(""))?Integer.parseInt(mm)-1:m;
//받아온 month 값을 -1 해준뒤 적용해준다. (month 의 인덱스는 0부터11까지)
cal.set(y,m,1); //년 , 월 , 1일
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);//일:1 ~ 토:7
int lastday = cal.getActualMaximum(Calendar.DATE);
//출력 년월의 마지막 날짜

//before 버튼을 위한 세팅 
int before_y = y;
int before_m = m;
if(before_m == 0){
	before_y--;
	before_m = 12;
}
//after 버튼을 위한 세팅 12월이 지나고 13이 아닌 1월이 나오게한다.
int after_y = y;
int after_m = m+2;
if(after_m > 12){
	after_y++;
	after_m = 1;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ <%=y %>년 <%=m+1 %>월 ∙</title>
<link rel="stylesheet" href="../css/plan.css">

</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<%
if(session_id == null || session_id.equals("")){
%>
	<script>
	alert("로그인 이후에 이용가능합니다.");
	location="../member/loginWrite.jsp";
	
	</script>
<%
	return;
}
%>
<form name="frm" method="post" action="planList.jsp">
<!-- 데이터를 자기자신에게 넘길수있게한다.-->
</form>
<section>
<div class="row">
	<table class="table">
		<caption>
<div class="selectBox">
		<button style="margin-right:20px"type="button" onclick="location='planList.jsp?y=<%=before_y%>&m=<%=before_m%>'">
		<%=before_m%>월</button>
	<select name="year" class="select" onchange="if(this.value) location.href=(this.value)">
		<%int test=0;
		for(int y1=(thisY-10); y1<=(thisY+10); y1++){
			String checkY=(y1==y)?"selected":"";
		%>
		<option value="planList.jsp?y=<%=y1 %>&m=<%=m+1 %>" <%=checkY %>><%=y1 %>년</option>
		<% test++;
		}
		%>
	</select>
	<select name="month" class="select" onchange="if(this.value) location.href=(this.value)">
		<%
		for(int m1=0; m1<12; m1++){
			String checkM=(m1==m)?"selected":"";
		%>
		<option value="planList.jsp?y=<%=y %>&m=<%=m1+1 %>" <%=checkM %>><%=m1+1 %>월 </option>
		<%
		}
		%>
	</select>	
		<button style="margin-left:20px"type="button" onclick="location='planList.jsp?y=<%=after_y%>&m=<%=after_m%>'">
		<%=after_m%>월</button>
</div>

		</caption>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
		<%
		int count = 0; //변수생성	
		for(int i=1; i<dayOfweek; i++){
			out.print("<td>∙</td>");
			count++;
		}
		for(int day=1; day<=lastday; day++){
			count++;
			String color=(count%7==1)?"#b56161":(count%7==0)?"#677793":"";
			//요일 구하기
			
			//저장된 글 표시하기
			String diary = y+"-"+(m+1)+"-"+day;
			String d_sql = " SELECT count(*)cnt from plan ";
			       d_sql+= " WHERE userid = '"+session_id+"' ";
			       d_sql+= " AND pdate = '"+diary+"' ";
			ResultSet d_rs = stmt.executeQuery(d_sql);
			d_rs.next();
			int cnt = d_rs.getInt("cnt");
			
			if(cnt == 1){
			%>
				<td style="background-color:pink" onClick="javascript:fn_detail('<%=diary%>')">
				<%=day%></td>
				<!-- 날짜를 클릭했을때 함수가 실행되면서 diary 값을 보내준다. -->
			<%
			}else{
			%>	<td onClick="window.open('planWrite.jsp?y=<%=y%>&m=<%=m+1%>&d=<%=day%>&w=<%=dayOfweek %>','Diary','width=400,height=500')"
			style="color:<%=color%>;"><%=day%></td>
			
			<%}
			if(count%7==0){
				out.print("</tr><tr>");
				count=0;
			}
		}		
		while(count<7){
			out.print("<td>∙</td>");
			count++;
		}
		%>
		</tr>
	</table>
</div>
</section>
<footer>
by.yunamom
</footer>
</body>
<script src="../script/script.js"></script>
</html>