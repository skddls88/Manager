<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>CODE SEARCH</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	$(function(){
	});
	
	function changeCategory(){
		var json = {
			category: $("#category").val()
		};
		$.ajax({
			type: "POST",
			url: "/home/code/codeNumber",
			data: json,
			success : function(data) {
			}
		});
	};C
	</script>
	<style>
	.list{
		margin-left: auto;
		margin-right: auto;
	}
	.title{
		text-align: center;
	}
	.code{
		width: 600px;
		height: 600px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 100px;
	}
	</style>
</head>
<body>
<div class="title">
<h1>전체리스트</h1>
</div>
<div class="title">
	<span>
		<label>카테고리</label>
		<select id="category" name="category" onchange="changeCategory()">
			<c:forEach var="codeCategory" items="${codeCategory}" varStatus="status">
				<option value="${codeCategory.cdname}">${codeCategory.cdname}</option>
			</c:forEach>
		</select>
	</span>
	<span>
		<label>1차분류 :</label>
		<select><!-- 
			<c:forEach var="codeCategory" items="${codeCategory}" varStatus="status">
				<option value="${codeCategory.cdname}">${codeCategory.cdname}</option>
			</c:forEach> -->
		</select>
	</span>
	<span>
		<button type="submit">조회</button>
		
	</span>
</div>
<table border="1" class="list">
<tr>
	<th>상품코드</th>
	<th>상품명</th>
	<th>제조사코드</th>
	<th>제조사명</th>
	<th>단위코드</th>
	<th>재고수량</th>
	<th>재고여부</th>
	<th>사용여부</th>
<tr>
<c:forEach var="code" items="${code}" varStatus="status">
<tr onclick="codeView('${code.cdno}','${code.cdlvl}','${code.upcd}','${code.cdname}','${code.useyn}')">
	<td>${code.cdno}</td>
	<td>${code.cdlvl}</td>
	<td>${code.upcd}</td>
	<td>${code.cdname}</td>
	<td>
		<c:if test="${code.useyn eq 'Y'}">
			<input type="checkbox" value="Y" onclick="return false" checked>
		</c:if>
		<c:if test="${code.useyn ne 'Y'}">
			<input type="checkbox" onclick="return false">
		</c:if>
	</td>
</tr>
</c:forEach>
</table>
<div class="code">
	<form>
		<div>코드내용</div>
		<div>
			<label>상품코드 :</label>
			<input id="cdno" name="cdno" readonly>
		</div>
		<div>
			<label>상 품 명 :</label>
			<input id="cdlvl" name="cdlvl" readonly>
		</div>
		<span>
			<label>제 조 사 :</label>
			<input id="upcd" name="upcd" readonly>
		</span>
		<span>
			<label>단 위 명 :</label>
			<input id="cdname" name="cdname" readonly>
		</span>
		<div>
			<label>사용여부 :</label>
			<input id="useyn" name="useyn" type="checkbox" value="Y" onclick="return false" checked>
		</div>
		<button type="button" onclick="codeinsert();">추가</button>
		<button type="button" onclick="codeupdate();">수정</button>
		<button type="button" onclick="codesavecheck();">저장</button>
	</form>	
</div>

</body>
</html>
