<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>꿈의 시작 BEVA</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	
<style>
	#mainTOP {
	/*height:					300px;
	background-image: 		url("${contextPath}/resources/images/mainSlide/mainTOP.jpg");
	background-repeat:		no-repeat;
	background-size:		cover;
	background-position:	center; */
	background-color:		#0002;
	
	height:					400px;
	weight:					80%;
	}
	#mainTOP > h1, h2 {
	color: 					#FFFF;
	text-align:				right;
	}

</style>

</head>
<body>

<!-- 상단 메뉴바 -->
<jsp:include page="menu/navigation.jsp" flush="false" />

<!-- 비바메인 상단 -->
<!-- <div class="container" id=mainTOP>

	<h1>BEVA</h1>
	<h2>우리의 꿈을 응원해</h2>
	
</div> -->
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
				<img class="img-responsive center-block" src="${contextPath}/resources/images/mainSlide/mainSlide1.jpg" width="100%" height="200px"/>
				<!-- carousel에 설명을 달아준다. -->
				<div class="carousel-caption">
					<h1><b>재미</b></h1>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="${contextPath}/resources/images/mainSlide/mainSlide2.jpg" width="100%" height="100px"/>
				<div class="carousel-caption">
					<h1><b>열정</b></h1>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="${contextPath}/resources/images/mainSlide/mainSlide3.jpg" width="100%" height="200px"/>
				<div class="carousel-caption">
					<h1><b>꿈과희망</b></h1>
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
	<div class="col-sm-9"	style="background-color:blue">
		<h3>실시간 HOT한 영화</h3>
	</div>
	
	<div class="col-sm-3"  	style="background-color:red">
		<h3><b>최신 영화</b></h3>
	</div>
	
</div>
<!-- 스크롤확인용 임시글 -->
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>
<h3>asdaaaaaaaaaaaaaaaaaaaaaaaaaaa</h3><br/>

</body>
</html>