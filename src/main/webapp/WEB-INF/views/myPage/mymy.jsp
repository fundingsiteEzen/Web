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
	    margin-top: -120px;
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
	    border: 2px solid #ccc;
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
	
	li{
	  list-style-type: none;
	}
	
	.navigation {
		margin-top: 80px;
		margin-bottom: 50px;
	}
	.navigation h3 {
		margin-top: -0.5em;
	}
	.line {
		border-bottom: 2px solid #ccc;
	}
	
	/* 보여줄 구간의 높이와 넓이 설정 */
	#slideShow{
	  width: 400px;
	  height: 300px;
	  position: relative;
	  margin: 50px auto;
	  overflow: hidden;
	  
	  /*리스트 형식으로 이미지를 일렬로 
	  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
	  hidden으로 숨겨줘야됨*/
	}
	
	.slideBox{
	    box-sizing: border-box;
	    border: 2px solid #ccc;
	    border-radius: 15px;
	    width: 400px;
	    height: 250px;
	    line-height: 60px;
	    font-size: large;
	    cursor: pointer;
	    float:left;
	    margin-right:20px;
	}
	
	.slides{
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
	  transition: left 0.5s ease-out; 
	  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
	}
	
	/* 첫 번째 슬라이드 가운데에 정렬하기위해
	첫번째 슬라이드만 margin-left조정 */
	.slides li:first-child{
	  margin-left: 100px;
	}
	
	/* 슬라이드들 옆으로 정렬 */
	.slides li:not(:last-child){
	  float: left;
	  margin-right: 100px;
	}
	
	.slides li{
	  float: left;
	}
	
	.controller span{
	  position:absolute;
	  background-color: transparent;
	  color: black;
	  text-align: center;
	  border-radius: 50%;
	  padding: 10px 20px;
	  top: 110px;
	  font-size: 1.3em;
	  cursor: pointer;
	}
	
	/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
	.controller span:hover{
	  background-color: rgba(128, 128, 128, 0.11);
	}
	
	.prev{
	  left: 10px;
	}
	
	/* 이전 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 왼쪽으로 이동하는 효과
	.prev:hover{
	  transform: translateX(-10px);
	}
	*/
	.next{
	  right: 10px;
	}
	
	/* 다음 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 오른쪽으로 이동하는 효과
	.next:hover{
	  transform: translateX(10px);
	}
	*/
	/* 내정보 수정 인풋 css */
	.form-control {
	  height: 35px;
	  border: 1px solid #ccc;
	  background: rgba(255, 255, 255, 0.08);
	  border-radius: 40px;
	  padding-left: 20px;
	  padding-right: 20px;
	  transition: 0.3s;
	}
	.form-control:hover {
		background-color: #ccc
	}
	.check {
		position: relative;}
	.duple { 
		position:absolute;
		top: 20%;
		right: 30px; }
	</style>
	
	<!-- 로그인 정보가 없으면 들어갈 수 없게 함 -->
	<%
	if(session.getAttribute("isLogin") == null || session.getAttribute("isLogin").equals("")) {
		response.sendRedirect("/login.do");
	}
	%>
</head>


<body>
	
	<!-- 네비게이션 -->
	<jsp:include page="../menu/navigation.jsp" flush="false" />
	
	<!-- 알럿창 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
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
                       	<input type="hidden" class="form-control" id="id" placeholder="" value="${userInfo.id}" readonly>
                        <label class="control-label col-sm-offset-3 col-sm-2">닉네임</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name" placeholder="" value="${userInfo.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">비밀번호</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" id="pass" placeholder="" maxlength="15">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">비밀번호 확인</label>
                        <div class="col-sm-3 check">
                            <input type="password" class="form-control" id="pass_re" placeholder="" maxlength="15">
                            <span class="duple check_pass glyphicon"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">이메일</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="email" placeholder="" value="${userInfo.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-offset-3 col-sm-2">주소</label>
                        <div class="col-sm-3" style="display: flex;">
                            <input type="text" class="form-control" id="address" placeholder="" value="${userInfo.address}">
               			<button class="btn" onclick="goPopup();" style="height: fit-content;">찾기</button>
                        </div>
                    </div>
                </div>
               	<div class="row" align="center">
                    <button class="btn" onclick="updateUserInfo();">수정</button>
                    <button class="btn" type="button" onclick="dropUser()">탈퇴</button>
                </div>
                <div class="col-sm-12 navigation" align="center">
					<div class="col-sm-1"></div>
					<div class="col-sm-4 line"></div>
					<div class="col-sm-2"><h3>결제 정보</h3></div>
					<div class="col-sm-4 line"></div>
				</div>  
                <div class="row pay" align="center">
                    	<div id="slideShow">
						    <ul class="slides">
						    	<c:forEach items="${cardList}" var="cardInfo">
			                    	<div class="slideBox">
			                    	<h3>card</h3>
			                    	<%-- ${cardInfo.ci_num1}-${cardInfo.ci_num2}-${cardInfo.ci_num3}-${cardInfo.ci_num4} --%>
									<h3>XXXX - 	XXXX - XXXX - ${cardInfo.ci_num4 }</h3>
									<button onclick="deleteCard(${cardInfo.ci_seq});">삭제</button>
									</div>
								</c:forEach>
						      	<c:forEach items="${accountList}" var="accountInfo">	
									<div class="slideBox">		
									<h3>account</h3>
									<h3>
									<c:forEach var="i" begin="0" end="${accountInfo.ai_num.length()-5}"> 
										*
									</c:forEach>
									${fn:substring(accountInfo.ai_num, accountInfo.ai_num.length()-4, accountInfo.ai_num.length()) }
									</h3>
									<button onclick="deleteAccount(${accountInfo.ai_seq});">삭제</button>
									</div>
								</c:forEach>
								<c:if test="${cardList.size() + accountList.size() < 5}">
									<div class="slideBox">
									<h3 class="card">+ CARD</h3>
	                    			<h3 class="account">+ ACCOUNT</h3>
	                    			</div>
								</c:if>
						    </ul>  
						    <p class="controller">
					      
					      <!-- &lang: 왼쪽 방향 화살표
					      &rang: 오른쪽 방향 화살표 -->
					      <span class="prev">&lang;</span>  
					      <span class="next">&rang;</span>
					    </p>
					  </div>
                </div>
            </div>
            
            <!-- 카드 & 계좌 모달창 -->
			<jsp:include page="modal.jsp" flush="false" />
			
	    </div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />

	<script>
	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount =  document.querySelectorAll('.slideBox').length; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	const slideWidth = 300; //한개의 슬라이드 넓이
	const slideMargin = 100; //슬라이드간의 margin 값

	//전체 슬라이드 컨테이너 넓이 설정
	//slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

	function moveSlide(num) {
	  slides.style.left = -num * 420 + 'px';
	  currentIdx = num;
	}

	prev.addEventListener('click', function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */

	  if (currentIdx !== 0) moveSlide(currentIdx - 1);
	});

	next.addEventListener('click', function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx !== slideCount - 1) {
	    moveSlide(currentIdx + 1);
	  }
	});
	</script>
	<!-- 스크립트 -->
    <!-- 사진 바꾸기 tooltip-->
	<script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
            });
    </script>

    <!-- 비밀번호 일치 확인-->
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
                Swal.fire({
                	  icon: 'error',
                	  title: '이미지만 등록 가능니다.',
                	})
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
	        	   Swal.fire({
	        		   icon: 'success',
	        		   title: '회원 정보 수정이 완료되었습니다.',
	        		 })
	        	   location.reload();
	           }
	           ,error: function (e) { 
	        	       Swal.fire({
                	  icon: 'error',
                	  title: '프로필 사진 업로드에 실패했습니다.',
                	})
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
			//alert("비밀번호 필드를 입력 해주세요.")
			Swal.fire({
			  icon: 'warning',
			  title: '비밀번호 필드를 입력 해주세요.',
				})
			$("#pass").focus();
			return;
		} else if (pass_re == null || pass_re == ""){
			//alert("비밀번호 확인 필드를 입력 해주세요.")
			Swal.fire({
			  icon: 'warning',
			  title: '비밀번호 확인 필드를 입력 해주세요.',
				})
			$("#pass_re").focus();
			return;
		} else if (pass.length < 6 || pass.length > 15){
			//alert("비밀번호는 6~15자리 내로 입력 해주세요.")
			Swal.fire({
			  icon: 'warning',
			  title: '비밀번호는 6~15자리 내로 입력 해주세요.',
				})
			return;
		} else if (pass != pass_re){
			//alert("비밀번호가 일치하지 않습니다.")
			Swal.fire({
			  icon: 'warning',
			  title: '비밀번호가 일치하지 않습니다.',
				})
			return;
		} else if (email == null || email == ""){
			//alert("이메일 필드를 입력 해주세요.")
			Swal.fire({
			  icon: 'warning',
			  title: '이메일 필드를 입력 해주세요.',
				})
			$("#email").focus();
			return;
		} else if (address == null || address == ""){
			//alert("주소 필드를 입력 해주세요.")
			Swal.fire({
			  icon: 'warning',
			  title: '주소 필드를 입력 해주세요.',
				})
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
						//alert("회원 정보 수정이 완료되었습니다.");
						//location.reload();
						Swal.fire({
   						  icon: 'success',
   						  title: '회원 정보 수정이 완료되었습니다.',
   						}).then((value) => {
   	  						if (value) {
   	  						location.reload();
   	  						}
   	  					});
					}
				} else {
					//alert("회원 정보 수정이 실패하였습니다.");
					Swal.fire({
 						  icon: 'error',
 						  title: '회원 정보 수정이 실패하였습니다.',
 						})
				}		
			}.bind(this),
			error:		function(data) {
				// alert("회원 정보 수정이 실패하였습니다.");
				Swal.fire({
					  icon: 'error',
					  title: '회원 정보 수정이 실패하였습니다.',
					})
			}
		});

	}
	
	/// 회원 탈퇴 ///
	function dropUser() {
		 Swal.fire({
  			   title: '탈퇴하시겠습니까 ?',
  			   text: '되돌릴 수 없습니다.',
  			   icon: 'warning',
  			   
  			   showCancelButton: true, // cancel버튼을 표시함
  			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
  			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
  			   confirmButtonText: '진행', // confirm 버튼 텍스트 지정
  			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
  			   
  			}).then(result => { // 확인 or 취소 버튼을 눌렀을 경우 후속 동작
	  			if (result.isConfirmed) { // cofirm 창에서 확인을 눌렀을 경우
	  			$.ajax({
				type:		"POST",
				url:		"/myPage/dropUser.do",
				data:		{"id": $("#id").val()},
				success:	function(data) {
					if(data == "Y") {
						//alert("회원탈퇴가 완료되었습니다");
						//location.href = "/logout.do";
						Swal.fire({
	  						  icon: 'success',
	  						  title: '회원탈퇴가 완료되었습니다.',
	  						}).then((value) => {
	  	  						if (value) {
	  	  							location.href = "/logout.do";
	  	  						}
	  	  					});
					}
					if(data == "N") {
					// alert("탈퇴하지 못했습니다");
					Swal.fire({
						  icon: 'error',
							  title: '탈퇴하지 못했습니다',
							});
					}
				}, //success:	function(data) 끝
				error:		function(data) {
					//alert("오류발생");
					Swal.fire({
						  icon: 'error',
							  title: '오류발생',
						});}
				}); // $.ajax 끝
			} //if (result.isConfirmed)끝
		}); //.then(result)  끝
	 }// function dropUser()끝
	
	/// 다음 API ///
	function goPopup(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#address").val(data.address + " ");
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }.bind(this)
	    }).open();
	}
	
	
	/// 카드 & 계좌 삭제 ///
	function deleteCard(seq) {
		var id      = $("#id").val();
		$.ajax({
			type:		"POST",
			url:		"/myPage/deleteCard.do",
			data:		{id: id, ci_seq: seq},
			success:	function(data) {
				//alert("등록된 카드정보를 삭제하였습니다.");
				//location.reload();
				Swal.fire({
						  icon: 'success',
						  title: '등록된 카드정보를 삭제하였습니다.',
						}).then((value) => {
	  						if (value) {
	  						location.reload();
	  						}
	  					});
			},
			error:		function(data) {
				//alert("error");
				Swal.fire({
					  icon: 'error',
					  title: '카드정보 삭제에 실패했습니다.',
					})
			}
		});
	}
	function deleteAccount(seq) {
		var id      = $("#id").val();
		$.ajax({
			type:		"POST",
			url:		"/myPage/deleteAccount.do",
			data:		{id: id, ai_seq: seq},
			success:	function(data) {
				//alert("등록된 계좌정보를 삭제하였습니다.");
				//location.reload();
				Swal.fire({
					  icon: 'success',
					  title: '등록된 계좌정보를 삭제하였습니다.',
					}).then((value) => {
						if (value) {
						location.reload();
						}
					});
			},
			error:		function(data) {
				//alert("error");
				Swal.fire({
					  icon: 'error',
					  title: '계좌정보 삭제에 실패했습니다.',
					})
			}
		});
	}
	</script>
    
</body>
</html>