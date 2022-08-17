<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>꿈의 시작 VIVA</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	
<style>
	.jumbotron {
	background-color:	skyblue;
	}
	
</style>

</head>
<body>

<!-- 상단 메뉴바 -->
<jsp:include page="menu/navigation.jsp" flush="false" />

<div class="container">
  <div class="jumbotron">
    <h1 style="text-shadow:-1px 0px 0px #000,1px 0px 0px #000,0px -1px 0px #000,0px 1px 0px #000;">VIVA</h1>
    <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing
    responsive, mobile-first projects on the web.</p>
  </div>
</div>

<!-- 이미지 슬라이드 만들기 -->
<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="${contextPath}/images/mainSlide/mainSlide1.jpg" width="100%" height="200px"/>
				<!-- carousel에 설명을 달아준다. -->
				<div class="carousel-caption">
					<h1><b>신선한 재미</b></h1>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="${contextPath}/images/mainSlide/mainSlide2.jpg" width="100%" height="100px"/>
				<div class="carousel-caption">
					<h1><b>우리들의 열정</b></h1>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="${contextPath}/images/mainSlide/mainSlide3.jpg" width="100%" height="200px"/>
				<div class="carousel-caption">
					<h1><b>모두의 꿈과 희망</b></h1>
				</div>
			</div> 
		</div>
		
		<!-- 좌측, 우측으로 그림을 움직일 수 있도록 좌/우버튼을 설정한다. -->
		<a class="left  carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
</div>

<!-- 메인 상단 프로젝트 -->
<div class="container">
	<!-- 실시간 베스트 무비 -->
	<div class="col-sm-9">
		<h3>Hot Movie</h3>
		<p>실시간 베스트 무비를 즐겨보세요.</p>
		 <div class="row">
		  <div class="col-sm-4">
		    <div class="thumbnail">
		      <a href="/w3images/lights.jpg">
		        <img src="/w3images/lights.jpg" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p>Lorem ipsum...</p>
		        </div>
		      </a>
		    </div>
		  </div>
		  <div class="col-sm-4">
		    <div class="thumbnail">
		      <a href="/w3images/nature.jpg">
		        <img src="/w3images/nature.jpg" alt="Nature" style="width:100%">
		        <div class="caption">
		          <p>Lorem ipsum...</p>
		        </div>
		      </a>
		    </div>
		  </div>
		  <div class="col-sm-4">
		    <div class="thumbnail">
		      <a href="/w3images/fjords.jpg">
		        <img src="/w3images/fjords.jpg" alt="Fjords" style="width:100%">
		        <div class="caption">
		          <p>Lorem ipsum...</p>
		        </div>
		      </a>
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- 새로운 무비 -->
	<div class="col-sm-3">
		<h3><b>New Movie</b></h3>
		<p>새로운 무비를 즐겨보세요.</p>
		<div class="col-sm">
		    <div class="thumbnail">
		      <a href="/w3images/fjords.jpg">
		        <img src="/w3images/fjords.jpg" alt="Fjords" style="width:100%">
		        <div class="caption">
		          <p>Lorem ipsum...</p>
		        </div>
		      </a>
		    </div>
		  </div>
		</div>
	</div>
	
</div>

</body>
</html>