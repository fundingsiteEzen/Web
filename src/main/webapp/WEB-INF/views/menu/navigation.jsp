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
	}
</style>

<nav class="navbar">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">HOME</h1></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/crpage/cr">판매등록페이지</a></li>
        <li><a href="/myPage/myInfo">회원정보 관리</a></li>
        <li><a href="/myPage/myPage">마이페이지</a></li>
        <li><a href="/login.do">로그인</a></li>
      </ul>
    </div>
  </div>
</nav>