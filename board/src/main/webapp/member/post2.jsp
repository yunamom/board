<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String address = request.getParameter("address");


if(state == null || address == null || state.trim() == "" || address.trim() == "") {
%>
	<script>
	location='../member/post1.jsp';
	</script>
<%
	return;
}

String sqlCnt = " SELECT COUNT(*)cnt FROM "+state+" ";
       sqlCnt+= " WHERE dong like '"+address+"%' ";
       sqlCnt+= " OR doro like '"+address+"%' ";
       sqlCnt+= " OR buildname like '"+address+"%' ";
       
ResultSet rsCnt = stmt.executeQuery(sqlCnt);
rsCnt.next();
int cnt = rsCnt.getInt("cnt");

if(cnt == 0){
%>
	<script>	
	location='../member/post1.jsp';
	</script>
<%
	return;

}else{
	
//유효성 검사를 다 마친후 값이 있는경우 LIMIT 를 작성해서 10개 내외로 화면에 보여지게하자.
int p = 10; //한페이지에 보여질 데이터값의 갯수
String view = request.getParameter("view");
if(view == null){ //첫번째 페이지인 경우
	view = "1"; 
}
int vpage = Integer.parseInt(view);

String sql = " SELECT ";
       sql+= " zipcode, ";
       sql+= " sido, ";
       sql+= " sigungu, ";
       sql+= " dong, ";
       sql+= " doro, ";
       sql+= " buildno1, ";
       sql+= " buildname ";
       sql+= " FROM "+state+" ";
       sql+= " WHERE dong like '"+address+"%' ";
       sql+= " OR doro like '"+address+"%' ";  
       sql+= " OR buildname like '"+address+"%' ";
       sql+= " ORDER BY sigungu,dong,doro,buildno1 ASC LIMIT 0,10 "; 
       
ResultSet rs = stmt.executeQuery(sql);

String post[] = {"zipcode","sido","sigungu","dong","doro","buildno1","buildname"};
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ 주소검색 ∙</title>
</head>
<link rel="stylesheet" href="../css/style.css">
<body>

<div style="padding:20%; text-align:center; background-color:#bb899a;">
<form name = "frm" method = "post" action = "">
총개수<%=cnt %>개
	<select name="address">
		<%while(rs.next()){ 
			String getpost = "";
		for(int i=0; i<post.length; i++){
			getpost += rs.getString(post[i])+" ";
		%>
		<%
		}
		%>
		<option value="<%=getpost%>"><%=getpost%></option>			
		<%
		}
		%>
	</select>
	<button type="submit">적용</button>
	<button type="button" onclick="location='post1.jsp'">뒤로가기</button>		
</form>
<%} %>
</div>
</body>
<script src="../script/script.js"></script>
</html>