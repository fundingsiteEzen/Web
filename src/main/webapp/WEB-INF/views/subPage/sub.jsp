<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		
</head>

<style>

@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@300;400;500&display=swap');

	* {list-style: none;
		padding: 0;
		margin: 0 auto;
		font-family: 'Hahmlet', serif;}
	
	.row {margin:0;}
	.wrap {
		background-image: url(${contextPath}/images/MAIN_img/${project.p_category}.jpg);
	    background-attachment: fixed; }
	.main {background-color: #fff;
		padding-top: 30px;
		padding-bottom: 80px;}
	h2 {margin-bottom: 40px;}
	
	.form-box {
		box-sizing: border-box;
		border: 1px solid #ccc;
		border-radius: 10px;
        margin: 15px 20px;
        transition: 0.2s ease-out;
        padding-top: 20px;
        padding-right: 30px;
        padding-left: 30px;
	}
    .form-box:hover {
        transform: scale(1.08);
    }
    .form-form {
        transform: scale(1.08);
    }
	.btn {margin: 10px 0;}
	input[type=text] {
		border: 1px solid #ccc;
	  	border-radius: 40px;
		height: 30px;
		text-align: center;
	}
  
  </style>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
	<!-- 알럿창 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- container 시작 -->
	<div class="container-fluid wrap">
        <div class="container main">
        	<div align="center">
        	<h2>리워드를 선택하세요</h2>
        	</div>
			<!--소개 시작-->
			<c:forEach items="${rewardList}" var="list" varStatus="status">
			<div class="row">
                <div class="col-sm-2"></div>
				<div class="form-box col-sm-8" align="center" id="div${list.r_seq}" onclick="addSubmit(${list.r_seq})">
			        <form action="/subPage/back.do" method="post" id="form${list.r_seq}">
			            <div align="left">선택 ${list.r_seq}</div>
			            <div align="left">${list.r_count}개 남음</div><br>
			            <span style="font-size: 1.2em; white-space:pre;">▷ ${list.r_content}</span><br>
			            <div align="right">최소 후원금액</div>
			            <div align="right" style="font-size: 1.5em;">${list.r_price} 원</div>
						<span class="BACK${list.r_seq} add">추가후원금 (선택)&nbsp;</span>
			            <input type="text" name="r_addMoney" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="addMondy${list.r_seq}"><br>
						<span class="BACK${list.r_seq} add" style="font-size: 0.5em;">더 후원하시면 프로젝트 성사가 앞당겨집니다</span>
			            <input type="hidden" name="p_seq" value="${project.p_seq}">
			            <input type="hidden" name="r_seq" value="${list.r_seq}">
			            <input type="hidden" name="r_price" value="${list.r_price}">
			            <input type="hidden" name="r_count" value="${list.r_count}"><br>
                        <button type="button" class="btn BACK${list.r_seq}" onclick="back_this(${list.r_seq})" disabled>후원하기</button>
			        </form>
				</div>
            </div>
			</c:forEach>
        </div>
    </div>
    
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
  	
  	<!-- 커스텀 스크립트 -->
  	<script>
  		// 후원하기 버튼
  		function back_this(r_seq) {
  			var formsubmitSerialArray = $('#form'+r_seq).serializeArray();
  			var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));
  			//var formsubmit = $("#form1").serialize();
  			
  			// confirm창 보이기
  			Swal.fire({
  			   title: '후원하시겠습니까 ?',
  			   text: '결제는 나중에 이루어집니다.',
  			   icon: 'info',
  			   
  			   showCancelButton: true, // cancel버튼을 표시함
  			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
  			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
  			   confirmButtonText: '진행', // confirm 버튼 텍스트 지정
  			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
  			   
  			}).then(result => { // 확인 or 취소 버튼을 눌렀을 경우 후속 동작
  			   if (result.isConfirmed) { // cofirm 창에서 확인을 눌렀을 경우
	  				 $.ajax({
	   	  				type: "POST",
	   	  				url: "/subPage/back.do",
	 	  	  			contentType: 'application/json; charset=utf-8',
	   	  				data: formsubmit,
	   	  				success: function(data) {
	   	  					// 이때 받아오는 data는 서브 컨트롤러(2)에서 반환한 값
	   	  					if(data == 'F') {
	   	  					Swal.fire({
	     						  icon: 'warning',
	     						  title: '로그인이 필요한 서비스입니다.',
	     						  text: '로그인 화면으로 이동합니다.',
	     						}).then((value) => {
	     	  						if (value) {
	     	  							location.href = "/login.do";
	     	  						}
	     	  					});
	   	  					}
	   	  					if(data == 'Y'){
	   	  						Swal.fire({
	     						  icon: 'success',
	     						  title: '후원이 완료되었습니다',
	     						  showConfirmButton: false,
	     						  timer: 1500
	     						})
	     						setTimeout("location.href='/myPage/myPage'",1500);
	   	  					}
	   	  					if(data == 'D') {
	   	  					Swal.fire({
	     						  icon: 'error',
	     						  title: '이미 후원중인 프로젝트입니다',
	     						})
	   	  					}
	   	  				},
	   	  				error: function(request, status, error) {Swal.fire('문제가 발생했습니다','question');}
	   	  			}); // -ajax 끝
				} // if문 끝
  			});
  		}
  		function objectifyForm(formArray) {//serializeArray data function
  			var returnArray = {};
  			for (var i = 0; i < formArray.length; i++) {
  				returnArray[formArray[i]['name']] = formArray[i]['value'];
  			}
  			return returnArray;
  		}
  	</script>
  	<script>
	// 후원하면 BACK 버튼 생김
	$(document).ready(function(){
		$(".btn").hide();
		$(".add").hide();
		$("input[type=text]").hide();
    });
	function addSubmit(r_seq) {
		if ($(".form-box").is(".form-form")) {
			$(".form-box").removeClass("form-form");
			$(".btn").hide();
			$(".add").hide();
			$("input[type=text]").hide();
		}
        $("#div"+r_seq).addClass("form-form");
		$(".BACK"+r_seq).attr("disabled", false);
		$(".BACK"+r_seq).fadeIn(300);
		$("#addMondy"+r_seq).fadeIn(500);
	}
  	</script>
  	
</body>
</html>
