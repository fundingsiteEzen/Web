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
	* {list-style: none;
		padding: 0;
		margin: 0 auto;}
  body {
    position: relative;
  }
  ul.nav-pills {
    top: 20px;
    position: sticky;
  }
  div.col-lg-7 div {
    height: 250px;
    font-size: 28px;
  }
  #section1 {color: #fff; background-color: #ccc;}
  #section2 {color: #fff; background-color: #ccc;}
  #section3 {color: #fff; background-color: #ccc;}
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
      margin-left: 150px;
    }
  }
  </style>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

	<!-- 네비게이션 -->
	<!--<jsp:include page="../menu/navigation.jsp" flush="false" />-->
	
	
	<div class="container">
		<!-- 메인정보 div -->
		<div class="row">
			<!-- 프로젝트 이름 부분 -->
			<div>
				<h1 align="center">프로젝트명</h1>
			</div>
			
			<!-- 메인 정보 section -->
			<section class="work d-flex align-items-center py-5" >
		        <div class="container-fluid text-light">
		            <div class="row" >
		            	<!-- 이미지 슬라이더 -->
		                <div class="col-lg-8 d-flex align-items-center" data-aos="fade-right" style="border: 1px solid #333">
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
									<img class="img-responseve center-block" src="${contextPath}/resources/images/***.jpg" alt="img01" width="100%" height="350px"/>
									<div class="carousel-caption"><h2>캡션1</h2></div>
								</div>
								<div class="item">
									<img class="img-responseve center-block" src="${contextPath}/resources/images/***.jpg" alt="img02" width="100%" height="350px"/>
									<div class="carousel-caption"><h2>캡션2</h2></div>
								</div>
								<div class="item">
									<img class="img-responseve center-block" src="${contextPath}/resources/images/***.jpg" alt="img03" width="100%" height="350px"/>
									<div class="carousel-caption"><h2>캡션3</h2></div>
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
		                    <!-- <img class="img-fluid" src="#" alt="work">  원래 있던 img 태그 -->
		                </div>
		                
		                <!-- 상세소개란 -->
		                <div class="col-lg-4 d-flex align-items-center px-4 py-3" data-aos="">
		                    <div class="row" style="border: 1px solid #333">
		                        <div class="container" data-aos="fade-up">
		                            <div class="row g-5">
		                                <div class="col-6 text-start" >
		                                    <i class="fas fa-briefcase fa-2x text-start"></i>
		                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="1258" data-purecounter-duration="3">작성중</h2>
		                                    <p>모인 금액</p>
		                                </div>
		                                <div class="col-6" >
		                                    <i class="fas fa-award fa-2x"></i>
		                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="150" data-purecounter-duration="3">${dayCount} 일</h2>
		                                    <p>남은시간</p>
		                                </div>
		                                <div class="col-6">
		                                    <i class="fas fa-users fa-2x"></i>
		                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="1255" data-purecounter-duration="3">${project.p_backer} 명</h2>
		                                    <p>후원자</p>
		                                </div>
										<div class="col-6">
											<span>목표금액 ${project.p_goal} 원</span><br>
											<span>펀딩 기간 ${project.p_beginDate} ~ ${project.p_endDate}</span><br>
											<span>결제예정일 ${project.p_payDate}</span><br>
											<button class="btn btn-primary">리스트에 추가</button>
											<button class="btn btn-info">후원하기</button>
										</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		</div>
		
		<!-- 소개 div -->
		<div class="row">
			<div> <!-- 미니 네비게이션 -->
				<div style="border: 1px solid #333">
					<nav>
						<a>프로젝트 계획</a>
						<a>커뮤니티</a>
						<a>후원자 목록</a>
					</nav>
				</div>
			</div> 
			<section> <!-- 소개란 & 리워드 부분 -->
				<!-- 소개란 -->
				<div class="row">
					<!-- scrollby 네비-->
					<nav class="col-sm-1" id="myScrollspy" style="border: 1px solid #333">
				      <ul class="nav nav-pills nav-stacked">
				        <li class="active"><a href="#section1">story</a></li>
				        <li><a href="#section2">risks</a></li>
				        <li><a href="#section3">Section 3</a></li>
				      </ul>
				    </nav>
				    <div class="col-lg-7" style="border: 1px solid #333">
				      <div id="section1">    
				        <h1>story</h1>
				        <p>소개글</p>
				      </div>
				      <div id="section2"> 
				        <h1>story</h1>
				        <p>소개글</p>
				      </div>        
				      <div id="section3">         
				        <h1>story</h1>
				        <p>소개글</p>
				      </div>
				    </div>
					<!-- 리워드 선택란 -->
					<div class="col-lg-4" style="border: 1px solid #333">
						<!-- 판매자 정보란 -->
						<div align="center">
							<button>창작자 소개</button>
						</div>
						<!-- 리워드 -->
						<div style="border: 1px solid #333">
							<ol>
								<li>선택1
									<div>
										<h3>1000원</h3>
										<button>진행하기</button>
									</div>
								</li>
								<li>선택2
									<div>
										<h3>2000원</h3>
										<button>진행하기</button>
									</div>
								</li>
								<li>선택3
									<div>
										<h3>3000원</h3>
										<button>진행하기</button>
									</div>
								</li>
							</ol>
						</div>
					</div>
				</div>
			</section> 
		</div>
		
	</div> <!-- 최상위 container -->
</body>
</html>
