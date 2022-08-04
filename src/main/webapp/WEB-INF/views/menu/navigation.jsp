<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fund/subPage/detail">상세</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">마이페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">판매등록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">관리자</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fund/login.do">로그인</a>
        </li>
      </ul>
    </div>
  </div>
</nav>