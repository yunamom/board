<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="../include/dbCon.jsp" %>
<%
String strReferer = request.getHeader("referer");
if(strReferer == null){
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location='../main/index.jsp';
	</script>
<%
	return;
}
String state = request.getParameter("state");
String city = request.getParameter("city");
String address = request.getParameter("address");


if(state == null || city == null || address == null || state.trim() == "" || address.trim() == "") {
%>
	<script>
	location='../member/post1.jsp';
	</script>
<%
	return;
}
String sql2 = " SELECT ";
       sql2+= " idx ";
       sql2+= " FROM "+state;
       sql2+= " WHERE sigungu = '"+city+"' ";
       sql2+= " AND dong like '"+address+"%' ";
       sql2+= " OR sigungu = '"+city+"' AND doro like '"+address+"%' ";
       sql2+= " OR sigungu = '"+city+"' AND buildname like '%"+address+"%' ";
ResultSet rs = stmt.executeQuery(sql2);

int cnt = 0;
ArrayList<Integer> list = new ArrayList<Integer>();
while(rs.next()){
	cnt++;
	list.add(rs.getInt("idx"));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ 주소검색 ∙</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>

<div class="window">
<form name = "frm" method = "post" action = "">
<h3>✱ 총개수 <%=cnt %> 개 ✱</h3>
<%
if(cnt == 0){
%>
<div class="view">
	<button type="button" onclick="location='post1.jsp?state=<%=state%>&city=<%=city%>'">뒤로가기</button>	
</div>
<%
	return;
}
%>
	<select class="selectBox" name="address">
		<%
		int index = 0;
		while(index<cnt){
					
		String sql = " SELECT ";   
		       sql+= " zipcode, ";
		       sql+= " sido, ";
		       sql+= " sigungu, ";
		       sql+= " dong, ";
		       sql+= " doro, ";
		       sql+= " buildno1, ";
		       sql+= " buildname ";
		       sql+= " FROM "+state;
		       sql+= " WHERE idx ="+list.get(index);
		rs = stmt.executeQuery(sql);
		rs.next();
		index++;
		String post[] = {"zipcode","sido","sigungu","dong","doro","buildno1","buildname"};
		
		String getpost = "["+rs.getString(post[0])+"] ";
			//우편번호
		for(int i=1; i<post.length; i++){
			getpost += rs.getString(post[i])+" ";
		%>
		<%}%>
		<option style="width:80%" value="<%=getpost%>"><%=getpost%></option>			
		<%
		}
		rs.close();
		%>
	</select>
<div class="view" style="margin-bottom:0">
	<button type="submit" onclick="fn_action()">적용</button>
	<button type="button" onclick="location='post1.jsp?state=<%=state%>&city=<%=city%>'">뒤로가기</button>		
</div>
</form>
</div>
</body>
<script src="../script/script.js"></script>
</html>