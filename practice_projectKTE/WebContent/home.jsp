<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home.jsp</title>
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
		<div id="memberView"></div>

		<p>Well, you can wear those pajamas like those Tibetan llamas all
			day You can be the ascetic profound and prophetic in most every way
			You can model your life after Christ or suffice with Simon Peter You
			can bathe in holy water bow to Gideon or Gautama Or the pyramids of
			Giza You can wear your frock, your collar, or your shawl But there's
			a little bit of Judas in us all You can keep your conscience swept
			clean Your front lawn looking green It's a keen neighborhood You
			visit your sick mother weekly Spring for charity freely like a moral
			man should You brought two children in' the world a little boy, a
			little girl You dutifully clothe and you feed them ou come straight
			home to your wife You want no trouble in your life You swear you'll
			never cheat on them Now suddenly you're feeling so small 'Cause
			there's a little bit of Judas in us all Well, excuse my digression
			But I had the distinct impression she loved me so So as not to try
			her conscience She handed me a crock of nonsense while she bled me
			slow Now her picture hangs on the wall to remind me There's a little
			bit of Judas in us all A little bit of Judas, a little bit of Judas,
			In us all</p>
	</div>
	<div id="footer">footer 부분</div>
</body>
</html>