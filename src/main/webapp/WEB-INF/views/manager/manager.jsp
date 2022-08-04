<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 화면</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	#paginationBox{
		padding : 10px 0px;
	}
	td, th, h2, h3 {
		text-align : center;
	}
</style>
 
</head>

<body>
	<article>
	<div class="container">
		
		<!-- Menu form {s} -->
		<h2 class="mb-3">관리자 페이지</h2>
		<div>
		<!-- 상단 메뉴 -->

			<form:form name="form" id="form" role="form" modelAttribute="menuVO" method="post" action="${pageContext.request.contextPath}/menu/saveMenu">
				<form:hidden path="mid" id="mid"/>
				
				<div class="row">
					<div class="col-md-4 mb-3">
						<label for="code">새로 가입한 회원수</label>
						<form:input path="code" id="code" class="form-control"  placeholder="" value="" required="" />
						<div class="invalid-feedback">
							35명
						</div>
					</div>
					<div class="col-md-5 mb-3">
						<label for="codename">오늘 방문자 수</label>
						<form:input path="codename" class="form-control" id="codename" placeholder="" value="" required="" />
						<div class="invalid-feedback">
							1174명
						</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="sort_num">오늘 펀딩 총 금액</label>
						<form:input path="sort_num" class="form-control" id="sort_num" placeholder="" required="" />
						<div class="invalid-feedback">
							5,410,560원
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 mb-3">
						<label for="comment">회원탈퇴요청</label>
						<form:input path="comment" class="form-control" id="comment" placeholder="" value="" required="" />
					</div>
				</div>
				
			</form:form>
		</div>
		<!-- Menu form {e} -->
		
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">승인</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnDelete">거절</button>
			
		</div>
		
		<h3 class="mb-3" style="padding-top:15px">판매자가 신청한 프로젝트 목록</h3>
		
		<!-- List{s} -->
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width:15%;" />
					<col style="width:10%;" />
					<col style="width:40%;" />
					<col style="width:10%;" />
					<col style="width:5%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>받은 프로젝트명</th>
						<th>아이디</th>
						<th>내용</th>
						<th>신청날짜</th>
						<th>용량</th>
						<th>읽음상태</th>
					</tr>
				</thead>
				<tbody id="menuList">
				</tbody>
			</table>
		</div>
		<!-- List{e} -->
		
		
	</div>
	</article>

</body>
</html>

















