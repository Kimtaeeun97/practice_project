<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
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
		<form action="memberJoin" method="post">
				<table>
					<tr>
						<td colspan="2">회원가입</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>
						<input type="text" id="id" name="userid"><span id="idResult"></span>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" id="password" name="userpw"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" id="name" name="username"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="phone" name="userphone"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
						여자<input type="radio" id="women" value="여" name="usergender"> 
						남자<input type="radio" id="man" value="남" name="usergender">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" id="address" name="useraddr"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="email" name="useremail">@<input type="text"
							id="inputEmail" name="userdomain"> <select id="emailSel">
								<option value="">직접입력</option>
								<option value="google.com">google</option>
								<option value="naver.com">naver</option>
								<option value="daum.com">daum</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" onclick="joinBtn()" id="apply">등록</button>
							<input type="reset" value="취소">
						</td>

					</tr>
				</table>
		</form>
			</div>
	</div>
	<div id="footer">footer 부분</div>
</body>

<script type="text/javascript">
	$(function() {
		$("#emailSel").change(function() {
			emailSelect();
		});
		$("#apply").click(function() {
			userInfo();
		});
	});

	function emailSelect() {
		var email = $("#emailSel").val();
		$("#inputEmail").val(email);
	}

	function joinBtn() {
		var id = $("#id").val();
		var password = $("#password").val();
		var name = $("#name").val();
		var phone = $("#phone").val();

		if (id == '') {
			alert("아이디가 입력되지 않았습니다.");
			$("#id").focus();
			return;
		
		}

		if (password == '') {
			alert("비밀번호가 입력되지 않았습니다");
			$("#password").focus();
			return;
		}

		if (name == '') {
			alert("이름이 입력되지 않았습니다.");
			$("#name").focus();
			return;
		}

		if (phone == '') {
			alert("전화번호가 입력되지 않았습니다");
			$("#phone").focus();
			return;
		}


	}

	function userInfo() {
		var userid = "아이디 : " + $("#id").val();
		var userpassword = "비밀번호 : " + $("#password").val();
		var username = "이름 : " + $("#name").val();
		var userphone = "전화번호 : " + $("#phone").val();
		var usergender = "성별 : " + $("#women").val();
		$("#man").val();
		var useraddress = "주소 : " + $("#address").val();
		var useremail = "이메일 : " + $("#email").val() + " @ "
				+ $("#inputEmail").val();

		var text = userid + "\n" + userpassword + "\n" + username + "\n"
				+ userphone + "\n" + usergender + "\n" + useraddress + "\n"
				+ useremail;
		alert(text);

	}
	
	
	$(document).ready(function() {
		$("#id").keyup(function() {
			var idCheck = $("#id").val();
			$.ajax({
				type : "post",
				url : "checkId",
				data : {"uid" : idCheck }, //서버에 보내주는 데이터
				success : function(data) {
					console.log("data : " + data);//data 리턴받는 값을 의미
					if (data == "OK") {
						$("#idResult").css("color", "green").text("사용가능")
					} else {
						$("#idResult").css("color", "red").text("사용 불가능")

					}

				},
				error : function() {
					//전송 실패 할 경우 실행되는 부분
					console.log("전송 되지 않았습니다.")
				}
			})

		})
	})
</script>









</html>