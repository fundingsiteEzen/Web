<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>VIVA</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- isotope 필터 -->
	<script src="js/isotope.pkgd.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@300;400;500&display=swap');
        * {
            margin: 0 auto;
            padding: 0;
            list-style: none;
            font-family: 'Hahmlet', serif;}
	    .row {margin: 0;}
	    .wrap {
	        background-image: url("${contextPath}/images/MAIN_img/spring.jpg");
	        background-attachment: fixed;
	        transition: 0.4s;}
	    .main {background-color: #fff;
	    
	    }
	
	    .season_bar {
	        margin-top: 30px;
	        margin-bottom: 30px;
	        text-align: center;}
	    .season_bar li {
	        margin-right: 20px;
	        margin-left: 20px;
	        padding-bottom: 10px;
	        display: inline-block;
	        line-height: 40px;
	        font-size: large;
	        cursor: pointer;
	    }
	    .season_bar li:after {
	        display:block;
	        content: '';
	        width: 80px;
	        border-bottom: solid 3px red;  
	        transform: scaleX(0);  
	        transition: transform 250ms ease-out;
	    }
	    .season_bar li:hover::after {
	        transform: scaleX(1);
	    }
		
		/* 프로젝트 목록 */
		.category {
		cursor: pointer;
		margin-bottom: 80px;
		height: 300px;
		}
		.img_box {
			overflow: hidden;
			transition: all 0.3s ease-in-out;
		}
		/*
		.img_box:hover {
			box-shadow: 0 0 10px rgba(0,0,0, 0.3);
		}
		*/
		
		/* 이미지 오버 효과 */
		.main img {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		}
		.main img:hover {
		  transform: scale(1.2);
		  -webkit-transform: scale(1.2);
		  -moz-transform: scale(1.2);
		  -ms-transform: scale(1.2);
		  -o-transform: scale(1.2);
		}
		
		.dDay {
			position: absolute;
			top: -3px; right: 10px;
			border-radius: 10px;
			padding: 5px;
		}
		.progress {
			appearance: none;
			width: 100%;
			height: 5px;
			text-align: left;
			margin: 0;
		}
		.progress::-webkit-progress-bar {
			background:#f7f7f7;
		}
		.progress::-webkit-progress-value {
			background: #dd6a58;
		}
		
	</style>
</head>

<body>

<!-- 상단 메뉴바 -->
<jsp:include page="menu/navigation.jsp" flush="false" />

	<!-- container 시작 -->
	<div class="container-fluid wrap">
        <div class="container main">
            <div align="center">
                <h1 class="all" data-filter="*">VIVA</h1>
                <!-- 계절 선택바 -->
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="season_bar">
                            <li class="spring" data-filter=".p_spring">Spring</li>
                            <li class="summer" data-filter=".p_summer">Summer</li>
                            <li class="autumn" data-filter=".p_autumn">Autumn</li>
                            <li class="winter" data-filter=".p_winter">Winter</li>
                        </ul>
                    </div>
                </div>
				<jsp:useBean id="today" class="java.util.Date" />
                <div class="row filter">
	                <!-- 봄 -->
	                <c:forEach items="${SpringList}" var="list" varStatus="status">
						<div class="col-sm-3 category p_spring" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
							<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="sysDate" />
							<fmt:parseNumber value="${list.p_endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
							<div class="img_box" style="overflow: hidden; height:80%; width: 100%;">
								<img class="img-responsive center-block" style="object-fit: cover;" src="${contextPath}/images/thumnail/${list.p_thumb}" width= "100%" height="100%"/>
							</div>
							<div style="position:relative;">
								<div align="center"><h4 style="margin-top: 15px;">${list.p_name}</h4></div>
								<progress class="progress" value="${list.p_total / list.p_goal * 100}" min="0" max="100"></progress>
								<div class="row" style="padding-top: 5px;">
									<div class="col-sm-6" align="left" style="font-size: 0.9em; padding: 0 5px;"><fmt:formatNumber type="number" value="${list.p_total / list.p_goal * 100}" maxFractionDigits="0"/>% 달성</div>
									<div class="col-sm-6" align="right" style="font-size: 0.9em; padding: 0 5px;">D-${endDate - sysDate}</div>
								</div>
							</div>
						</div>
					</c:forEach>
	                <!-- 봄 끝 -->
	                <!-- 여름 -->
	                <c:forEach items="${SummerList}" var="list" varStatus="status">
						<div class="col-sm-3 category p_summer" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
							<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="sysDate" />
							<fmt:parseNumber value="${list.p_endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
							<div class="img_box" style="overflow: hidden; height:80%; width: 100%;">
								<img class="img-responsive center-block" style="object-fit: cover;" src="${contextPath}/images/thumnail/${list.p_thumb}" width= "100%" height="100%"/>
							</div>
							<div style="position:relative;">
								<div align="center"><h4 style="margin-top: 15px;">${list.p_name}</h4></div>
								<progress class="progress" value="${list.p_total / list.p_goal * 100}" min="0" max="100"></progress>
								<div class="row" style="padding-top: 5px;">
									<div class="col-sm-6" align="left" style="font-size: 0.9em; padding: 0 5px;"><fmt:formatNumber type="number" value="${list.p_total / list.p_goal * 100}" maxFractionDigits="0"/>% 달성</div>
									<div class="col-sm-6" align="right" style="font-size: 0.9em; padding: 0 5px;">D-${endDate - sysDate}</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 여름 끝 -->
					<!-- 가을 -->
					<c:forEach items="${AutumnList}" var="list" varStatus="status">
						<div class="col-sm-3 category p_autumn" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
							<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="sysDate" />
							<fmt:parseNumber value="${list.p_endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
							<div class="img_box" style="overflow: hidden; height:80%; width: 100%;">
								<img class="img-responsive center-block" style="object-fit: cover;" src="${contextPath}/images/thumnail/${list.p_thumb}" width= "100%" height="100%"/>
							</div>
							<div style="position:relative;">
								<div align="center"><h4 style="margin-top: 15px;">${list.p_name}</h4></div>
								<progress class="progress" value="${list.p_total / list.p_goal * 100}" min="0" max="100"></progress>
								<div class="row" style="padding-top: 5px;">
									<div class="col-sm-6" align="left" style="font-size: 0.9em; padding: 0 5px;"><fmt:formatNumber type="number" value="${list.p_total / list.p_goal * 100}" maxFractionDigits="0"/>% 달성</div>
									<div class="col-sm-6" align="right" style="font-size: 0.9em; padding: 0 5px;">D-${endDate - sysDate}</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 가을 끝 -->
					<!-- 겨울 -->
					<c:forEach items="${WinterList}" var="list" varStatus="status">
						<div class="col-sm-3 category p_winter" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
							<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="sysDate" />
							<fmt:parseNumber value="${list.p_endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
							<div class="img_box" style="overflow: hidden; height:80%; width: 100%;">
								<img class="img-responsive center-block" style="object-fit: cover;" src="${contextPath}/images/thumnail/${list.p_thumb}" width= "100%" height="100%"/>
							</div>
							<div style="position:relative;">
								<div align="center"><h4 style="margin-top: 15px;">${list.p_name}</h4></div>
								<progress class="progress" value="${list.p_total / list.p_goal * 100}" min="0" max="100"></progress>
								<div class="row" style="padding-top: 5px;">
									<div class="col-sm-6" align="left" style="font-size: 0.9em; padding: 0 5px;"><fmt:formatNumber type="number" value="${list.p_total / list.p_goal * 100}" maxFractionDigits="0"/>% 달성</div>
									<div class="col-sm-6" align="right" style="font-size: 0.9em; padding: 0 5px;">D-${endDate - sysDate}</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 겨울 끝 -->
                </div> <!-- class=filter -->
            </div>
        </div>
    </div>
                <jsp:include page="menu/footer.jsp" flush="false"></jsp:include>

	<!-- 스크립트 -->
    <script>
	    $(".spring").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/spring.jpg')");
	    });
	    $(".summer").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/summer.jpg')");
	    });
	    $(".autumn").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/autumn.jpg')");
	    });
	    $(".winter").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/winter.jpg')");
	    });
    </script>
    
    <!-- isotope 필터 -->
    <script>
    $(document).ready( function() {   
        $('.filter').isotope({
        itemSelector: '.category',
        });
        
        $('.all').on('click', function() {
        	var filterValue = $(this).attr('data-filter');
        	$('.filter').isotope({ filter: filterValue });
        });
        $('.spring').on('click', function() {
            var filterValue = $(this).attr('data-filter');
        	$('.filter').isotope({ filter: filterValue });
        });
        $('.summer').on('click', function() {
            var filterValue = $(this).attr('data-filter');
        	$('.filter').isotope({ filter: filterValue });
        });
        $('.autumn').on('click', function() {
            var filterValue = $(this).attr('data-filter');
        	$('.filter').isotope({ filter: filterValue });
        });
        $('.winter').on('click', function() {
            var filterValue = $(this).attr('data-filter');
        	$('.filter').isotope({ filter: filterValue });
        });
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