<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
	<link rel="stylesheet" href="../css/layout.css">
</head>
<style>
td {
	text-align: left;
}
</style>
<body>
<div class="wrap">
	<header>
		<div class="header">
		</div>
	</header>
	<nav>
		<%@ include file="../include/topmenu.jsp" %>
		
	</nav>
	<aside>
		<%@ include file="../include/leftmenu.jsp" %>
	</aside>
	<section>
		<div class="row">
			<div class="right">
				<h2>게시판 입력화면</h2>
					<table align="center">		
					<colgroup>
						<col width="25%"/>
						<col width="*"/>
					</colgroup>	
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" class="box_title"></td>
						</tr>
						<tr>
							<th>암호</th>
							<td><input type="text" name="title" class="box_name"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="title" class="box_name"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea name="content"></textarea>
							<!-- rows 세로 cols 가로 -->
							</td>
						</tr>
					</table>
					<div>
						<button type="submit">저장</button>
						<button type="reset">취소</button>
					</div>		
				</div>
			</div>
		</div>
	</section>
	<footer>
		<%@ include file="../include/footer.jsp" %>
	</footer>
</div>
</body>
</html>
</html>