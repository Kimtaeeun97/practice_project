<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" 
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
	padding-top: 70px;
	padding-bottom: 70px;
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
table, tr, td{
background-color: white;
border: 1px solid black;
border-collapse: collapse;
padding: 10px 10px 10px;
margin-left: 550px;
}
td{
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
		<form action="memberLogin" method="post">
			<table>
				<tr>
					<td colspan="2">로그인</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="userid"><span id="idCheckResult"><br></span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" id="password" name="userpw"><span id="pwCheckResult"><br></span></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" onclick="loginBtn()">로그인</button></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<div id="footer">footer 부분</div>
</body>

<script>
$(function(){
	$("#id").keyup(function(){
		idCheck();
	});
	
	$("#password").keyup(function(){
		pwCheck();
	});
});
	
function idCheck() {
	var mid = $("#id").val();
	
	if (mid.length < 4 || mid.length > 8) {
	$("#idCheckResult").css("color", "red").text("유효 글자수는 4~8자 입니다.");
	}else if (mid.length >= 4 || mid.length <= 8) {
		$("#idCheckResult").text("");
	}
	
	if (mid.length > 10 ) {
		$("#idCheckResult").css("color", "red").text("최대 글자수는 10자리 입니다.");
	}
}

function pwCheck() {
	var mpassword = $("#password").val();
	
	if (mpassword.length < 4 || mpassword.length > 8) {
	$("#pwCheckResult").css("color", "red").text("유효 글자수는 4~8자 입니다.");
	}else if (mpassword.length >= 4 || mpassword.length <= 8) {
		$("#pwCheckResult").text("");
	}
	
	if (mpassword.length > 10 ) {
		$("#pwCheckResult").css("color", "red").text("최대 글자수는 10자리 입니다.");
	}
	
}

function loginBtn() {
	var mid = $("#id").val();
	var mpassword = $("#password").val();
	console.log(mid + ":::" + mpassword);
	
	
	if (mid == '') {
		alert("아이디를 입력해야 합니다.");
		$("#mid").focus();
		return;
	}
	if (mpassword == '') {
		alert("비밀번호를 입력해야 합니다.");
		$("#mpassword").focus();
		return;
	}
	
	var userMid = 'ICIA';
	var userMpw = '1111';
	
	if (userMid==mid) {
		if (userMpw==mpassword) {
			alert("로그인 되었습니다.");
			location.href = "home.jsp";
		}
	}
	
	if (userMid!=mid) {
		if (userMpw!=mpassword) {
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			location.href = "login.jsp";
		}
	}
	
}
</script>
</html>
















