<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
	.navbar {				
	position:	sticky;	/* 메뉴바 상단 고정 */
	top:		0;		/* 메뉴바 상단 0 */
	z-index: 100;		/* 메뉴바가 최상위에 위치하도록함 */
	height: 50px;
    background-color: white;
    margin-bottom: 0;
	}
	.navprofile-img {
       width: 40px;
       height: 40px;
       margin-top: 4px;
    }
    .navprofile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .navopacity {
	    position: absolute;
	    top: 0;
	    background-color: #fff;
	    opacity: 0;
	    transition: 0.3s;
	}
	.navopacity:hover {
	    cursor: pointer;
	    opacity: 0.4;
	}
</style>
<script>
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>

<nav class="navbar">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <c:choose>
		<c:when test="${isLogin == null}">
			<li><a href="/myPage/myPage">마이페이지</a></li>
	        <li><a href="/login.do">LOGIN</a></li>
		</c:when>
		<c:when test="${isLogin == true}">
			<li onclick="location.href='${contextPath}/myPage/myPage';" class="navprofile-img" data-toggle="tooltip" title="마이페이지" data-placement="bottom">
				<img src="${contextPath}/${profile}" class="img-circle navprofile">
				<div class="navopacity img-circle navprofile"></div>
            </li>
			<li><a href="/logout.do">Logout</a></li>
		</c:when>
		</c:choose>
      </ul>
    </div>
  </div>
</nav>