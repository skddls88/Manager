<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
	<title>회원가입</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	
	function DoLogin() {
			var id = $("#id").val();
			var pass = $("#pass").val();
			if(id.length == 0) { alert("아이디를 입력해 주세요."); $("#id").focus(); return; }
			if(pass.length == 0) { alert("비밀번호를 입력해 주세요."); $("#pass").focus(); return; }
		LoginCheck();
	};
	
	function LoginCheck() {
		var action = $("#join").attr('action');
		var json = {
			id: $("#id").val(),
			pass: $("#pass").val(),
		};
		$.ajax({
			type: "POST",
			url: action,
			data: json,
			success : function(data) {
				if(data != 0) {
					alert('로그인성공');
					home();
				}
				else {
					alert('아이디 또는 비밀번호를 다시 확인해 주세요');
				}
			}
		});
		return false;
	};
	
	
	</script>
</head>
<body>
<h1>로그인</h1>
<form role="form"  action="${path}/home/user/dologin" accept-charset="utf-8" id="join" method="POST">
<div>
	<label>아 이 디 : </label><input id="id" name="id" placeholder="아이디를 입력하세요.">
	<label>비밀번호 : </label><input id="pass" name="pass" type="password" placeholder="비밀번호를 입력하세요.">
</div>
<div>
	<button type="button" onclick="DoLogin()">로그인</button>
	<button type="button" onclick="location.href='${path}/home/user/join'">회원가입</button>
</div>
</form>
</body>
</html>
