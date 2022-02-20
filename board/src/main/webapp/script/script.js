

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
			return false;		}
		
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
	var w  = window.screen.width/2 -150;
	var h = window.screen.height/2 - 100;
	
	var url = "idcheck.jsp?userid="+userid+"&check="+check;
	window.open(url,"page","width=400,height=200,left="+w+",top="+h ); //left and top 으로 창의 위치를 설정할수있습니다.
	//팝업이름을 똑같이 하면 새창으로 열리지않고 그이름을 가진곳에 열린다. 없으면 새창으로 열린다. 
}

function fn_post(){ // 주소
	var url = "post1.jsp";
	
	var w  = (window.screen.width/2) - 150;
	var h = (window.screen.height/2) - 100;
	
	window.open(url,"page","width=400,height=200,left="+w+",top="+h );

}
function fn_action(){ // 우편번호 넣기 
	var addr = document.frm.address.value;//post2.jsp 에서 받아온주소
	
	var array = addr.split(" "); //주소를 나누어준다.
	var zipcode = array[0].substring(1,array[0].length-1);
	var address = addr.replace(array[0],"");
	//우편번호를 뺸 나머지 주소를 넣은 변수를 생성한다.
	//alert(zipcode);
	//alert(address);
	opener.document.frm.zipcode.value = zipcode; //회원가입화면 주소 input 값으로 보내준다.
	opener.document.frm.addr.value = address;
	
	self.close();
	//주소검색 창을 닫아준다.
}
function fn_plan(){
	var f = document.frm;
	var check = [f.title,f.content,f.name,f.pass];
	for(var i=0; i<check.length; i++){
		if(check[i].value == null){
			check[i].focus();
			return false;
		}
	}
}
function fn_detail(diary){ //planList.jsp 에서 날짜 매개변수를 받아온다.
	var url = "planView.jsp?pdate="+diary;
	
	window.open(url,"planView","width=400,height=500");	
}
function fn_modify(diary){ //planView.jsp 에서 날짜 매개변수를 받아온다.
	location = "planModify.jsp?pdate="+diary;
}
function fn_delete(diary){ //planView.jsp 에서 날짜 매개변수를 받아온다.
	if(confirm("정말 삭제하시겠습니까?")){
		location = "planDelete.jsp?pdate="+diary;
		
	}
	
}
