<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Account</title>

<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="../script/jquery-1.12.4.js"></script>
  <script src="../script/jquery-ui.js"></script>
  <script>
  $( function() {//#은 id 값을 의미한다.
    $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>
  
</head>

<script>
function fn_submit(){
	var f = document.frm;	
	
	if(f.userid.value == ""){
		alert("아이디를 입력해주세요.");
		f.userid.focus();
		return false;
	}
	if(f.check.value == "0"){
		alert("아이디 중복확인을 해주세요.");
		f.userid.focus();
		return false;
	}	
	if(f.pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	if(f.pass.value.length < 4 ){
		alert("비밀번호는 4자이상으로 입력해주세요.");
		f.pass.focus();
		return false;
	}	
	if(f.pass.value != f.pass2.value){
		alert("비밀번호를 확인해주세요.");
		f.pass2.focus();
		return false;
	}
	if(f.name.value == ""){
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(f.gender.value == ""){
		alert("성별을 선택하세요.");
		return false;
	}
	if(f.birthday.value == ""){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	var reg_mobile = /^[0-9]{8,13}$/; //전화번호 숫자만
	if(!reg_mobile.test(f.mobile.value)){
		alert("전화번호를 확인해주세요.");
		f.mobile.focus();
		return false;
	}
		
	document.frm.submit();
	
}
function fn_idcheck(){  // id 중복체크
	var userid = document.frm.userid.value;
	var check = document.frm.check.value;
	var replaced_id = userid.replace(/ /g,'');
	
	if(check == "1"){
		document.frm.check.value = "0";
		document.frm.userid.readOnly=false;
		document.frm.button.value = "check ID";
		return false;
	}
	if(userid == null || userid == ""){
	
		alert("아이디를 입력해주세요!");
		return false;
	}
	if(replaced_id.length != userid.length){

		alert("공백은 포함할수없습니다.");
		return false;
		
	}
	var idReg = /^[a-zA-Z]+[a-z0-9A-Z]{3,11}$/g;
	
	if(!idReg.test(userid)){
		alert("4~12자 영문자 또는 숫자 이어야합니다.");
		return false;
	}
	
	
	var url = "idcheck.jsp?userid="+userid+"&check="+check;
	window.open(url,"중복아이디체크","width=200,height=150");
	
}
function fn_onload(){
	document.frm.userid.focus();
	document.frm.onload();
}
</script>

<body onload="fn_onload()"> <!-- 아이디 입력창에 커서가 깜빡거릴수있도록 한다. -->
<%@ include file="../include/topmenu.jsp" %>
<div class="row">
	<h2> Join Account </h2>
	<form name="frm" method="post" action="memberWriteSave.jsp">
		<table class="table" style="max-width:500px">
		<colgroup>
		<col width="25%">
		<col width="*">
		</colgroup>
		<tr>
			<th>아이디</th>
			<td style="text-align:left">
			
			<input type="text" name="userid" required>
			(영문 4자~12)
			<input type="button" onclick="fn_idcheck()" name="button" value="check ID">
			<input type="hidden" name="check" value="0"><!-- 중요합니다! 중복체크확인할수있는 변수를 생성 -->
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td style="text-align:left"><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td style="text-align:left"><input type="password" name="pass2" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td style="text-align:left"><input type="text" name="name" required></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="gender" value="M">남성
			<input type="radio" name="gender" value="F">여성
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td style="text-align:left">
			<input type="text" name="birthday" id="birthday" required>
			</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td style="text-align:left">
			<input type="text" name="mobile">
			</td>
		</tr>
		<tr>
			<th>주소</th> <!-- 우편번호,주소 -->
			<td style="text-align:left">
			<input type="text" name="zipcode">
			<button type="button">우편번호찾기</button>
			<input type="text" size="40" name="addr">
			
			</td>
		</tr>
		
		</table>
	
		<div class="view">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<button type="reset">취소</button>
		</div>			
	</form>	
</div>
</body>
</html>