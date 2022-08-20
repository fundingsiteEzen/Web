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
	<title>MY INFO</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
		<style>
        * {
            margin: 0 auto;
            padding: 0;
            list-style: none;}
        .bg-image {
            background-image: url(summer02.png);
            background-attachment: fixed;
            height: 200px;
        }
        .main-back {
        }
        .main {
            height: 1000px;
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

        .nickname {
            margin-bottom: 120px;
        }
        .nickname span {
            cursor: pointer;
            font-size: small;
        }

        .my_nav {
            padding-top: 60px;
        }
        .my_nav li {
            line-height: 80px;
            font-size: 1.3em;
            cursor: pointer;
        }
        .my_nav li:hover {
        	opacity: 0.5;
        }

        .fund_list {
            display: block;
        }
        .like_list {
            display: none;
        }
        .my_list {
            display: none;
        }
        
	</style>
	
</head>


<body>
	
	<!-- 배경 이미지 -->
	<div class="container-fluid bg-image"></div>
	<!-- 메인 -->
    <div class="container-fluid main-back">
        <div class="container main">
            <div class="row">
                <div class="profile-img">
                    <img src="detail01.jpg" class="img-circle profile">
                </div>
                <!-- 오른쪽 영역(닉네임, 썸네일 목록) -->
                <div>
                    <div align="center">
                        <h3>닉네임</h3>
                    </div>
                    <section class="info_list">
                        <h3>비밀번호 변경 : </h3>
                        <h3>비밀번호 변경 확인 : </h3>
                        <h3>비밀번호 변경 확인 : </h3>
                    </section>
                </div>
            </div>
            
        </div>
    </div>
	
</body>
</html>