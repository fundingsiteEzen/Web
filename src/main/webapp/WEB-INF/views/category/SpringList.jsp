<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>봄 목록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
</head>
<body>

<h4><b>봄에 보기 좋은 영화</b></h4>

<!-- boardList, seatReservation 참고해서 나열하기 -->

<!-- 표지(?), 제목(p_name), 창작자 이름(c_name) -->
<c:forEach items="${SpringList}" var="list">

	<!-- 고유번호(seq)페이지로 이동 -->
	<a href="#">${list.p_name}<br/>${list.p_name}</a>
	
</c:forEach>

<c:choose>
	<c:when test="${status.count % 5  == 0}">
		<br/>
	</c:when>
</c:choose>

</body>
</html>