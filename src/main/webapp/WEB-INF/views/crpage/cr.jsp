<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>창작 등록 페이지</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- crpage.js -->
	<script src="${contextPath}/../../resources/js/crpage.js"></script>
		
</head>

<body>

<jsp:include page="../menu/navigation.jsp" flush="false" />

<div class="container">
	<form class="form-horizontal" name="cr" method="POST">
		
		<!-- 프로젝트 제목, 창작자 이름(자동) -->
		<div class="form-group">
		  <label>프로젝트 제목</label>
		  <input type="text" class="form-control" id="p_name" name="p_name" placeholder="프로젝트 제목" maxlength="50">
		</div>
		<div class="form-group">	<!-- 자동 -->
		  <label>창작자</label>
		  <!-- ******** 세션에서 창작자 아이디 가져오기 **********8-->
		  <input type="text" class="form-control" id="id" name="id" value="user1" readonly>
		</div>
		
		<!-- 카테고리 선택(선택하면 자동) -->
		<div class="form-group">
			<label>카테고리</label><br/>
			<label class="radio-inline"><input type="radio" name="p_category" value="spring" checked>spring</label>
			<label class="radio-inline"><input type="radio" name="p_category" value="summer">summer</label>
			<label class="radio-inline"><input type="radio" name="p_category" value="autumn">autumn</label>
			<label class="radio-inline"><input type="radio" name="p_category" value="winter">winter</label>
		</div>
		
		<!-- 프로젝트 시작, 종료일 (자동) -->
		<div class="form-group">
			<label>프로젝트 시작날짜</label><br/>
			<!-- *****************현재날짜로 입력받게 할 예정*************** -->
		 	<!-- <input type="date" id="p_beginDate" name="p_beginDate"> -->
			
			<label>프로젝트 종료날짜</label>
			<input type="date" id="p_endDate" name="p_endDate">
		</div>
		
		<!-- 결제 예정일 -->
		<div class="form-group">
			<label>결제 예정일</label>
			<input type="date" id="p_payDate" name="p_payDate">
		</div>
		
		<!-- 프로젝트 소개글 -->
		<div class="form-group">
			 <label for="comment">프로젝트 소개글</label>
			 <textarea class="form-control" rows="5" id="p_content" name="p_content" placeholder="자신의 프로젝트를 소개하세요." maxlength="100"></textarea>
		</div>
		
		<!-- 썸네일 사진1개
		<div class="form-group">
			<label>썸네일 사진</label><br/>
			<div class="col-sm-8">
				<input type="file"   class="btn btn-warning" name="file"/>
			</div>
		</div>
		
		상세페이지 사진3개
		<div class="form-group">
			<label>상세페이지 사진1</label><br/>
			<div class="col-sm-8">
				<input type="file"   class="btn btn-warning" name="file"/>
			</div>
		</div>
		<div class="form-group">
			<label>상세페이지 사진2</label><br/>
			<div class="col-sm-8">
				<input type="file"   class="btn btn-warning" name="file"/>
			</div>
		</div>
		<div class="form-group">
			<label>상세페이지 사진3</label><br/>
			<div class="col-sm-8">
				<input type="file"   class="btn btn-warning" name="file"/>
			</div>
		</div> -->
		
		<!-- 목표금액 -->
		<div class="form-group">
			<label>목표금액</label>
		  <input type="text" class="form-control" id="p_goal" name="p_goal">원
		</div>
		
		<!-- 다시입력, 등록 버튼 -->
		<div class="form-group">
			<div class="col-sm-offset-4 left">
				<button type="reset"  class="btn btn-warning">다시 입력</button>
				<button type="submit" class="btn btn-primary">펀딩 등록</button>
			</div>
		</div>
	</form>
</div>

</body>
</html>