<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비바 메인페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
</head>
<body>

<jsp:include page="menu/navigation.jsp" flush="false" />

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
				<img class="img-responsive center-block" src="#" width="80%" height="200px"/>
				<!-- carousel에 설명을 달아준다. -->
				<div class="carousel-caption">
					<h2>이미지 설명</h2>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="#" width="80%" height="200px"/>
				<!-- carousel에 설명을 달아준다. -->
				<div class="carousel-caption">
					<h2>이미지 설명</h2>
				</div>
			</div> 
			<div class="item">
				<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
				<img class="img-responsive center-block" src="#" width="80%" height="200px"/>
				<!-- carousel에 설명을 달아준다. -->
				<div class="carousel-caption">
					<h2>이미지 설명</h2>
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
		<h3>최신 프로젝트</h3>
	</div>
	
	<div class="col-sm-3"  	style="background-color:red">
		<h5><b>인기 프로젝트</b></h5>
	</div>
	
</div>



<!-- footer.jsp -->

</body>
</html>