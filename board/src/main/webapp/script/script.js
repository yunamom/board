//board 유효성체크
function fn_submit() {
	var f = document.frm; 
	var check = [f.title,f.content,f.name,f.pass];
	var show = ["제목","내용","이름","비밀번호"];
	
	for(var i=0; i<check.length; i++){
		var value = check[i].value;
		if(value == ""){
			alert(show[i]+"을 입력하세요!");
			check[i].focus();
			return false;
		}
		if(value.trim() == ""){
			alert(show[i]+"에 공백을확인하세요.");
			check[i].focus();
			return false;
		}
		
	}
	f.submit();
}
function fn_onload() {
	var f = document.frm;
	if(f.name.value == "" || f.name.value == "null"){
		location="../member/loginWrite.jsp";
		//session_id 값이 없는 사용자가 접근했을때 로그인화면으로 이동합니다.
		return false;
	}
	f.title.focus();
	f.onload();	
}

//member유효성체크
function fn_memberSubmit(){
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