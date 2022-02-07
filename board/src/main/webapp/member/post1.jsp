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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ 주소검색 ∙</title>
</head>
<link rel="stylesheet" href="../css/style.css">
<body onload="document.frm.address.focus()">
<form name = "frm" method = "post" action = "post2.jsp">

<div style="padding:20%; text-align:center; background-color:#bb899a;">

	<select name="state" >
	<%
	String table[] = {"a1","b1","c1","d1","e1","f1","g1","h1","i1","j1","k1","l1","m1","n1","o1","p1","q1"};
	String state[] = {
			"강원도",
			"경기도",
			"경상남도",
			"경상북도",
			"광주광역시",
			"대구광역시",
			"대전광역시",
			"부산광역시",
			"서울특별시",
			"세종특별자치시",
			"울산광역시",
			"인천광역시",
			"전라남도",
			"전라북도",
			"제주특별자치도",
			"충청남도",
			"충청북도"};
	for(int i=0; i<state.length; i++){
	
		String select=(state[i].equals("서울특별시"))?"selected":"";
	%>
		<option value="<%=table[i]%>"<%=select %>><%=state[i] %></option>
	<%
	}
	%>	
	</select>

<input type="text" name="address" placeholder="예) 압구정로,현대아파트 " pattern="^[가-힣]{2,}$" required title="2자 이상 한글로 입력하세요.">
<div id="result"></div>

<button type="submit">검색</button>

</div>
</form>
</body>
<script src="../script/script.js"></script>
</html>