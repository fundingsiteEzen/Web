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
            float: right;
            margin-bottom: 10px;
            margin-top: -10px;
        }
    </style>
</head>

<body>

<jsp:include page="../menu/navigation.jsp" flush="false" />

<div class="container">
	<form class="form-horizontal" name="cr" method="POST">
		
		<!-- 프로젝트 제목, 창작자 이름(자동) -->
		<div class="form-group">
		  <label>프로젝트 제목</label>
		  <input type="text" class="form-control" id="p_name" name="p_name" placeholder="프로젝트 제목" maxlength="50" required>
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
			<input type="file" id="file1" name="p_slide" multiple />
            <label class="img_button" for="file1">+ 추가</label>
			<div class="img_add"></div>
		</div>
		
		<!-- 프로젝트 소개글 -->
		<div class="form-group">
			<label for="comment">프로젝트 소개글</label>
			<!-- <textarea class="form-control" rows="5" id="p_content" name="p_content" placeholder="자신의 프로젝트를 소개하세요." maxlength="100"></textarea>  -->
			<textarea class="summernote" name="p_content" required></textarea>    
		</div>
		
		<!-- 리워드 목록. 나중에 주석해제 -->
		<div id="reward">
            <label>리워드 구성</label>
            <div class="img_button right" onclick="addReward()">+ 리워드 추가하기</div>
            <div class="form-group">
                <textarea class="form-control" name="list[0].r_content"></textarea>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">최소 후원 금액</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="r_price" name="list[0].r_price">
                </div>
                <label class="control-label col-sm-2">준비 수량</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="r_price" name="list[0].r_count">
                </div>
                <input type="hidden" name="list[0].r_seq" value="1">
            </div>
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


<script>
	function addFile(images) {
		alert("작동");
		
		// form 객체를 만들고 files를 추가함
		var files = images.files[0];
		
		var formData = new FormData();
		formData.append("file", files);
		alert(files.name);
		
		alert("ajax 실행준비");
		// processData와 contentType을 false로 해서 보내주어야함
		$.ajax({
			type: "post",
			url: "/crpage/file",
			data: formData,
			processData:	false,
			contentType:	false,
			success: function(request, status, error) {
				alert("성공");
				alert(request); // 이거 저장된 파일 이름.. !!
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		
	}
</script>

<script>
	//이미지 미리보기
	var sel_file;
	
	$(document).ready(function() {
	    $("#file1").on("change", handleImgFileSelect);
	});
	
    var index=1;
	function handleImgFileSelect(e) {
		if(index >4) {
            alert("이미지는 4장까지만 첨부 가능합니다");
            return;
	    }
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
	            var str = "<img class='img add"+index+"'>";
		        $(".img_add").append(str);
	        	$('.add'+index).attr("src", e.target.result);
	            index++;
	            console.log($(".img_add").children(index));
	        	}
	        	reader.readAsDataURL(f);
	
		});
	}
</script>
<script>
	// 이미지 등록
	function fn_submit(){
	    
	    var form = new FormData();
	    form.append( "file1", $("#file1")[0].files[0]);
	    
	     $.ajax({
	         url : "/result"
	       , type : "POST"
	       , processData : false
	       , contentType : false
	       , data : form
	       , success:function(response) {
	           alert("성공하였습니다.");
	           console.log(response);
	       }
	       ,error: function (jqXHR) 
	       { 
	    	   alert("오류");
	           alert(jqXHR.responseText); 
	       }
	   });
	}
</script>

<script>
	// 리워드 추가
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