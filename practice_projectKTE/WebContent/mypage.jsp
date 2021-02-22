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
	padding: 10px 100px 10px;
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
			<form action="memberInfo" method="post">
				<table>
					<tr>
						<td colspan="2">내정보 확인</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${memInfo.userid }</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>${memInfo.userpw }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${memInfo.username }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${memInfo.userphone }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${memInfo.usergender }</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${memInfo.useraddr }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${memInfo.useremail }@${memInfo.userdomain }</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" onclick="location.href='ModifyProcess'" id="apply">수정</button>
							<button type="button" onclick="location.href='memberDel'">회원탈퇴</button>
						</td>

					</tr>
				</table>
		</form>
			</div>
	</div>
	<div id="footer">footer 부분</div>
</body>











</html>