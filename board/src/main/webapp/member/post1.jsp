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
String city = request.getParameter("city");

String state1 = (state == null)?"":state;
String city1 = (city == null)?"":city;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ 주소검색 ∙</title>
</head>
<link rel="stylesheet" href="../css/layout.css">
<body onload="document.frm.address.focus()">

<div class="window">
<form name="frm" method="post" action="post2.jsp?state=<%=state1%>&city=<%=city1%>">
	<select class="selectBox" name="state" class="select" onchange="if(this.value) location.href=(this.value)" >
	<option value="">시도</option>
	<%
	String table[] = {"a1","b1","c1","d1","e1","f1","g1","h1","i1","j1","k1","l1","m1","n1","o1","p1","q1"};
	String sigungu[] = {"강원","경기","경남","경북","광주","대구","대전","부산","서울","세종","울산","인천","전남","전북","제주","충남","충북"};
	for(int i=0; i<sigungu.length; i++){
		String select=(state1.equals(table[i]))?"selected":"";
	%>
		<option value="post1.jsp?state=<%=table[i]%>"<%=select %>>
		<%=sigungu[i] %><!-- 테이블을 선택 -->
		</option>
	<%
	}
	%>	
	</select>
	<%if(!state1.equals("j1") && state1 != null && !state1.equals("")) {%>
	<select class="selectBox" name="city" class="select" onchange="if(this.value) location.href=(this.value)">
	<%
	String sql = " SELECT DISTINCT sigungu FROM "+state1;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
	String sigun = rs.getString("sigungu");
	String select=(city1.equals(sigun))?"selected":"";
	%>
	<option value="post1.jsp?state=<%=state1%>&city=<%=sigun%>"<%=select %>>
	<%=sigun %>
	</option>
	<%
	}
	%>
	</select>
	<%} %>
<div class="table">
<input style="margin-top:10px" type="text" name="address" placeholder="도로명/건물명" pattern="^[가-힣]{2,}$" required title="2자 이상 한글로 입력하세요.">
</div>
<div class="view" style="margin-bottom:0">
<button type="submit" onclick="fn_checkPost(); return false;">검색</button>
</div>
</form>
</div>
</body>
<script src="../script/script.js"></script>
</html>