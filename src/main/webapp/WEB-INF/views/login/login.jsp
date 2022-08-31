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
	<link rel="stylesheet" href="css/login.css">
	
	<!-- RSA 인증 -->
	<script type="text/javascript" src="${contextPath}/js/rsa.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jsbn.js"></script>
	<script type="text/javascript" src="${contextPath}/js/prng4.js"></script>
	<script type="text/javascript" src="${contextPath}/js/rng.js"></script>
	
	<script type="text/javascript">    
    function login(){
        var id = $("#USER_ID_TEXT");
        var pw = $("#USER_PW_TEXT");
    
        if(id.val() == ""){
            alert("아이디를 입력 해주세요.");
            id.focus();
            return false;
        }
        
        if(pw.val() == ""){
            alert("비밀번호를 입력 해주세요.");
            pw.focus();
            return false;
        }
        
        // rsa 암호화
        var rsa = new RSAKey();
        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
        
        $("#USER_ID").val(rsa.encrypt(id.val()));
        $("#USER_PW").val(rsa.encrypt(pw.val()));
        
        id.val("");
        pw.val("");
 
        return true;
    }
	</script>
	
	<!-- 로그인한 상태로 로그인 페이지에 들어갈 수 없게함 -->
	<%
	if(session.getAttribute("isLogin") != null) {
		response.sendRedirect("/");
	}
	%>
</head>
	
<body class="img js-fullheight" style="background-image: url('${contextPath}/images/MAIN_img/autumn.jpg');">
	
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
					<div class="login-wrap">
				      	<h3 class="mb-4 text-center">LOGIN</h3>
				      	
				      	<form action="${contextPath}/rsalogin.do" class="signin-form" method="post" onsubmit="return login()"> <!-- 로그인하기 form -->
				      		<!-- RSA 키 -->
				      		<input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
        					<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>  
				      		<!-- 아이디 -->
				      		<div class="form-group">
				      			<input type="text" id="USER_ID_TEXT" name="USER_ID_TEXT" class="form-control" placeholder="아이디" required>
				      		</div>
				      		<!-- 비밀번호 -->
				            <div class="form-group">
				            	<input type="password" id="USER_PW_TEXT" name="USER_PW_TEXT" class="form-control" placeholder="비밀번호" required>
				            </div>
				            <!-- sign In 버튼 -->
				            <div class="form-group">
				            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
				            </div>
				            <!-- 실제 전송되는 id, pass -->
				            <input type="hidden" id="USER_ID" name="USER_ID">
        					<input type="hidden" id="USER_PW" name="USER_PW">
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

<!-- 
	<script src="js/main.js"></script>
 -->
</body>
</html>

