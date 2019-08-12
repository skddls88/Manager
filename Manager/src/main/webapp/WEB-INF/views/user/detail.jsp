<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>상세페이지</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	function success(){
		var mobile = $("#mobiletelno").val();
		var home = $("#hometelno").val();
		var add = $("#addrcd").val();
		
		if(1000 > add){
			alert('우편번호를 정확히 입력해주세요');
			$("#addrcd").focus(); return;
		}
		if(mobile.length == 0 || home.length == 0){
			alert('휴대전화나 집전화번호 중 한가지를 선택해서 입력해 주세요.');
			$("#mobiletelno").focus(); return;
		}
		if(mobile.length != 11){
			alert('휴대전화번호를 확인해주세요.');
			$("#mobiletelno").focus(); return;
		}
		if(home.length <= 10){
			alert('집전화번호를 확인해주세요.');
			$("#hometelno").focus(); return;
		}
		
	$("#newuser2").submit();
	};
	</script>
</head>
<body>
<h1>회원가입 2/2</h1>
<form role="form" action="${path}/home/user/insertuserdetail" accept-charset="utf-8" id="newuser2" method="POST">
<input id="id" name="id" type="hidden" value ="${id}"/>
<div>
	<label>성명 : </label>
	<input id="delivname" name="delivname" placeholder="성명을 입력하세요." maxlength="20" required>
</div>
<div>
	<label>관계 : </label>
	<select name="relcd">
		<option value="C0021">본인</option>
		<option value="C0022">부모님</option>
		<option value="C0023">동생</option>
		<option value="C0024">지인</option>
	</select>
</div>
<div>
	<label>우편번호 : </label>
	<input id="addrcd" name="addrcd" placeholder="우편번호" maxlength="5" required>
</div>
<div>
	<label>주소 : </label>
	<input id="addrname" name="addrname" placeholder="주소를 입력하세요" maxlength="30" required>
</div>
<div>
	<label>휴대전화번호 : </label>
	<input id="mobiletelno" name="mobiletelno" placeholder="휴대전화" maxlength="11">
</div>
<div>
	<label>집전화번호 : </label>
	<input id="hometelno" name="hometelno" placeholder="집번호" maxlength="11">
</div>
<div>
	<label>사용여부 : </label>
	<input id="useyn" name="useyn" type="checkbox" value="Y" checked>사용
</div>
<button type="button" class="btn btn-primary" onclick="success();">저장</button>

</form>
</body>
</html>
