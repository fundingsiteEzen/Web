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
	<title>MY PAGE</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
		.bg-image {
            background-image: url("${contextPath}/images/MAIN_img/summer02.png");
            height: 200px;
        }
        .main-back {
        }
        .main {
            height: 800px;
            background-color: #fff;
        }

        .profile-img {
            margin-top: -80px;
            width: 200px;
            height: 200px;
        }
        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
	</style>
</head>
<body>
	
	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
    <!-- 시작 -->
	<div class="container-fluid bg-image">
        
	</div>
    <div class="container-fluid main-back">
        <div class="container main">
            <div class="profile-img">
                <img src="${contextPath}/images/SUB/detail01.jpg" class="img-circle profile">
            </div>
        </div>
    </div>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
</body>
</html>