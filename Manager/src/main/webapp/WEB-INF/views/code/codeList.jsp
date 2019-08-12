<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>CODE LIST</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
	var url = '';
	var clickCheck = 0;
	var clickUpdate = 0;
	var clickInsert = 0;
	
	function codeView(cdno,cdlvl,upcd,cdname,useyn) {
		$("#cdno").val(cdno),
		$("#cdlvl").val(cdlvl),
		$("#upcd").val(upcd),
		$("#cdname").val(cdname),
		$("#useyn").val(useyn)
		
		if(useyn == "Y")
		{
			$("#useyn").attr("checked","checked");
			$("#useyn").attr("value","Y");
		}
		else
		{
			$("#useyn").removeAttr("checked");
			$("#useyn").attr("value","N");
		}
		clickCheck = 1;
		clickUpdate = 0;
		clickInsert = 0;
	};
	
	
	function codeinsert(){
		$("#cdno").val(),
		$("#cdlvl").val(),
		$("#upcd").val(),
		$("#cdname").val(),
		$("#useyn").val()

		$("#cdlvl").removeAttr("readonly");
		$("#upcd").removeAttr("readonly");
		$("#cdname").removeAttr("readonly");
		$("#useyn").removeAttr("onclick", null);

		clickInsert = 1;
		url = "/home/code/insertCode";
	};
	
	function codeupdate(){
		
		if(clickCheck == 0){
			alert('리스트를 선택해주세요.');
			return;
		}
		$("#cdlvl").removeAttr("readonly");
		$("#upcd").removeAttr("readonly");
		$("#cdname").removeAttr("readonly");
		$("#useyn").removeAttr("onclick", null);
		
		clickUpdate = 1;
		clickInsert = 0;
		url = "/home/code/saveCode";
	};
	
	function codesavecheck(){
		if(clickCheck == 0){
			return;
		}
		
		if(clickUpdate == 0 && clickInsert == 0){
			return;
		}
		var cdlvl = $("#cdlvl").val();
		var upcd = $("#upcd").val();
		var cdname = $("#cdname").val();
		if(cdlvl == 0){ alert('코드레벨을 입력해주세요.'); $("#cdlvl").focus(); return; }
		if(upcd == ''){ alert('상위코드를 입력해주세요.'); $("#upcd").focus(); return; }
		if(cdname == ''){ alert('코드이름을 입력해주세요.'); $("#cdname").focus(); return; }
		if(cdlvl > 0){
			var cdlvl = $("#cdlvl").val()-1;
		}
		var json = {
			upcd: $("#upcd").val(),
			cdlvl
		};
	
		$.ajax({
			type: "POST",
			url: "/home/code/cdlvlCheck",
			data: json,
			success : function(data) {
				if(data != 0) {
					codesave();
				}
				else{
					alert('존재하지 않는 상위코드 입니다. 코드레벨과 상위코드를 확인해주세요.');
					return false;
				}
			}
		});
		
	};
	
	function codesave(){
		
		var useyn = $("#useyn").val();

		if(useyn == "Y")
		{
			$("#useyn").attr("checked","checked");
			$("#useyn").attr("value","Y");
		}
		else
		{
			$("#useyn").removeAttr("checked");
			$("#useyn").attr("value","N");
		}
		
		
		var json = {
			cdno: $("#cdno").val(),
			cdlvl: $("#cdlvl").val(),
			upcd: $("#upcd").val(),
			cdname: $("#cdname").val(),
			useyn: $("#useyn").val()
		};

		$.ajax({
			type: "POST",
			url: url,
			data: json,
			success : function(data) {
				alert('완료되었습니다.');
			}
		});
	};
	
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
<h1>제품 리스트!</h1>
</div>
<table border="1" class="list">
<tr>
	<th>코드번호</th>
	<th>코드 레벨</th>
	<th>상위 코드</th>
	<th>코드 이름</th>
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
			<label>코드번호 :</label>
			<input id="cdno" name="cdno" readonly>
		</div>
		<div>
			<label>코드레벨 :</label>
			<input id="cdlvl" name="cdlvl" readonly>
		</div>
		<div>
			<label>상위코드 :</label>
			<input id="upcd" name="upcd" readonly>
		</div>
		<div>
			<label>코드이름 :</label>
			<input id="cdname" name="cdname" readonly>
		</div>
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
