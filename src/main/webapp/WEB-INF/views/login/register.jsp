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
	
	<!-- 알럿창 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
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
				      	
				      	<form action="${contextPath}/addMember.do" class="signin-form" method="post"> <!-- 회원가입하기 form -->
				      		<!-- 아이디 -->
				      		<div class="form-group">
				      			<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required>
				      			<button type="button" class="form-control btn btn-primary submit" onclick="checkId()">중복확인</button>
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
				            	<button type="submit" class="btn btn-primary submit px-3">Sign UP</button>
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
  	
  	<!-- 아이디 중복체크 -->
  	<script>
  		function checkId() {
  			$.ajax({
  				type: "post",
				url: "/checkId.do",
				dataType: "json",
				data: {"id": $("#id").val()},
				success: function(data, textStatus) {
					if(data == 1){
						Swal.fire({
							icon: 'error',
							title: '이미 사용중인 아이디입니다.'
						})
						$("#id").val('');
					} else if(data == 0) {
						Swal.fire({
							icon: 'success',
							title: '사용 가능한 아이디입니다.'
						})
					}
				}, error: function(data, textStatus) {
					Swal.fire({
						icon: 'error',
						title: '문제가 발생했습니다.'
					})
				}
  			});
  		}
  	</script>

	</body>
</html>

