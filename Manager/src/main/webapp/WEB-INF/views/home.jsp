<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
<h1>
<c:if test="${user != null }">${user.name} 님</c:if> 안녕하세요.  
</h1>

<P><a href="${path}emp/list">사원 목록 보기</a></P>
<P><a href="${path}code/list">제품 목록 보기</a></P>
<P><a href="${path}code/detail">제품 관리 하기</a></P>
<P><a href="${path}user/login">로그인 하러 가기</a></P>
</body>
</html>
