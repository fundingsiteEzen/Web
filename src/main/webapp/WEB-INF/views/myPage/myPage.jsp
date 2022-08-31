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
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@300;400;500&display=swap');
        * {
            margin: 0 auto;
            padding: 0;
            list-style: none;
            font-family: 'Hahmlet', serif;}
        .bg-image {
            background-image: url('${contextPath}/images/MAIN_img/summer.jpg');
            background-attachment: fixed;
            height: 300px;
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

		.nav_box{
			height: 1000px;
		}
        .my_nav {
            padding-top: 60px;
            top: 1px;
  	        position:sticky;
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
        
        /* 관심목록 css(수정아직 안함) */
		.col-sm-4 {
		height:	300px;
		cursor: pointer;
		margin-bottom: 40px;
		}
		
		/* 후원목록 css */
        .thumbnail {
            border-radius: 0;
            margin: 0;
            margin-bottom: 40px;
            transition: 0.25s;
            cursor: pointer;
        }
        .thumbnail:hover {
        	box-shadow: 0 0 13px rgba(0,0,0, 0.2);
        }

        .img_box {
            height: 200px;
            padding: 0;
            overflow: hidden;
            
        }
        .img_box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: scale(1);
			transition: all 0.3s ease-in-out;
			overflow: hidden;
        }
        .img_box img:hover {
        	transform: scale(1.15);
        }
        .info_box {
            display: inline-block;
        }
        .delete_btn {margin-top: 10px;}
        
	</style>
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
            	<!-- 왼쪽 영역(프로필사진, nav바 -->
                <div class="col-sm-3 aisde">
                    <aside>
                        <div class="profile-img">
                            <img src="${contextPath}/images/SUB/detail01.jpg" class="img-circle profile">
                        </div>
                        <div class="nav_box" align="center">
                            <ul class="my_nav">
                                <li class="fund">후원 목록</li>
                                <li class="like">관심 목록</li>
                                <li class="my">내 프로젝트</li>
                            </ul>
                        </div>
                    </aside>
                </div>
                <!-- 오른쪽 영역(닉네임, 썸네일 목록) -->
                <div class="col-sm-9 section">
                    <div class="nickname">
                        <h3>${nickName}&nbsp;&nbsp;<span class="glyphicon glyphicon-cog" onclick="location.href='/myPage/mymy.do'" style="font-size:0.8em; color:#aaa;" data-toggle="tooltip" title="정보 수정"></span></h3>
                    </div>
                    <!-- 후원 목록 띄우기 -->
                    <section class="fund_list">
						<c:forEach items="${backList}" var="list" varStatus="status">
						<div class="thumbnail row" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
                            <div class="img_box col-sm-5">
                                <img src="${contextPath}/images/thumnail/${list.p_thumb}"/>
                            </div>
                            <div class="col-sm-7 info_span">
                                <h3>${list.p_name}</h3>
                                <span>${rewardList[status.index].r_content}</span><br>
                                <div align="right">
                                    <span>+ 추가 후원 ${addMoney[status.index]} 원</span><br>
                                    <span style="font-size: 24px;">${rewardList[status.index].r_price + addMoney[status.index]} 원</span><br>
                                </div>
                                <div align="center">
                                    <span>결제예정일 ${list.p_payDate}</span><br>
                                    <button class="btn delete_btn" onclick="deleteBACK(${list.p_seq}, ${rewardList[status.index].r_seq}, ${rewardList[status.index].r_price + addMoney[status.index]})">취소하기</button>
                                </div>
                            </div>
                        </div>
						</c:forEach>
                    </section>
                    <!-- 관심 목록 띄우기 -->
                    <section class="like_list">
                        <c:forEach items="${likeList}" var="list" varStatus="status">
						<div class="col-sm-4">
							<div align="center" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
								<div style="overflow: hidden; height:80%">
									<img class="img-responsive center-block" src="${contextPath}/images/thumnail/${list.p_thumb}" height="100%"/>
								</div>
								<div>
									<h4>${list.p_name}<br/></h4><h5 style="color: rgb(250,50,0);">종료일: ${list.p_endDate}</h5>
								</div>
							</div>
							<button onclick="deleteProject(${list.p_seq}, 'Y')">삭제</button>
						</div>
						</c:forEach>

                    </section>
                    <section class="my_list">
                    	<!-- 등록된 페이지가 없을경우 -->
                    	<div align="center">등록한 프로젝트가 없습니다<br>
	                    	<a href="/crpage/cr">프로젝트 등록하기</a>
                    	</div>
                    	<!-- 등록된 페이지가 있을 경우 -->
                    	<c:forEach items="${myList}" var="list" varStatus="status">
							<div class="col-sm-4">
								<div align="center" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
									<div style="overflow: hidden; height:80%">
										<img class="img-responsive center-block" src="${contextPath}/images/thumnail/${list.p_thumb}" height="100%"/>
									</div>
									<div>
										<h4>${list.p_name}<br/></h4><h5 style="color: rgb(250,50,0);">종료일: ${list.p_endDate}</h5>
									</div>
								</div>
								<button onclick="deleteMyProject(${list.p_seq})">삭제</button>
							</div>
						</c:forEach>
                    </section>
                </div>
            </div>
            
        </div>
    </div>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
	<script>
	$(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        });
	// 후원 목록
	$(".fund").click(function() {
        $(".fund_list").css("display", "block");
        $(".like_list").css("display", "none");
        $(".my_list").css("display", "none");
    });
	// 관심 목록
	$(".like").click(function() {
        $(".like_list").css("display", "block");
        $(".fund_list").css("display", "none");
        $(".my_list").css("display", "none");
    });
	// 내 프로젝트
	$(".my").click(function() {
        $(".my_list").css("display", "block");
        $(".fund_list").css("display", "none");
        $(".like_list").css("display", "none");
    });
	</script>
	
	<!-- 삭제버튼 -->

	<script>
	// 관심목록 삭제
	function deleteProject(p_seq, is_like) {
	   event.stopPropagation();
		var chk = confirm("관심목록에서 삭제하시겠습니까 ?");
		if (chk) {
			$.ajax({
				type: "POST",
				url: "/myPage/delete.do",
				data: {p_seq: p_seq, is_like: is_like},
				success: function(data) {
					if(data == "Y") {
						alert("삭제되었습니다");
						location.href = "/myPage/myPage";
						Swal.fire({
	  						  icon: 'success',
	  						  title: '취소가 완료되었습니다.',
	  						  showConfirmButton: false,
	  						  timer: 1500
	  						}).then((value) => {
 	  				 	if (value) {
 	  					location.href = "/myPage/myPage";
 	  					}
	  				});
					}
				},
				error: function(data) { 	
					Swal.fire({
					icon: 'error',
					title: '문제가 발생했습니다',
					}); }
			});
		}
	}
	
	function deleteBACK(p_seq, r_seq, p_total) {
		   event.stopPropagation();
			var chk = confirm("정말 취소하시겠습니까 ?");
			if (chk) {
				$.ajax({
					type: "POST",
					url: "/myPage/deleteBack.do",
					data: {p_seq: p_seq, r_seq: r_seq, p_total: p_total},
					success: function(data) {
						if(data == "Y") {
							alert("취소가 완료되었습니다");
							location.href = "/myPage/myPage";
						}
					},
					error: function(data) { alert("에러발생"); }
				});
			}
		}
	
	// 내 프로젝트 삭제
		function deleteMyProject(p_seq) {
	   event.stopPropagation();
		var chk = confirm("등록한 프로젝트를 삭제하시겠습니까 ?");
		if (chk) {
			$.ajax({
				type: "POST",
				url: "/myPage/deleteMyProject.do",
				data: {p_seq: p_seq},
				success: function(data) {
					if(data == "Y") {
						alert("삭제되었습니다");
						location.href = "/myPage/myPage";
						Swal.fire({
	  						  icon: 'success',
	  						  title: '취소가 완료되었습니다.',
	  						  showConfirmButton: false,
	  						  timer: 1500
	  						}).then((value) => {
 	  				 	if (value) {
 	  					location.href = "/myPage/myPage";
 	  					}
	  				});
					}
				},
				error: function(data) { 	
					Swal.fire({
					icon: 'error',
					title: '문제가 발생했습니다',
					}); }
			});
		}
	}
</script>
</body>
</html>