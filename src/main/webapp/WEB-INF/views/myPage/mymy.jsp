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
	
	<!-- css파일 -->
	<link rel="stylesheet" href="${contextPath}/css/modal.css">
	
	<style>
	* {
	    margin: 0 auto;
	    padding: 0;
	    list-style: none;}
	.bg-image {
	    background-image: url('${contextPath}/images/MAIN_img/summer02.png');
	    background-attachment: fixed;
	    height: 200px;
	}
	.main-back {
	}
	.main {
	    height: 900px;
	    background-color: #fff;
	}
	
	.profile-img {
	    margin-top: -80px;
	    width: 200px;
	    height: 200px;
	    position: relative;
	}
	
	.opacity {
	    position: absolute;
	    top: 0;
	    background-color: #fff;
	    transition: 0.3s;
	}
	.opacity:hover {
	    cursor: pointer;
	    opacity: 0.4;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    
	}
	
	input {margin-bottom: 20px;}
	.info {
	    padding-top: 30px;
	    margin-bottom: 30px;
	}
	.pay h4 {
	    border-top: 2px solid #333;
	    padding-top: 30px;
	}
	.card, .account {
	    box-sizing: border-box;
	    border: 2px solid #333;
	    border-radius: 15px;
	    width: 150px;
	    line-height: 60px;
	    font-size: large;
	    cursor: pointer;
	    display: inline-block;
	}
	.card:hover {
		background-color: #ccc;
		transition: 0.2s;
		border:  2px solid #fff;
	}
	.account:hover {
		background-color: #ccc;
		transition: 0.2s;
		border:  2px solid #fff;
	}

	</style>
</head>


<body>
	
	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
	<!-- 배경 이미지 -->
	<div class="container-fluid bg-image"></div>
	<!-- 메인 -->
    <div class="container-fluid main-back">
    	<div class="container main">
            <div class="row">  

                <div class="profile-img" data-toggle="tooltip" title="사진 바꾸기">
                    <div class="opacity img-circle profile">
   				    <input type="file" id="file1" name="file1" class="opacity"> 
                    </div>
                    <div class="img_wrap">
                    <img id="img" class="img-circle profile"/>
                    </div>
                    
                </div>

			
                <div class="row info" align="center">
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">닉네임</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">비밀번호</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="pass" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">비밀번호 확인</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="pass_re" placeholder="">
                            <font id="ckpwd" size="2"></font>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">이메일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="email" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">배송지</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="ship" placeholder="">
                        </div>
                    </div>
                </div>
                   <div class="row" align="center">
                    <button class="btn btn-primary">수정</button>
                    <button class="btn btn-info">취소</button>
                   </div>
                <div class="row pay" align="center">
                    <h4>등록된 결제수단이 없습니다</h4>
                    <h3 class="card">+ CARD</h3>
                    <h3 class="account">+ ACCOUNT</h3>
                </div>
            </div>
            
            <!-- 카드 & 계좌 모달창 -->
			<jsp:include page="modal.jsp" flush="false" />
			
	    </div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />

	
	<!-- 스크립트 -->
    <!-- 사진 바꾸기 tooltip-->
	<script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
            });
    </script>

    <!-- 비밀번호 일치 확인-->
    <script>
		$(function() {
		   $('#pass').keyup(function(){
		      $('#ckpwd').html('');
		   });
		   
		    $('#pass_re').keyup(function(){
		        if($('#pass').val() != $('#pass_re').val()){
		            $('#ckpwd').html('비밀번호가 일치하지 않습니다.<br>');
		            $('#ckpwd').attr('color', 'red');
		        } else {
		            $('#ckpwd').html('비밀번호가 일치합니다.<br>');
		            $('#ckpwd').attr('color', 'blue');
		        }
		    });
		});
    </script>

    <!-- 모달창 -->
    <script>
		// 카드
		$(".card").click(function(){
		    $("#CardModal").fadeIn(200);
		});
		$("#cardBtnN").click(function(){
		    $("#CardModal").fadeOut(200);
		});
		
		// 계좌
		$(".account").click(function(){
		    $("#CashModal").fadeIn(200);
		});
		$("#cashBtnN").click(function(){
		    $("#CashModal").fadeOut(200);
		});
		
		
		
		
    </script>
    <script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file1").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>
    
<script>
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "file1", $("#file1")[0].files[0] );
        
         jQuery.ajax({
             url : "/myapp/result"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>
    
</body>
</html>