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
String address = request.getParameter("address");


if(state == null || address == null || state.trim() == "" || address.trim() == "") {
%>
	<script>
	location='../member/post1.jsp';
	</script>
<%
	return;
}

String sqlCnt = " SELECT idx FROM "+state+" ";
       sqlCnt+= " WHERE dong like '"+address+"%' ";
       sqlCnt+= " OR doro like '"+address+"%' ";
       sqlCnt+= " OR buildname like '"+address+"%' ";
       sqlCnt+= " ORDER BY dong,doro,buildno1";
       
ResultSet rsCnt = stmt.executeQuery(sqlCnt);

ArrayList<Integer> idx = new ArrayList<Integer>();

int cnt = -1;

while(rsCnt.next()){
	cnt++;
	idx.add(rsCnt.getInt("idx"));
}

rsCnt.close();

if(cnt < 0){
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
int index = (vpage-1)*p;

int next = idx.get(index);

String sql = " SELECT ";
       sql+= " zipcode, ";
       sql+= " sido, ";
       sql+= " sigungu, ";
       sql+= " dong, ";
       sql+= " doro, ";
       sql+= " buildno1, ";
       sql+= " buildname ";
       sql+= " FROM "+state+" ";
       sql+= " WHERE idx >'"+next+"' and idx < '"+(next+p)+"' ";
       
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
총개수<%=cnt+1 %>개
	<select name="address">
		<%	idx.get(index);
		int hi=idx.get(index);
		hi+=10;
		
		while(rs.next()){ 
			String getpost = "["+rs.getString(post[0])+"] ";
			//우편번호
		for(int i=1; i<post.length; i++){
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
	<button type="submit" onclick="fn_action()">적용</button>
	<button type="button" onclick="location='post1.jsp'">뒤로가기</button>		
</form>
<%} %>
</div>
</body>
<script src="../script/script.js"></script>
</html>