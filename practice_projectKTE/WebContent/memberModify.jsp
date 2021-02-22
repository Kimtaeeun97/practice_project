<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	background-color: gray;
	margin: auto;
}

#header {
	text-align: center;
	background-color: fuchsia;
	padding-top: 50px;
	padding-bottom: 50px;
	font-size: 40px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
}

#menu {
	background-color: black;
	font-size: 18px;
	padding-top: 25px;
	padding-bottom: 25px;
	margin-left: 20px;
	margin-right: 20px;
}

a {
	color: white;
}

#view {
	background-color: white;
	padding-top: 50px;
	padding-bottom: 50px;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

#memberView {
	background-color: lime;
	padding-top: 100px;
	padding-bottom: 100px;
	margin-left: 20px;
	margin-right: 20px;
	margin-left: 20px;
}

p {
	padding-left: 15px;
}

#footer {
	background-color: aqua;
	padding-top: 50px;
	padding-bottom: 50px;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

table, tr, td {
	background-color: white;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px 10px 10px;
	margin-left: 550px;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<div id="header">java 기반 Back End 개발자 & 정보처리 산업기사</div>

	<div id="menu">
		<a style="padding-right: 1200px; padding-left: 80px;" href="home.jsp">홈으로</a>
		<c:if test="${sessionScope.login == null}">
			<a style="padding-right: 40px;" href="login.jsp">로그인</a>
			<a href="join.jsp">회원가입</a>
		</c:if>
		<c:if test="${sessionScope.login != null}">
			<a style="padding-right: 40px;" href="memberInfo">내정보</a>
			<a href="memberLogout">로그아웃</a>
		</c:if>
	</div>

	<div id="view">
		<p style="font-size: 30px">컨텐츠 화면</p>
		<p>java 기반 Back End 개발자 & 정보처리 산업기사</p>
			<div id="memberView">
			<form action="ModifyProcesser" method="post">
				<table>
					<tr>
						<td colspan="2">내정보 수정</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" value="${Modify.userid }" name="userid"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" value="${Modify.userpw }" name="userpw"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" value="${Modify.username }" name="username"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" value="${Modify.userphone }" name="userphone"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
						여<input type="radio" value="${Modify.usergender }" name="usergender">
						남<input type="radio" value="${Modify.usergender }" name="usergender">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" value="${Modify.useraddr }" name="useraddr"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="email" name="useremail" value="${Modify.useremail }">@<input type="text"
							id="inputEmail" name="userdomain" value="${Modify.userdomain }"> <select id="emailSel">
								<option value="">직접입력</option>
								<option value="google.com">google</option>
								<option value="naver.com">naver</option>
								<option value="daum.com">daum</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="변경하기">
							<input type="reset" value="취소">
						</td>

					</tr>
				</table>
		</form>
			</div>
	</div>
	<div id="footer">footer 부분</div>
</body>
