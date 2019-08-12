<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>회원가입</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	
	var check = 0;
	var id = '';
	
	function Check() {
			var id = $("#id").val();
			if(id.length == 0) { alert("아이디를 입력해 주세요."); $("#id").focus(); return; }
		IdCheck();
	};
	
	function save() {
		var reid = $("#id").val();
		var pass = $("#pass").val();
		var repass = $("#repass").val();
		var name = $("#name").val();
			if(id != reid){
				alert('아이디 중복확인을 해주세요.');
				check = 0;
			}
			if(id.length == 0) { alert("아이디를 입력해 주세요."); $("#id").focus(); return; }
			if(check == 0){
				alert('아이디 중복확인을 해주세요.');
				return;
			}
			if(5 >= pass.length >= 10) { alert("비밀번호 자릿수를 확인해 주세요."); $("#pass").focus(); return; }
			if(repass.length == 0) { alert("비밀번호확인을 입력해 주세요."); $("#repass").focus(); return; }
			if(pass != repass){alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요."); return;}
			if(name.length == 0) { alert("이름을 입력해 주세요."); $("#name").focus(); return; }
		$("#newuser").submit();
	};
	
	function IdCheck() {
		var json = {
				id: $("#id").val()
			};
		
			$.ajax({
				type: "POST",
				url: "/home/user/idcheck",
				data: json,
				success : function(data) {
					if(data != 0) {
						alert('이미 사용중인 아이디 입니다.');
						$("#id").focus(); return;
					}
					else{
						alert('사용 가능한 아이디 입니다.');
					}
				}
			});
			return false;
		};
	</script>
</head>
<body>
<h1>회원가입 1/2</h1>
<form role="form" action="${path}/home/user/insertuser" accept-charset="utf-8" id="newuser" method="POST">
<div>
	<label>아 이 디 : </label>
	<input id="id" name="id" placeholder="아이디를 입력하세요." maxlength="20">
	<span><button type="button" onclick="Check();">중복확인</button></span>
</div>
<div>
#비밀번호는 5자리 이상 10자리 이하여야 합니다.
</div>
<div>
	<label>비 밀 번 호 : </label>
	<input id="pass" name="pass" type="password" placeholder="비밀번호를 입력하세요." maxlength="10">
</div>
<div>
	<label>비밀번호확인 : </label>
	<input id="repass" name="repass" type="password" placeholder="비밀번호를 입력하세요." maxlength="10">
</div>
<div>
	<label>성  명 : </label>
	<input id="name" name="name" placeholder="성명을 입력하세요.">
</div>
<div>
	<button type="button" onclick="save();">저장</button>
</div>

</form>
</body>
</html>
