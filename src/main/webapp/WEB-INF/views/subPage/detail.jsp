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
		
  .story {
  	height: 2000px;
  }
  .story li { width: 100%;}
  
  /* 기존 style 스크롤바이 */
  .scroll {
  	top: 50px;
  	position:sticky;
  }
  .scrollul {
  	text-align: center;
  }
  .scrollul li {
	line-height: 60px;
	background-color: #ccc;
  }
  .reward { height: 2000px; }
  .reward_each {
	top: 50px;
	position: sticky; }

  div.col-sm-7 div {
    height: 1000px;
    font-size: 28px;
  }
  #section1, #section2, #section3  {color: #fff; background-color: #ccc;}
  
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
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<!-- 슬라이드 wrap -->
						<div class="carousel-inner">
							<div class="item active">
								<img class="img-responseve center-block" src="${contextPath}/images/SUB/detail01.jpg" alt="img01" width="100%" height="350px"/>
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img class="img-responseve center-block" src="${contextPath}/images/SUB/detail02.jpg" alt="img02" width="100%" height="350px"/>
								<div class="carousel-caption"><h2></h2></div>
							</div>
							<div class="item">
								<img class="img-responseve center-block" src="${contextPath}/images/SUB/detail03.jpg" alt="img03" width="100%" height="350px"/>
								<div class="carousel-caption"><h2></h2></div>
							</div>
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
								<button type="button" class="col-sm-4 List_btn" onclick="addList(${project.p_seq}, 'Y')">+</button>
								<!-- 후원버튼 -->
								<!--
								<button type="button" class="col-sm-7 back_btn" onclick="BACK(${project.p_seq}, 'N')">back</button>
								 -->
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
  		function insert(p_seq, is_like, mode) {
  			$.ajax({
  				type: "POST",
  				url: "/subPage/back.do",
  				data: {p_seq:p_seq, is_like:is_like},
  				success: function(data) {
  					// 이때 받아오는 data는 서브 컨트롤러(2)에서 반환한 값
  					if(data == 'F') {
  						alert("로그인이 필요한 서비스입니다");
  						location.href = "/login.do";
  					}
  					if(data == 'Y'){
  						location.href = "redirect:/subPage/detail";
  						if(mode == 1) {alert("후원이 완료되었습니다");}
  						else {alert("관심 목록에 추가되었습니다");}
  					}
  					if(data == 'D') {
  						alert("이미 후원중인 프로젝트입니다");
  					}
  				},
  				error: function(data) {alert('문제가 발생했습니다');}
  			});
  		}
  		// 후원하기 버튼
  		function BACK(p_seq, is_like) {
  			if(confirm("후원하시겠습니까 ?")){
	  			insert(p_seq, is_like, 1);
  			}
  		}
  		// 관심목록 버튼
  		function addList(p_seq, is_like) {
  			insert(p_seq, is_like, 2);
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
