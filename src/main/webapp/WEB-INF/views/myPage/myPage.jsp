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
        
        /* 프로젝트 목록 */
		.col-sm-4 {
		height:	300px;
		cursor: pointer;
		margin-bottom: 40px;
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
            	<!-- 왼쪽 영역(프로필사진, nav바 -->
                <div class="col-sm-3 aisde">
                    <aside>
                        <div class="profile-img">
                            <img src="${contextPath}/images/SUB/detail01.jpg" class="img-circle profile">
                        </div>
                        <div align="center">
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
                        <h3>닉네임<span onclick="location.href='/myPage/mymy.do'">(수정go)</span></h3>
                    </div>
                    <!-- 후원 목록 띄우기 -->
                    <section class="fund_list">
						<c:forEach items="${backList}" var="list" varStatus="status">
						<div class="col-sm-4">
							<div align="center" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
								<div style="overflow: hidden; height:80%">
									<img class="img-responsive center-block" src="${contextPath}/images/thumnail/${list.p_thumnail_img}" height="100%"/>
								</div>
								<div>
									<h4>${list.p_name}<br/></h4><h5 style="color: rgb(250,50,0);">종료일: ${list.p_endDate}</h5>
								</div>
							</div>
							<button onclick="deleteProject(${list.p_seq}, 'N')">삭제</button>
						</div>
						</c:forEach>
                    </section>
                    <!-- 관심 목록 띄우기 -->
                    <section class="like_list">
                        <c:forEach items="${likeList}" var="list" varStatus="status">
						<div class="col-sm-4">
							<div align="center" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';">
								<div style="overflow: hidden; height:80%">
									<img class="img-responsive center-block" src="${contextPath}/images/thumnail/${list.p_thumnail_img}" height="100%"/>
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
                    	<div align="center">등록한 프로젝트가 없습니다<br>
	                    	<a href="/crpage/cr">프로젝트 등록하기</a>
                    	</div>
                    </section>
                </div>
            </div>
            
        </div>
    </div>
	
	<!-- 푸터 -->
	<jsp:include page="../menu/footer.jsp" flush="false" />
	
	<script>
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
	function deleteProject(p_seq, is_like) {
		var chk = confirm("정말 취소하시겠습니까?");
		if (chk) {
			$.ajax({
				type: "POST",
				url: "/myPage/delete.do",
				data: {p_seq: p_seq, is_like: is_like},
				success: function(data) {
					if(data == "Y") {
						alert("취소가 완료되었습니다");
						location.href = "/myPage/myPage.do";
					}
				},
				error: function(data) { alert("에러발생"); }
			});
		}
	}	
</script>
</body>
</html>