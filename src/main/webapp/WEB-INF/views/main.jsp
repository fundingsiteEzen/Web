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
	
	<style>
	    * {margin: 0 auto;
	    padding: 0;
	    list-style: none;}
	    .wrap {
	        background-image: url("${contextPath}/images/MAIN_img/spring.png");
	        height: 1000px;
	        background-attachment: fixed; }
	    .main {background-color: #fff; margin-top: 100px;}
	
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
	</style>
</head>

<body>

<!-- 상단 메뉴바 -->
<jsp:include page="menu/navigation.jsp" flush="false" />

	<div class="container-fluid wrap">
        <div class="container main">
            <div align="center">
                <h1>VIVA</h1>
                <!-- 계절 선택바 -->
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="season_bar">
                            <li class="spring">Spring</li>
                            <li class="summer">Summer</li>
                            <li class="autumn">Autumn</li>
                            <li class="winter">Winter</li>
                        </ul>
                    </div>
                </div>
                <!-- 썸네일 -->
                <div class="row">
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="detail03.jpg" />
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="detail03.jpg" />
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="detail03.jpg" />
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="detail03.jpg" />
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 스크립트 -->
    <script>
	    $(".spring").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/spring.png')");
	        $(".wrap").css("transition", "0.6s");
	    });
	    $(".summer").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/summer01.png')");
	        // $(".wrap").css("background-size", "1500px 1000px");
	        $(".wrap").css("transition", "0.6s");
	    });
	    $(".autumn").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/autumn.png')");
	        $(".wrap").css("transition", "0.6s");
	    });
	    $(".winter").click(function() {
	        $(".wrap").css("background-image", "url('${contextPath}/images/MAIN_img/winter.png')");
	        $(".wrap").css("transition", "0.6s");
	    });
    </script>

</body>
</html>