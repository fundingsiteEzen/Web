<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여름 목록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	
	<style>
		h1 {
		margin-top:		80px;
		margin-bottom:	80px;
		}
		
		#category {
		margin:				10px;
		display:			inline-block;
		height:				300px;
		width:				250px;
		}
		
	</style>

</head>
<body>

<!-- 상단 메뉴바 -->
<jsp:include page="../menu/navigation.jsp" flush="false" />

<!-- 상단 카테고리 제목 -->
<div align="center">
	<h1><b>여름에 보기 좋은 영화</b></h1><hr><br><br>
</div>


<!-- boardList, seatReservation 참고해서 나열하기 -->

<!-- 게시물마다 표지, 프로젝트 이름(p_name)띄우기 -->
<div class="container">
	<c:forEach items="${SummerList}" var="list" varStatus="status">
		<!-- 고유번호(seq)페이지로 이동 -->
		<div align="center" id="category" onclick="location.href='${contextPath}/subPage/detail?p_seq=${list.p_seq}';" style="cursor:pointer;">
			<div style="overflow: hidden; height:80%">
				<img class="img-responsive center-block" src="${contextPath}/images/thumnail/${list.p_thumnail_img}" height="100%"/>
			</div>
			<div>
				<h4>${list.p_name}<br/></h4><h5 style="color: rgb(250,50,0);">종료일: ${list.p_endDate}</h5>
			</div>
		</div>
		
		<!-- 게시물 한줄에 4개씩 정렬 -->
		<c:choose>
			<c:when test="${status.count % 4  == 0}">
				<br/>
			</c:when>
		</c:choose>	
	</c:forEach>
</div>


</body>
</html>