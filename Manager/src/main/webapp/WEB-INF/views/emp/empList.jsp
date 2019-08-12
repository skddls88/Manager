<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>사원 리스트!</h1>
<table border="1">

<c:forEach var="emp" items="${emp}" varStatus="status">
<tr>
	<th>${emp.ename}</th>
	<th>${emp.comm}</th>
	<th><fmt:formatDate value="${emp.hiredate}" pattern="yyyy.MM.dd" /></th>
	<th>${emp.empno}</th>
	<th>${emp.mgr}</th>
	<th>${emp.job}</th>
	<th>${emp.deptno}</th>
	<th>${emp.sal}</th>
</tr>

</c:forEach>
</table>
</body>
</html>
