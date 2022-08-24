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
		
	<!-- 페이지가 시작될 때 실행되는 스크립트 -->
	<c:choose>
		<c:when test="${result == 'loginFailed'}">
		<script>
			window.onload = function() {
				alert("아이디를 잘못 입력하셨습니다. \n다시 로그인 해주세요.");
			}
		</script>
		</c:when>
		<c:when test="${result == 'passwordFailed'}">
		<script>
			window.onload = function() {
				alert("비밀번호가 일치하지 않습니다. \n다시 로그인 해주세요.");
			}
		</script>
		</c:when>
	</c:choose>
</head>
	
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
	
	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
	<!-- 전체 section -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
				      	<h3 class="mb-4 text-center">LOGIN</h3>
				      	
				      	<form action="${contextPath}/idsearch.do" class="signin-form" method="post"> <!-- 로그인하기 form -->
				      		<!-- 아이디 -->
				      		<div class="form-group">
				      			<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required>
				      		</div>
				      		<!-- 비밀번호 -->
				            <div class="form-group">
				            	<input type="password" id="pass" name="pass" class="form-control" placeholder="비밀번호" required>
				            	<span toggle="#pass" class="fa fa-fw fa-eye field-icon toggle-password"></span>
				            </div>
				            <!-- sign In 버튼 -->
				            <div class="form-group">
				            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
				            </div>
				            
				            <!-- Remember Me / Forgot Password -->
				            <!-- 
				            <div class="form-group d-md-flex">
				            	<div class="w-50">
					            	<label class="checkbox-wrap checkbox-primary">Remember Me
										<input type="checkbox" checked>
										<span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
				            </div>
				             -->
				        </form>
				        
				        <p class="w-100 text-center">&mdash; 회원가입하기 &mdash;</p>
				         
				        <div class="social d-flex text-center">
				        	<a href="${contextPath}/register.do" class="px-2 py-2 mr-md-1 rounded"><span class="icon-logo-facebook mr-2"></span>Go Register</a>
				        </div>
		      		</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  	<script src="js/popper.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  	<script src="js/main.js"></script>

</body>
</html>

