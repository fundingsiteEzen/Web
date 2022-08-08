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
	<title>Insert title here</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.c_header {
padding-bottom: 43px;
}

.my_lnb_item[aria-current=true] {
font-weight: 700;
color: #202020;
}

.my_lnb_item:first-child {
margin-top: 0;
}

.my_lnb_item {
display: block;
position: relative;
margin-top: 49px;
font-family: NanumSquareWebFont, dotum, Sans-serif;
font-size: 17px;
text-decoration: none;
color: inherit;
}

.my_lnb_wrap {
margin: 120px 0;
float: left;
}

.my_lnb {
padding: 48px 34px 44px 32px;
border: 1px solid #dcdcdc;
background-color: #fafafa;
}

.tbl_model {
position: relative;
width: 100%;
table-layout: fixed;
border-spacing: 0;
border-collapse: collapse;
word-wrap: break-word;
word-break: keep-all;
border: 0;
border-bottom: 1px solid #e5e5e5;
}

.tbl_model th {
color: #333;
border-right: 1px solid #e5e5e5;
background: #f9f9f9;
}

.tbl_model td,
.tbl_model th {
line-height: 14px;
text-align: left;
vertical-align: top;
letter-spacing: -1px;
border: 0;
border-top: 1px solid #e5e5e5;
}

.tbl_model .thcell {
padding: 32px 31px 32px;
}

.tbl_model td {
color: #565656;
}

.tbl_model .contxt_webctrl {
font-size: 0;
line-height: 0;
position: relative;
overflow: hidden;
margin-left: -8px;
padding: 13px 0 5px;
color: #666;
}

fieldset,
img {
border: 0;
}

.tbl_model .tdcell .contxt_webctrl .btn_model,
.tbl_model .contxt_webctrl .country_drop,
.tbl_model .contxt_webctrl input,
.tbl_model .contxt_webctrl_box .btn_model {
margin-left: 25px;
}

.tbl_model {
padding: 50;
}

.tbl_model .tdcell {
padding: 10px 0 10px 30px;
}

.tbl_model+.btn_wrap {
margin-top: 30px;
}

.btn_wrap {
overflow: hidden;
text-align: center;
}

.btn_wrap .btn_model {
margin: 0 2px;
}

.btn_model {
font-size: 12px;
line-height: 14px;
display: inline-block;
vertical-align: top;
text-decoration: none !important;
}

.btn_model {
border: 1px solid #bfbfbf;
background: #fff;
}

.btn_model .btn1,
.btn_model .btn2,
.btn_model .btn3 {
min-width: 52px;
min-height: 21px;
line-height: 15px;
padding: 8px 18px;
color: #a3a3a3;
box-sizing: border-box;
}

.btn_model b,
.btn_model>em,
.btn_model>span {
display: inline-block;
overflow: hidden;
text-align: center;
vertical-align: top;
letter-spacing: -1px;
}

.payment_plus {
font-weight: bold;
position: relative;
min-height: 20px;
font-size: 16px;
line-height: 8px;
letter-spacing: -0.025em;
margin: 0px 0px 14px;
padding: 15px 0px 0px;
}

.payment_type {
border-width: 1px 0px;
border-style: solid;
border-color: rgb(230, 230, 230);
border-image: initial;
margin-left: -2px;
margin-right: -5px;
margin-top: -2px;
min-height: 200px;
display: flex;
-webkit-box-pack: center;
justify-content: center;
-webkit-box-align: center;
align-items: center;
color: rgb(189, 189, 189);
font-size: 15px;
line-height: 27px;
letter-spacing: -0.01em;
}

.payment {
padding: 18px 16px;
}

.payBtn {
cursor: pointer;
display: inline-flex;
-webkit-box-align: center;
align-items: center;
-webkit-box-pack: center;
justify-content: center;
height: 52px;
white-space: nowrap;
border-radius: 1px;
margin: 0px;
outline: 0px;
box-sizing: border-box;
font-weight: normal;
padding: 0px 24px;
border: 1px solid rgb(230, 230, 230);
background-color: rgb(255, 255, 255);
color: rgb(109, 109, 109);
}
</style>

</head>

<body>
<jsp:include page="../menu/navigation.jsp" flush="false" />
    <div class="wrap">
        <div class="my_lnb_wrap" id="myLnb">
            <div id="lnb" class="my_lnb" role="menu">
                <a href="" role="menuitem" class="my_lnb_item" id="lnb_infor" aria-current="true">회원정보 관리</a>
                <a href="" role="menuitem" class="my_lnb_item" id="lnb_pay" aria-current="true">결제정보 관리</a>
                <a href="" role="menuitem" class="my_lnb_item" id="lnb_my_funding" aria-current="true">내 펀딩 목록</a>
                <a href="" role="menuitem" class="my_lnb_item" id="lnb_project" aria-current="true">프로젝트 등록</a>
            </div>
        </div>
        <div class="c_header">
            <h2>회원 정보관리</h2>
            <p class="contxt">회원 비밀번호, 닉네임을 수정 하실 수 있습니다.</p>
        </div>
        <fieldset>
            <table class="tbl_model">
                <colgroup>
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tr>
                    <th scope="row">
                        <div class="thcell">
                            <label for="inpNickname">비밀번호 변경</label>
                        </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p><input type="password" name="current_password" style="width:254px"
                                    placeholder="현재 비밀번호" required></p>
                            <p><input type="password" name="new_password" style="width:254px" placeholder="새 비밀번호"
                                    required></p>
                            <p><input type="password" name="new_password_confirm" style="width:254px"
                                    placeholder="새 비밀번호 확인" required></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
                            <label for="inpNickname">닉네임</label>
                        </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p>
                                <input type="text" name="nickname" id="inpNickname" style="width:254px"
                                    placeholder="닉네임" required>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
                            <label for="inpNickname">결제수단</label>
                        </div>
                    </th>
                    <td>
                        <div class="payment_type">
                            등록된 결제수단이 없습니다.<br>결제수단을 추가해주세요.
                        </div>
                        <div class="payment">
                            <div class="payment_plus">결제수단 추가 </div>
                            <button class="payBtn" color="gray10">신용/체크 카드 등록</button>
                            <button class="payBtn" color="gray10">은행계좌 등록</button>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="btn_wrap">
                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable"
                        onclick="clickcr(this,'prf.apply','','',event);">적용</b></a>
                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2"
                        onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
            </div>
        </fieldset>
    </div>
</body>
</html>