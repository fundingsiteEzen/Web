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
	

	<!-- crpage.js -->
	<script src="${contextPath}/../../resources/js/crpage.js"></script>
		
	
	<style>
        .img_add {
            overflow: auto;
            white-space: nowrap;
            width: 100%;
        }
        .img {
            padding-right: 10px;
            height: 200px;
            width: 300px;
            object-fit: cover;
        }
        #file1 {
            display: none;
        }
        .img_button {
            padding: 10px 20px;
            color: #fff;
            background-color: #999999;
            cursor: pointer;
        }
        .right {
			width: 200px;
        }
    </style>
    
    <!-- 로그인 정보가 없으면 들어갈 수 없게 함 -->
	<%
	if(session.getAttribute("isLogin") == null || session.getAttribute("isLogin").equals("")) {
		response.sendRedirect("/login.do");
	}
	%>
  
</head>

<body>

<jsp:include page="../menu/navigation.jsp" flush="false" />

<div class="container">
	<form class="form-horizontal" name="cr" method="POST" onsubmit="addFile()">
		
		<!-- 프로젝트 제목, 창작자 이름(자동) -->
		<div class="form-group">
		  <label>프로젝트 제목</label>
		  <input type="text" class="form-control" id="p_name" name="p_name" placeholder="프로젝트 제목" maxlength="50" required>
		</div>
		<div class="form-group">
		  <label>창작자</label>
		  <input type="hidden" class="form-control" id="id" name="id" value="${userID}" readonly>  <!-- 세션에서 가져온 아이디. 로그인 기능 끝나고 주석 해제 -->
		  <h3>닉네임</h3>
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
			<input type="date" id="p_endDate" name="p_endDate" required>
		</div>
		
		<!-- 결제 예정일 -->
		<div class="form-group">
			<label>결제 예정일</label>
			<input type="date" id="p_payDate" name="p_payDate" required>
		</div>
		
		<!-- 목표금액 -->
		<div class="form-group">
			<label>목표금액</label>
		  <input type="text" class="form-control" id="p_goal" name="p_goal" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
		</div>

		<!-- 썸네일 사진, 슬라이드 이미지 첨부하기 (다중첨부 가능하게)  -->
		<div class="form-group">
			<label>이미지 첨부</label><br/>
			<input type="file" id="file1" name="p_slide" multiple required/>
            <label class="img_button" for="file1">+ 추가</label>
			<div class="img_add"></div>
		</div>
		
		<!-- 프로젝트 소개글 -->
		<div class="form-group">
			<label for="comment">프로젝트 소개글</label>
			<textarea class="summernote" name="p_content" required></textarea>    
		</div>
		
		<!-- 리워드 목록 -->
		<div id="reward">
            <label>리워드 구성</label>
            <div class="row">
				<div class="col-sm-6">
					<textarea class="form-control" name="list[0].r_content" required></textarea>
				</div>
				<div class="form-group col-sm-6">
					<label class="control-label col-sm-4">최소 후원 금액</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="list[0].r_price">
					</div>
					<label class="control-label col-sm-4">준비 수량</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="list[0].r_count">
					</div>
					<input type="hidden" name="list[0].r_seq" value="1">
				</div>
            </div>
		</div>
		<div class="row" align="center">
			<div class="img_button right" onclick="addReward()">+ 리워드 추가하기</div>
		</div>
		
		<!-- 다시입력, 등록 버튼 -->
		<div class="form-group" style="margin-top:40px">
			<div align="center">
				<button type="reset"  class="btn btn-primary">다시 입력</button>
				<button type="submit" class="btn btn-success" onclick="fn_submit()">펀딩 등록</button>
			</div>
		</div>
	</form>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
</div>


<script>
	//이미지 미리보기
	var sel_file;
	var content_files = new Array();
	
	$(document).ready(function() {
	    $("#file1").on("change", handleImgFileSelect);
	});
	
	var idx = 0;
	var formData = new FormData();
	function handleImgFileSelect(e) {
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	    
	    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	    
	    filesArr.forEach(function(f) {
	        if (!f.type.match(reg)) {
	            alert("이미지만 첨부 가능합니다.");
	            return;
	        }
	        
	        sel_file = f;
	        
	        var reader = new FileReader();
	        reader.onload = function(e) {
	        	content_files.push(f);
	        	formData.append("file", content_files[idx]);
	            var str = "<img class='img add"+idx+"'>";
		        $(".img_add").append(str);
	        	$('.add'+idx).attr("src", e.target.result);
	        	idx++;
	        	}
	        	reader.readAsDataURL(f);
		});
		console.log(content_files);
	}	
	function addFile() {
		// processData와 contentType을 false로 해서 보내주어야함
		$.ajax({
			type: "post",
			url: "/crpage/file",
			enctype: "multipart/form-data",
			data: formData,
			processData:	false,
			contentType:	false,
			success: function(request, status, error) {
				alert("성공");
				alert(request); // 이거 저장된 파일 이름.. !!
			},
			error: function(request, status, error) {
				// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		
	}
	// 입력 값 체크
	function checkInfo() {
		if(idx == 0) {
			alert("이미지를 한 장 이상 첨부하세요");
		}
		var text = $(".summernote").val();
		if(text == "") {
			alert("프로젝트 계획을 입력하세요");
		}
	}
</script>
<script>
	// 리워드 추가
	var index = 1;
	function addReward() {
		var str = "<label>리워드 구성</label>";
			str += "<div class='row'>";
			str += "<div class='col-sm-6'>";
			str += "<textarea class='form-control' name='list[" + index + "].r_content' required></textarea></div>";
			str += "<div class='form-group col-sm-6'>";
			str += "<label class='control-label col-sm-4'>최소 후원 금액</label><div class='col-sm-8'>";
			str += "<input type='text' class='form-control' name='list[" + index + "].r_price'"
			str += "oninput='this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');' required></div>";
			str += "<label class='control-label col-sm-4'>준비 수량</label><div class='col-sm-8'>";
			str += "<input type='text' class='form-control' name='list[" + index + "].r_count'"
			str += "oninput='this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');' required>";
			str += "</div><input type='hidden' name='list[" + index + "].r_seq' value='" +(index+1) + "'></div>";
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