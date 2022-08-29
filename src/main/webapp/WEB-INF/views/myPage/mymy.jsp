<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MY INFO</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
	<!-- css파일 -->
	<link rel="stylesheet" href="${contextPath}/css/modal.css">
	
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@300;400;500&display=swap');
    * {
        margin: 0 auto;
        padding: 0;
        list-style: none;
        font-family: 'Hahmlet', serif;}
     label{font-weight: 500;}
	.bg-image {
	    background-image: url('${contextPath}/images/MAIN_img/summer.jpg');
	    background-attachment: fixed;
	    height: 300px;
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
	    opacity: 0;
	    transition: 0.3s;
	}
	.opacity:hover {
	    cursor: pointer;
	    opacity: 0.4;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
	.hide {display:none;}
	
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
                	<img id="img" src="${contextPath}/${userInfo.profile_img}" class="img-circle profile">
                    <div class="opacity img-circle profile">
                    </div>
                    <div class="hide">
   				    <input type="file" id="file1" name="file1"> 
                    </div>
                </div>

			
                <div class="row info" align="center">
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">아이디</label>
                        <div class="col-sm-3">
                        	<input type="text" class="form-control" id="id" placeholder="" value="${userInfo.id}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">이름</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name" placeholder="" value="${userInfo.name}" readonly>
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
                            <input type="text" class="form-control" id="email" placeholder="" value="${userInfo.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">주소</label>
                        <div class="col-sm-4" style="display: flex;">
                            <input type="text" class="form-control" id="address" placeholder="" value="${userInfo.address}">
                  			<button class="btn btn-primary" onclick="goPopup();" style="height: fit-content;">찾기</button>
                        </div>
                    </div>
                </div>
                   <div class="row" align="center">
                    <button class="btn btn-primary" onclick="updateUserInfo();">수정</button>
                    <button class="btn btn-info">취소</button>
                   </div>
                <div class="row pay" align="center">
                    <h4>등록된 결제수단이 없습니다</h4>
                    <!-- 카드 정보  -->         
                    <c:forEach items="${CardList}" var="cardListOne">
                    	<h3>card</h3>
						<h3>* * * * * * * * * * * * ${cardListOne.ci_num4 }</h3>
					</c:forEach>
					<c:forEach items="${AccountList}" var="accountListOne">			
						<h3>account</h3>
						<h3>
						<c:forEach var="i" begin="0" end="${accountListOne.ai_num.length()-5}"> 
							*
						</c:forEach>
						${fn:substring(accountListOne.ai_num, accountListOne.ai_num.length()-4, accountListOne.ai_num.length()) }
						</h3>

					</c:forEach>
                    <h3 class="card">+ CARD</h3>
                    <h3 class="account">+ ACCOUNT</h3>
                </div>
                <!-- 카드 정보  -->         
				
		
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
    
    <!-- 이미지 업로드 -->
    <script type="text/javascript">
    
    $(".opacity").click(function() {
        $("#file1").click();
    });
    
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
	//파일 업로드
	function imgUpload(){
	        /*
        	if ($("#file1")[0].files.length > 0) {
				return;
			}
	        */
	        var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        form.append( "id", $("#id").val() );
	        
	        $.ajax({
	             url : "/myPage/imgUpload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(data) {
	        	   alert("회원 정보 수정이 완료되었습니다.");
	        	   location.reload();
	           }
	           ,error: function (e) { 
	        	   alert("프로필 사진 업로드에 실패했습니다.")
	           }
	       });
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원정보 수정
	//-----------------------------------------------------------------------------------------------------------
	function updateUserInfo() {
		var id      = $("#id").val();
		var	pass	= $("#pass").val();
		var	pass_re	= $("#pass_re").val();
		var	email	= $("#email").val();
		var	address	= $("#address").val();
		
		if (pass == null || pass == ""){
			alert("비밀번호 필드를 입력 해주세요.")
			$("#pass").focus();
			return;
		} else if (pass_re == null || pass_re == ""){
			alert("비밀번호 확인 필드를 입력 해주세요.")
			$("#pass_re").focus();
			return;
		} else if (pass.length < 6 || pass.length > 15){
			alert("비밀번호는 6~15자리 내로 입력 해주세요.")
			return;
		} else if (pass != pass_re){
			alert("비밀번호가 일치하지 않습니다.")
			return;
		} else if (email == null || email == ""){
			alert("이메일 필드를 입력 해주세요.")
			$("#email").focus();
			return;
		} else if (address == null || address == ""){
			alert("주소 필드를 입력 해주세요.")
			$("#address").focus();
			return;
		}

		$.ajax({
			type:		"POST",
			url:		"/myPage/mymyUpdate.do",
			data:		{id: id, pass: pass, pass_re: pass_re, email: email, address:address},
			success:	function(data) {
				if(data == "Y") {
					if ($("#file1")[0].files.length > 0) {
						this.imgUpload();
					} else {
						alert("회원 정보 수정이 완료되었습니다.");
						location.reload();
					}
				} else {
					alert("회원 정보 수정이 실패하였습니다.");
				}		
			}.bind(this),
			error:		function(data) {
				alert("회원 정보 수정이 실패하였습니다.");
			}
		});

	}
	
	function goPopup(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#address").val(data.address + " ");
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }.bind(this)
	    }).open();
	}
	</script>
    
</body>
</html>