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

	<!-- summernote -->	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
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
		<div class="form-group">
		  <label>창작자</label>
		  <!-- <input type="text" class="form-control" id="id" name="id" value="${userID}" readonly>  세션에서 가져온 아이디. 로그인 기능 끝나고 풀기 -->
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

		<!-- 썸네일 사진, 슬라이드 이미지 첨부하기 (다중첨부 가능하게)  -->
		<div class="form-group">
			<label>썸네일 사진</label><br/>
			<div class="col-sm-8">
				<input type="file" class="btn btn-warning" onchange="addFile(this);" name="p_img" multiple />
			</div>
		</div>
		
		<!-- 프로젝트 소개글 -->
		<div class="form-group">
			<label for="comment">프로젝트 소개글</label>
			<!-- <textarea class="form-control" rows="5" id="p_content" name="p_content" placeholder="자신의 프로젝트를 소개하세요." maxlength="100"></textarea>  -->
			<textarea class="summernote" name="p_content"></textarea>    
		</div>
		
		<!-- 목표금액 -->
		<div class="form-group">
			<label>목표금액</label>
		  <input type="text" class="form-control" id="p_goal" name="p_goal" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원
		</div>
		
		<!-- 리워드 목록. 나중에 주석해제
		<div class="form-group" id="reward">
			<label>r_price</label>
		  	<input type="text" class="form-control" id="r_price" name="list[0].r_price">
		</div>
			<button type="button" onclick="addReward()">리워드 추가하기</button>
		-->
		
		<!-- 다시입력, 등록 버튼 -->
		<div class="form-group">
			<div class="col-sm-offset-4 left">
				<button type="reset"  class="btn btn-warning">다시 입력</button>
				<button type="submit" class="btn btn-primary">펀딩 등록</button>
			</div>
		</div>
	</form>
</div>


<script>
	function addFile(images) {
		alert("작동");
		
		// form 객체를 만들고 files를 추가함
		var files = images.files[0];
		
		var formData = new FormData();
		formData.append("file", files);
		alert(files.name);
		var id = $("#id").val();
		alert(id);
		
		alert("ajax 실행준비");
		// processData와 contentType을 false로 해서 보내주어야함
		$.ajax({
			type: "post",
			url: "/crpage/file",
			data: {formData:formData, id:id},
			dataType:		"json",
			processData:	false,
			contentType:	false,
			success: function(data, status, req) {
				alert("성공");
			},
			error: function(data) {alert('문제가 발생했습니다');}
		});
		alert("ajax 끝");
		
	}
</script>
<script>
	var index = 1;
	function addReward() {
		var str =
			"<label>추가됨</label>";
			str+= "<input type='text' class='form-control' id='r_price' name='list[" + index + "].r_price'>";
		$("#reward").append(str);
		index++;
	};
</script>
<script>
// 써머노트
	$('.summernote').summernote({
		  height: 300,
		  lang: "ko-KR"
	});
</script>

</body>
</html>