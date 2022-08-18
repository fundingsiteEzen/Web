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
	<title>창작 등록 페이지</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
</head>

<body>
<jsp:include page="../menu/navigation.jsp" flush="false" />
<div class = "admin_content_wrap">	
	<div class = "admin_content_subject"><h1>창작 등록 페이지</h1></div>
			<div class="admin_content_main">
                    	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>영화 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="movieName">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>창작자</label>
                    			</div>
                    			<div class="form_section_content">
                    				ID <input name="creater" value="">
                    			</div>
                    		</div>            
                    		</form>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>프로젝트 소개글 작성 및 수정</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea id="fundingProjectIntroduction" class="input" placeholder="프로젝트 진행 계기, 상세 내용, 집행 계획 등을 구체적으로 작성 부탁드립니다." maxlength="500"></textarea>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>창작물 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input type='radio' name='category' value='spring' />봄
  									<input type='radio' name='category' value='summer' />여름
  									<input type='radio' name='category' value='autumn' />가을
  									<input type='radio' name='category' value='winter' />겨울
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>리워드 설정</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="reward" value="0">
                    			</div>
                    		</div> 
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>목표금액</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="TargetAmount" value="0">
                    			</div>
                    		</div>                          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>프로젝트 기간</label>
                    			</div>
                    			<div class="form_section_content">
                    				프로젝트 시작일<input name="projectPeriod">
                    			</div>
                    			<div class="form_section_content">
                    				프로젝트 종료일<input name="projectPeriod">
                    			</div>
                    		</div> 
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>결제 예정일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="paymentScheduledDate" value="0">
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>메인이미지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input type=file name="mainPicture">
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상세이미지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input type=file name="detailPictures">
                    				<input type=file name="detailPictures">
                    				<input type=file name="detailPictures">
                    			</div>
                    		</div> 
                            <div class="btn_section">
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    	</div> 
                     
 </div>

<style type="text/css">

/* 관리자 컨텐츠 제목 영역 */
.admin_content_subject{
	font-size: 20px;
    font-weight: bolder;
    padding-left: 15px;
    background-color: #6AAFE6;
    height: 80px;
    line-height: 80px;
    color: white;
}
/* 관리자 컨텐츠 메인 영역 */
.form_section{
	width: 95%;
    margin-left: 2%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form_section_title{
	padding: 20px 35px;	
}
.form_section_title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}
.form_section_content{
	padding: 20px 35px;
    border-top: 1px solid #dbdde2;
    
}
.input{
	width: 98%;
	height: 160px;
    border: 1px solid #ddd;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form_section_content input{
	width: 30%;
    height: 25px;
    font-size: 20px;
    padding: 0px 1%;
}
.form_section_content select{
	width: 98%;
    height: 35px;
    font-size: 20px;
    text-align-last: center;
}
.


/* 버튼 영역 */
.btn_section{
	text-align: center;
	margin: 80px 0;
}
.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}
.enroll_btn{
	background-color: #dbdde2;
	margin-left:15px;
}
#enrollBtn:hover {
    background-color: #c9cbd0;
}
</style>	
</body>
</html>