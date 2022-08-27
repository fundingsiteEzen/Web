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
	
	.wrap {
		background-image: url(${contextPath}/images/MAIN_img/winter.png);
	    background-attachment: fixed; }
	.main {background-color: #fff;}
	.add_button {padding-top: 60px;}
	.List_btn {
		box-sizing: border-box;
		border: 1px solid #ccc;
		height: 40px;
	}
	.back_btn {
		box-sizing: border-box;
		border: 1px solid #ccc;
		height: 40px;
		margin-left: 10px;
	}
	.navigation {
		margin-top: 100px;
	}
	.item {
		width:100%;
		object-fit: cover;
	}
	.carousel-control.left, .carousel-control.right {
    	background-image: none
	}
  
  </style>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
	<!-- container 시작 -->
	<div class="container-fluid wrap">
        <div class="container main">
        
			<!-- 메인 div 시작 -->
			<div class="row">
				<div class="col-sm-8">
					<!-- 이미지 슬라이더 -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- 인디케이터 -->
						<ol class="carousel-indicators">
							<c:forEach var="i" begin="0" end="${project.p_imgCnt-1}" varStatus="status">
								<c:choose>
								<c:when test="${status.index == 0}">
								<li data-target="#myCarousel" data-slide-to="${status.index}" class="active"></li>
								</c:when>
								<c:when test="${status.index > 0}">
								<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
								</c:when>
								</c:choose>
							</c:forEach>
						</ol>
						<!-- 슬라이드 wrap -->
						<div class="carousel-inner">
							<c:forEach items="${slide}" var="list" varStatus="status">
								<c:choose>
								<c:when test="${status.index == 0}">
								<div class="item active">
									<img class="img-responseve center-block" src="${contextPath}/images/thumnail/${list}"/>
								</div>
								</c:when>
								<c:when test="${status.index > 0}">
								<div class="item">
									<img class="img-responseve center-block" src="${contextPath}/images/thumnail/${list}"/>
								</div>
								</c:when>
								</c:choose>
							</c:forEach>
						</div>
						
						<!-- 좌우 버튼 -->
						<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>
				<div class="col-sm-4 info">
					<h3>D-${dayCount}</h3>
					<h1>${project.p_name}</h1>
					<div align="right">
						<h2>${percent}%</h2>
					</div>
					<div class="progress" style="height: 10px;" >
						<div class="progress-bar bg-danger" role="progressbar" style="width: ${percent}%" aria-valuenow="${percent}" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="row">
						<div class="col-sm-6" align="left">
							<h6>모인 금액 ${project.p_total}원</h6>
						</div>
						<div class="col-sm-6" align="right">
							<h6>목표 ${project.p_goal} 원</h6>
						</div>
						<div class="col-sm-12">
							<span>펀딩 기간 ${project.p_beginDate} ~ ${project.p_endDate}</span><br>
							<span>결제예정일 ${project.p_payDate}</span><br>
							<div class="add_button">
								<!-- 리스트 추가버튼 -->
								<button type="button" class="col-sm-4 List_btn" onclick="addList(${project.p_seq})">+</button>
								<!-- 후원버튼 -->
								<button type="button" class="col-sm-7 back_btn">back</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--소개 시작-->
			<div class="row">
				<div class="col-sm-12 navigation" align="center">
					<a>프로젝트 계획</a>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<p>${project.p_content}</p>
					<p>~~~ 프로젝트 소개글이 뜨는 부분 ~~~</p>
					<p>${project.p_backer} 명 후원중</p>
					<p>${backResult}</p>
				</div>
			</div>
        </div>
    </div>
    
	<!-- 리워드 창 -->
	<jsp:include page="reward.jsp" flush="false" />
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
  	
  	<!-- 커스텀 스크립트 -->
  	<script>
  		// 관심목록 버튼
  		function addList(p_seq) {
  			$.ajax({
  				type: "POST",
  				url: "/subPage/addLike.do",
  				data: {p_seq:p_seq},
  				success: function(data) {
  					// 이때 받아오는 data는 서브 컨트롤러(2)에서 반환한 값
  					if(data == 'F') {
  						alert("로그인이 필요한 서비스입니다");
  						location.href = "/login.do";
  					}
  					if(data == 'Y'){
  						location.href = "redirect:/subPage/detail";
  						alert("관심 목록에 추가되었습니다");
  					}
  					if(data == 'D') {
  						alert("이미 후원중인 프로젝트입니다");
  					}
  				},
  				error: function(data) {alert('문제가 발생했습니다');}
  			});
  		}
  		// 후원하기 버튼
  		function back_this(r_seq) {
  			var formsubmitSerialArray = $('#form'+r_seq).serializeArray();
  			var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));
  			//var formsubmit = $("#form1").serialize();
  			if(confirm("후원하시겠습니까 ?")){
  				$.ajax({
  	  				type: "POST",
  	  				url: "/subPage/back.do",
	  	  			contentType: 'application/json; charset=utf-8',
  	  				data: formsubmit,
  	  				success: function(data) {
  	  					// 이때 받아오는 data는 서브 컨트롤러(2)에서 반환한 값
  	  					if(data == 'F') {
  	  						alert("로그인이 필요한 서비스입니다");
  	  						location.href = "/login.do";
  	  					}
  	  					if(data == 'Y'){
  	  						location.href = "redirect:/subPage/detail";
  	  						alert("후원이 완료되었습니다");
  	  					}
  	  					if(data == 'D') {
  	  						alert("이미 후원중인 프로젝트입니다");
  	  					}
  	  				},
  	  				error: function(request, status, error) {alert("문제가 발생했습니다");}
  	  			});
  			}
  		}
  		function objectifyForm(formArray) {//serializeArray data function
  			var returnArray = {};
  			for (var i = 0; i < formArray.length; i++) {
  				returnArray[formArray[i]['name']] = formArray[i]['value'];
  			}
  			return returnArray;
  		}
  		// 후원하면 BACK 버튼 생김
  		function addSubmit(r_seq) {
  			$(".BACK").attr("disabled", false);
  			$('#addMondy'+r_seq).focus();
  		}
  	</script>
  	<script>
  		// 모달창
  		$(".back_btn").click(function(){
	        $(".modal").fadeIn(200);
	    });
		$(document).mouseup(function (e){
		if($(".modal").has(e.target).length === 0){
			$(".modal").fadeOut(200);
			}
		});
  	</script>
  	
</body>
</html>
