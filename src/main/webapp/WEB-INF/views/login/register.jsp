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
	<title>REGISTER</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/login.css">
	
	<style>
	/*
	*/
		.check {
			position: relative;}
		.duple { right: 10px; }
	</style>

	<!-- 로그인한 상태로 회원가입 페이지에 들어갈 수 없게함 -->
	<%
	if(session.getAttribute("isLogin") != null) {
		response.sendRedirect("/");
	}
	%>
	</head>
	<body style="background-image: url('${contextPath}/images/MAIN_img/autumn.jpg');">
	
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
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<div class="login-wrap" align="center">
				      	<h3 class="mb-4 text-center">회원가입</h3>
				      	
				      	<form action="${contextPath}/addMember.do" class="signin-form" method="post" onsubmit="return register()"> <!-- 회원가입하기 form -->
				      		<!-- 아이디 -->
				      		<div class="form-group check">
				      			<input type="text" id="idshow" name="idshow" class="form-control" placeholder="아이디" required>
				      			<input type="hidden" id="id" name="id" class="form-control" placeholder="아이디" required>
				      			<button type="button" class="btn btn-primary submit duple field-icon" onclick="checkId()">중복확인</button>
				      		</div>
				      		<!-- 비밀번호 -->
				            <div class="form-group">
				            	<input type="password" id="pass" name="pass" class="form-control" placeholder="비밀번호" maxlength="15" required>
				            </div>
				            <!-- 비밀번호 확인 -->
				            <div class="form-group check">
				            	<input type="password" id="pass_re" name="pass_re" class="form-control" placeholder="비밀번호를 한번 더 입력하세요" maxlength="15" required>
				            	<span class="field-icon check_pass glyphicon"></span>
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
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />

  	<!-- 아이디 중복체크 -->
  	<script>
		var click = 0;
  		function checkId() {
  			$.ajax({
  				type: "post",
				url: "/checkId.do",
				dataType: "json",
				data: {"id": $("#idshow").val()},
				success: function(data, textStatus) {
					if(data == 1){
						Swal.fire({
							icon: 'error',
							title: '이미 사용중인 아이디입니다.'
						})
						$("#idshow").val('');
					} else if(data == 0 && $("#idshow").val() != '') {
						Swal.fire({
							icon: 'success',
							title: '사용 가능한 아이디입니다.'
						})
						$("#idshow").attr("disabled", true);
						$("#idshow").css("background", "rgba(255, 255, 255, 0.2)");
						$("#id").val($("#idshow").val());
						click++;
					}
				}, error: function(data, textStatus) {
					Swal.fire({
						icon: 'error',
						title: '문제가 발생했습니다.'
					})
				}
  			});
  		}
  		function register(){
  	        if(click == 0) {
  				//alert("아이디 중복확인은 필수입니다.");
  				Swal.fire({
				icon: 'warning',
				title: '아이디 중복확인은 필수입니다.',
				})
  				return false;
  			}
  			if($("#pass").val().length < 6) {
  				//alert("비밀번호는 최소 6자리로 입력하세요.");
  				Swal.fire({
				icon: 'warning',
				title: '비밀번호는 최소 6자리로 입력하세요.',
				})
  				return false;
  			}
  			if($('#pass').val() != $('#pass_re').val()){
  	            //alert("비밀번호가 일치하지 않습니다.");
			  	Swal.fire({
				icon: 'warning',
				title: '비밀번호가 일치하지 않습니다.',
				})
  	            $('#pass').focus();
  	            return false;
  	        }
  	        return true;
  	    }
  	</script>
  	<script>
  		$('#pass').keyup(function(){
  			$('.check_pass').removeClass('glyphicon-ok');
  			$('.check_pass').removeClass('glyphicon-remove');
	   	});
  		$(function() {
		    $('#pass_re').keyup(function(){
		        if($('#pass').val() != $('#pass_re').val()){
		            $('.check_pass').removeClass('glyphicon-ok');
		            $('.check_pass').addClass('glyphicon-remove');
		        } else {
		            $('.check_pass').removeClass('glyphicon-remove');
		            $('.check_pass').addClass('glyphicon-ok');
		        }
		    });
		});
  	</script>

	</body>
</html>

