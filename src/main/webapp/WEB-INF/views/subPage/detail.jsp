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
	padding-top: 30px;}
	.back_info {padding-top: 20px;}
	.add_button {padding-top: 20px;}
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
		margin-bottom: 50px;
	}
	.navigation h3 {
		margin-top: -0.5em;
	}
	.item {
		width:100%;
		object-fit: cover;
		overflow: hidden;
	}
	.itemImg {
		object-fit: cover;
		overflow:hidden;
		width:100%; 
		min-height: 400px;
		max-height: 400px;
	}
	.carousel-control.left, .carousel-control.right {
    	background-image: none
	}
	.line {
		border-bottom: 2px solid #ccc;
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
									<img class="img-responseve center-block itemImg" src="${contextPath}/images/SUB/${list}"/>
								</div>
								</c:when>
								<c:when test="${status.index > 0}">
								<div class="item">
									<img class="img-responseve center-block itemImg" src="${contextPath}/images/SUB/${list}" />
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
						<div class="col-sm-12 back_info">
							<span>펀딩 기간 ${project.p_beginDate} ~ ${project.p_endDate}</span><br>
							<span>결제 예정일 ${project.p_payDate}</span><br>
							<div class="add_button">
								<!-- 리스트 추가버튼 -->
								<button type="button" class="col-sm-4 List_btn" onclick="addList(${project.p_seq})"><span class="glyphicon glyphicon-heart-empty"></span></button>
								<!-- 후원버튼 -->
								<button type="button" class="col-sm-7 back_btn">후원하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--소개 시작-->
			<div class="row">
				<div class="col-sm-12 navigation" align="center">
					<div class="col-sm-1"></div>
					<div class="col-sm-4 line"></div>
					<div class="col-sm-2"><h3>프로젝트 계획</h3></div>
					<div class="col-sm-4 line"></div>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<p>${project.p_content}</p>
				</div>
				<!-- 
				<div class="col-sm-12 navigation" align="center">
					<div class="col-sm-1"></div>
					<div class="col-sm-4 line"></div>
					<div class="col-sm-2"><h3>후원자 목록</h3></div>
					<div class="col-sm-4 line"></div>
					<p>${project.p_backer} 명 후원중</p>
				</div>
				 -->
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
  						location.href = "redirect:/subPage/detail";
  						Swal.fire({
  						  icon: 'success',
  						  title: '관심 목록에 추가되었습니다',
  						  showConfirmButton: false,
  						  timer: 1500
  						})
  					}
  					if(data == 'D') {
  						Swal.fire({
  						  icon: 'error',
  						  title: '이미 관심 프로젝트입니다',
  						})
  					}
  				},
  				error: function(data) {	Swal.fire({
					  icon: 'error',
						  title: '문제가 발생했습니다',
						});}
  			});
  		}
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
	   	  				error: function(request, status, error) {Swal.fire({title:'문제가 발생했습니다', icon:'question'});}
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
  		// 리워드 모달창
  		$(".back_btn").click(function(){
	        $(".modal").fadeIn(200);
	    });
		$(document).mouseup(function (e){
		if($(".modal").has(e.target).length === 0){
			$(".modal").fadeOut(200);
			}
		});
  	</script>
  	
  	<!-- TOP BTN[S] -->
	<a id="MOVE_TOP_BTN" href="#"><img src="${contextPath}/images/simple-scroll-up-button1.png" style="width:25px; height:25px; border-radius: 15px;" title="위로가기"></a>
	<style>
	a#MOVE_TOP_BTN {
		position: fixed;
		right: 2%;
		bottom: 50px;
		display: none;
		z-index: 999;
	}
	</style>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
	</script>
<!-- TOP BTN[E] -->
  	
</body>
</html>
