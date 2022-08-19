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
  body {
    position: relative;
  }
  h2 {font-weight: 400;}
  
  .story {
  	height: 2000px;
  }
  .story li { width: 100%;}
  
  /* 스크롤바이 */
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
  .navigation {
  	padding: 20px;
  	background-color: #ccc;
  }
  .navigation a {
  	padding-right: 20px;
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
	
	
	<div class="container w-100">
		<!-- 메인정보 div -->
		<div class="row">
			<!-- 프로젝트 이름 부분 -->
			<div>
				<h1 align="center">${project.p_name}</h1>
			</div>
			
			<!-- 메인 정보 section -->
			<section class="main">
		        <div class="container w-100">
		            <div class="row" >
		            	<!-- 이미지 슬라이더 -->
		                <div class="col-sm-8">
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
		                    <!-- <img class="img-fluid" src="#" alt="work">  원래 있던 img 태그 -->
		                </div>
		                
		                <!-- 상세소개란 -->
		                <div class="col-sm-4">
		                    <div class="row">
                                <div class="col-6" >
                                	<div class="progress" style="height: 10px;" >
  										<div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
                                    <p>모인 금액</p>
                                    <h2 class="purecounter">작성중</h2>
                                    <br>
                                </div>
                                <div class="col-6" >
                                    <p>남은시간</p>
                                    <h2 class="purecounter">${dayCount} 일</h2>
                                    <br>
                                </div>
                                <div class="col-6">
                                	<br>
                                    <p>후원자</p>
                                    <h2 class="purecounter">${project.p_backer} 명</h2>
                                    <br>
                                </div>
								<div class="col-6">
									<span>목표금액 ${project.p_goal} 원</span><br>
									<span>펀딩 기간 ${project.p_beginDate} ~ ${project.p_endDate}</span><br>
									<span>결제예정일 ${project.p_payDate}</span><br>
									<form>
										<!-- 리스트 추가버튼 -->
										<button type="button" class="btn btn-primary" onclick="addList(${project.p_seq}, 'Y')">리스트에 추가</button>
										<!-- 후원버튼 -->
										<button type="button" class="btn btn-info" onclick="BACK(${project.p_seq}, 'N')">후원하기</button>
									</form>
								</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		</div>
		
		<!-- 소개 div -->
		<div class="row">
			<div class="navigation" > <!-- 미니 네비게이션 -->
				<div>
					<nav>
						<a>프로젝트 계획</a>
						<a>커뮤니티</a>
						<a>후원자 목록</a>
					</nav>
				</div>
			</div> 
			<section class="story"> <!-- 소개란 & 리워드 부분 -->
				<!-- 소개란 -->
				<div class="row">
					<!-- scrollby 네비-->
					<nav class="col-sm-1 scroll" id="myScrollspy">
				    	<ul class="scrollul">
				        	<li class="active"><a href="#section1">story</a></li>
				        	<li><a href="#section2">risks</a></li>
				    	</ul>
				    </nav>
				    <div class="col-sm-7">
				    	<div style="border: 1px solid #333">
				    	<div id="section1">    
				        	<h1>story</h1>
				        	<p>소개글</p>
				    	</div>
				    	<div id="section2"> 
				        	<h1>risks</h1>
				        	<p>소개글</p>
				    	</div>
				    	</div>        
				    </div>
					<!-- 리워드 선택란 -->
					<div class="col-sm-4">
						<!-- 판매자 정보란 -->
						<div class="reward">
							<div align="center">
								<button>창작자 소개</button><br>
								<h2>${creator.c_name}</h2>
								<span>${creator.c_content}</span><br>
							</div>
							
							<!-- 리워드 -->
							<div class="reward_each" style="border: 1px solid #333">
								<ol>
								<c:forEach items="${rewardList}" var="list" varStatus="status">
									<li>
										<div>
											<span>선택 ${list.r_seq}</span>
											<h3 style="text-align: center;">${list.r_price} 원</h3>
											<span>${list.r_content}</span><br>
											<button class="btn btn-primary">진행하기</button>
											<hr>
										</div>
									</li>
								</c:forEach>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		
	</div> <!-- 최상위 container -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
	<script src="js/jquery.min.js"></script>
  	<script src="js/popper.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  	<script src="js/main.js"></script>
  	
  	<!-- 커스텀 스크립트 -->
  	<script>
  		function insert(p_seq, is_like, mode) {
  			$.ajax({
  				type: "POST",
  				url: "/subPage/back.do",
  				data: {p_seq:p_seq, is_like:is_like},
  				success: function(data) {
  					// 이때 받아오는 data는 서브 컨트롤러(2)에서 반환한 값
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
	  			//alert("후원이 완료되었습니다");
  			}
  		}
  		// 관심목록 버튼
  		function addList(p_seq, is_like) {
  			insert(p_seq, is_like, 2);
  			//alert("관심 목록에 추가되었습니다");
  		}
  	</script>
  	
</body>
</html>
