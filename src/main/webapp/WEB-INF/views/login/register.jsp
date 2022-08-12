<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Login 10</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">

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
				      	<h3 class="mb-4 text-center">회원가입</h3>
				      	
				      	<form action="${contextPath}/register" class="signin-form" method="post"> <!-- 회원가입하기 form -->
				      		<!-- 아이디 -->
				      		<div class="form-group">
				      			<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required>
				      		</div>
				      		<!-- 비밀번호 -->
				            <div class="form-group">
				            	<input type="password" id="pass" name="pass" class="form-control" placeholder="비밀번호" required>
				            </div>
				            <!-- 비밀번호 확인 -->
				            <div class="form-group">
				            	<input type="password" id="pass_re" name="pass_re" class="form-control" placeholder="비밀번호를 한번 더 입력하세요" required>
				            </div>
				            <!-- 이메일 -->
				      		<div class="form-group">
				      			<input type="text" id="email" name="email" class="form-control" placeholder="이메일" required>
				      		</div>
				      		<!-- 줄 -->
				      		<hr>
				            <!-- sign UP 버튼 -->
				            <div class="form-group">
				            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign UP</button>
				            </div>
				        </form>
				        
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

