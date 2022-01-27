<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%
String unq = request.getParameter("unq"); 
// gid , thread 를 가져오기위한 부모의 unq 를 가져온다.
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");


String sql1 = " SELECT gid,thread FROM reboard ";
       sql1+= " WHERE unq='"+unq+"' "; // 부모의 unq 를넣어준다.
       
ResultSet rs = stmt.executeQuery(sql1);
rs.next();

String p_gid = rs.getString("gid"); //부모 gid 
String p_thread = rs.getString("thread"); //부모 thread
      
       
String sql2 = " SELECT ifnull(MAX(thread),'0') as maxThread FROM reboard ";
       sql2+= " WHERE gid='"+p_gid+"' and thread like '"+p_thread+"_' ";
       
rs = stmt.executeQuery(sql2);
rs.next();

String maxThread = rs.getString("maxThread");
String myThread = "";

if(maxThread.equals("0")){ //답글이 없을때
	myThread = p_thread+"a";
}else{ //답글이 있을경우
	char a1 = maxThread.charAt(maxThread.length()-1);
	//마지막 값을 가져온다. 
	a1++; //char 타입이어야 하는 이유는 증가시켜줘야하기때문입니다. 예) a->b , b->c  like this
	String a2 = maxThread.substring(0,maxThread.length()-1); //마지막값을 제외한 maxThread
	myThread = a2+a1;  
	//이게 간단하게 생각해보면 기존에 있던 값에 증가++해주는것! 
}

String sql3 = " INSERT into reboard(title,pass,name,content,rdate,gid,thread) ";
       sql3+= " VALUES('"+title+"' ";
       sql3+= ",'"+pass+"' ";
       sql3+= ",'"+name+"' ";
       sql3+= ",'"+content+"' ";
       sql3+= ",now()";
       sql3+= ",'"+p_gid+"' ";
       sql3+= ",'"+myThread+"') ";
       
int result = stmt.executeUpdate(sql3);
if(result == 1){
%>
	<script>
	alert("답변완료!");
	location="reBoardList.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("답변실패!");
	location="reBoardList.jsp";
	</script>
<%
}           
%>