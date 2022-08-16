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
padding: 20px 0 10px 30px;
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

.payBtnCash {
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
.payBtnCard {
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
.nick {
margin-bottom: -10px;
}


.modal{
    position: fixed; 
    top:0; 
    left:0; 
    width: 100%; 
    height: 100%; 
    z-index: 100;
    display: none; 
    background: rgba(0,0,0,0.7);
}
.modal .inner{
    width: 620px; 
    height: 600px;
    background: #fff; 
    position: absolute; 
    left: 50%; 
    top: 50%; 
    transform: translate(-50%, -55%); 
    overflow: scroll;
}




.cardSubT {
    color: rgb(61, 61, 61);
    margin: 0px 0px 10px;
}
.cardBody {
    width: auto;
}
.cardNum {
    border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    display: flex;
    padding: 0px 12px;
    -webkit-box-align: center;
    align-items: center;
}
.inCardNum {
    border: 0px;
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 12px;
    max-height: 44px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 1px;
}
.jMWjNk {
    margin: 0px 10px 0px 0px;
}
.cardNum input {
    max-width: 45px;
}
.pwdCardNum {
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
    opacity: 0.8;
}
.textCardNum {
    /* width: 100%; */
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
    opacity: 0.8;
}

.cardLife {
    margin: 20px 0px 0px;
    margin-right: 12px;
}

.cLifeDetail {
    display: inline-flex;
    position: relative;
    border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    background: rgb(255, 255, 255);
    color: rgb(13, 13, 13);
    height: 44px;
    margin-right: 12px;
}
.selDetail {
    display: flex;
    -webkit-box-flex: 1;
    flex-grow: 1;
    outline: 0px;
    -webkit-box-align: center;
    align-items: center;
    margin: 0px;
    padding: 0px 15px 0px 12px !important;
    border: 0px !important;
    background: transparent !important;
    border-radius: 0px !important;
    box-shadow: none !important;
}
.cardBox .cardGap {
    margin-bottom: 32px;
    margin-top: 0px;
}
.cardInfo {
    border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 1px;
}
.modalBtn {
    width: 49%;
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
    border: 1px solid rgb(230, 230, 230);
    outline: 0px;
    font-weight: bold;
    box-sizing: border-box;
    padding: 0px 24px;
    background-color: rgb(255, 87, 87);
    color: rgb(255, 255, 255);
}


.paymentCard {
    margin-left: 10px;
    margin-right: 10px;
}

.title {
font-weight: bold;
position: relative;
min-height: 36px;
font-size: 24px;
line-height: 36px;
letter-spacing: -0.025em;
margin: 0px 0px 24px;
padding: 38px 0px 0px;
}
.selectBank .sub {
    margin-bottom: 32px;
}
.subTitle {
    color: rgb(61, 61, 61);
    margin: 0px 0px 10px;
}
.bankList {
    display: inline-flex;
    position: relative;
    border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    background: rgb(255, 255, 255);
    color: rgb(13, 13, 13);
    height: 44px;
    width: 100%;
}
.selectList {
    display: flex;
    -webkit-box-flex: 1;
    flex-grow: 1;
    outline: 0px;
    -webkit-box-align: center;
    align-items: center;
    margin: 0px;
    padding: 0px 36px 0px 12px !important;
    border: 0px !important;
    background: transparent !important;
    border-radius: 0px !important;
    box-shadow: none !important;
}
.inputBox {
    border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 1px;
}
.inputDetail {
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
    opacity: 0.8;
}

.paymentCash {
margin-left: 10px;
margin-right: 10px;
}
/* '회원정보 관리' fiedset */
.userinfo {
    display: none;
}
/* '내 펀딩 목록' fiedset */
.myfunding {
    display: block;
}

</style>

</head>

<body>
<!-- 네비게이션 바 -->
<jsp:include page="../menu/navigation.jsp" flush="false" />
    <div class="wrap">
    <!-- 왼쪽 메뉴 -->
        <div class="my_lnb_wrap" id="myLnb">
            <div id="lnb" class="my_lnb" role="menu">
                <a href="#" role="menuitem" class="my_lnb_item" id="lnb_infor" aria-current="true">회원정보 관리</a>
                <a href="#" role="menuitem" class="my_lnb_item" id="lnb_pay" aria-current="true">결제정보 관리</a>
                <a href="#" role="menuitem" class="my_lnb_item" id="lnb_my_funding" aria-current="true">내 펀딩 목록</a>
                <a href="#" role="menuitem" class="my_lnb_item" id="lnb_project" aria-current="true">프로젝트 등록</a>
            </div>
        </div>
        <div class="c_header">
            <h2>회원 정보관리</h2>
        </div>
        <fieldset class="userinfo">
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
                            <p><input id="newPwd" type="password" name="new_password" style="width:254px" placeholder="새 비밀번호"
                                    required></p>
                            <p><input id="newPwd2" type="password" name="new_password_confirm" style="width:254px"
                                    placeholder="새 비밀번호 확인" required></p>
                                    <font id="ckpwd" size="2"></font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
                        <div class="nick">
                            <label for="inpNickname">닉네임</label>
                        </div>
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
                            <button class="payBtnCard" data-target="#CardModal" data-toggle="modal"> 신용/체크 카드 등록</button>
                            <!--카드 모달창-->
                            <div class="modal" id="CardModal">
                                <div class="inner">
                                    <div class="paymentCard">
                                        <div class="title">신용/체크 카드 등록</div>
                                        <div class="cardBox">
                                            <div class="cardGap">
                                                <div class="cardSubT">카드번호</div>
                                                <div class="cardBody">
                                                    <div class="cardNum">
                                                    <span class="inCardNum">
                                                    <input type="text" inputmode="numeric" pattern="[0-9]*" placeholder="0000" maxlength="4" autocomplete="off" autocapitalize="off" class="textCardNum" value="">
                                                    </span>
                                                    <span class="jMWjNk">-</span>
                                                    <span class="inCardNum">
                                                    <input type="password" inputmode="numeric" pattern="[0-9]*" placeholder="0000" maxlength="4" autocomplete="off" autocapitalize="off" class="pwdCardNum" value="">
                                                    </span>
                                                    <span class="jMWjNk">-</span>
                                                    <span class="inCardNum">
                                                    <input type="password" inputmode="numeric" pattern="[0-9]*" placeholder="0000" maxlength="4" autocomplete="off" autocapitalize="off" class="pwdCardNum" value="">
                                                    </span>
                                                    <span class="jMWjNk">-</span>
                                                    <span class="inCardNum">
                                                    <input type="text" inputmode="numeric" pattern="[0-9]*" placeholder="0000" maxlength="4" autocomplete="off" autocapitalize="off" class="textCardNum" value="">
                                                    </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="cardGap">
                                            <div class="cardSubT">카드 유효기간</div>
                                            <div class="cardBody">
                                                <div class="cardLife">
                                                    <div class="cLifeDetail">
                                                        <select class="selDetail">
                                                        <option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">4월</option><option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option><option value="09">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
                                                        </select>
                                                    </div>
                                                    <div class="cLifeDetail">
                                                        <select class="selDetail">
                                                        <option value="22">2022</option><option value="23">2023</option><option value="24">2024</option><option value="25">2025</option><option value="26">2026</option><option value="27">2027</option><option value="28">2028</option><option value="29">2029</option><option value="30">2030</option><option value="31">2031</option><option value="32">2032</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cardGap">
                                            <div class="cardSubT">카드 비밀번호 앞 2자리</div>
                                            <div class="cardBody">
                                                <span class="cardInfo">
                                                <input type="password" inputmode="numeric" pattern="[0-9]*" placeholder="앞 2자리를 입력해주세요." maxlength="2" autocomplete="off" autocapitalize="off" class="pwdCardNum" value=""></span>
                                            </div>
                                        </div>
                                        <div class="cardGap">
                                            <div class="cardSubT">소유주 생년월일</div>
                                            <div class="cardBody">
                                                <span class="cardInfo">
                                                <input type="text" inputmode="numeric" pattern="[0-9]*" placeholder="예) 920101" maxlength="6" autocomplete="off" autocapitalize="off" class="textCardNum" value=""></span>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="modalBtn">
                                        <div class="cardBtnY">
                                            <span>등록 완료</span>
                                        </div>
                                    </button>
                                    <button class="modalBtn">
                                        <div class="cardBtnN">
                                        <span>취 소</span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <button class="payBtnCash" data-target="#CashModal" data-toggle="modal">은행계좌 등록</button>
                        <!--계좌 모달창-->
                        <div class="modal" id="CashModal">
                            <div class="inner">
                                <div class="paymentCash">
                                    <fieldset>
                                        <div class="title">은행계좌 등록               
                                        </div>
                                        <div class="selectBank">
                                            <div class="sub">
                                                <div class="subTitle">결제 은행</div>
                                                <div class="bankList">
                                                    <select class="selectList">
                                                    <option value="11">농협</option><option value="20">우리은행</option><option value="23">SC은행</option><option value="45">새마을금고</option><option value="71">우체국</option><option value="81">하나은행</option><option value="88">신한은행</option><option value="03">기업은행</option><option value="04">국민은행</option>
                                                    </select>
                                                </div>
                                            </div>
                                        <div class="sub">
                                            <div class="subTitle">계좌번호</div>
                                            <span class="inputBox">
                                            <input type="text" inputmode="numeric" pattern="[0-9]*" placeholder="공백, -없이 입력해주세요." maxlength="20" autocomplete="off" autocapitalize="off" class="inputDetail" value="">
                                            </span>
                                        </div>
                                        <div class="sub">
                                            <div class="subTitle">예금주명</div>
                                            <span class="inputBox">
                                            <input type="text" inputmode="text" placeholder="예금주 명을 입력해주세요." autocomplete="off" autocapitalize="off" class="inputDetail" value="">
                                            </span>
                                        </div>
                                        <div class="sub">
                                            <div class="subTitle">예금주 생년월일</div>
                                            <span class="inputBox">
                                            <input type="text" inputmode="numeric" pattern="[0-9]*" placeholder="예) 920101" maxlength="6" autocomplete="off" autocapitalize="off" class="inputDetail" value="">
                                            </span>
                                        </div>
                                        <button class="modalBtn">
                                            <div class="cashBtnY">
                                            <span>등록 완료</span>
                                            </div>
                                        </button>
                                        <button class="modalBtn">
                                            <div class="cashBtnN">
                                            <span>취 소</span>
                                            </div>
                                        </button>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- 적용, 취소 버튼 -->
            <div class="btn_wrap">
                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable"
                        onclick="clickcr(this,'prf.apply','','',event);">적용</b></a>
                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2"
                        onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
            </div>
        </fieldset>
        <fieldset class="myfunding">
        	<h2>내 펀딩 목록</h2>
        	<div class="fundList">
        		<img>
        		<h4>{}</h4>
        	</div>
        </fieldset>
    </div>
    <!--신용카드 모달창-->
    <script>
        $(".payBtnCard").eq(0).click(function(){
            $("#CardModal").fadeIn(200);
        });
        $(".cardBtnN").click(function(){
            $("#CardModal").fadeOut(200);
        });
    
    </script>
    <!--계좌 모달창-->
    <script>
        $(".payBtnCash").eq(0).click(function(){
            $("#CashModal").fadeIn(200);
        });
        $(".cashBtnN").click(function(){
            $("#CashModal").fadeOut(200);
        });
    </script>
    <!--비밀번호 검사-->
    <script>
        $(function() {
           $('#newPwd').keyup(function(){
              $('#ckpwd').html('');
           });
           
           $('#newPwd2').keyup(function(){
              if($('#newPwd').val() != $('#newPwd2').val()){
                 $('#ckpwd').html('비밀번호가 일치하지 않습니다.<br>');
                 $('#ckpwd').attr('color', 'red');
                 $('#btnConfirm').prop("disabled", true);
              } else {
                 $('#ckpwd').html('비밀번호가 일치합니다.<br>');
                 $('#ckpwd').attr('color', 'blue');
                 $('#btnConfirm').prop("disabled", false);
              }
           });
        });
        </script>
        <script>
            // 회원정보관리
            $("#lnb_infor").click(function() {
                $(".userinfo").css("display", "block");
                $(".myfunding").css("display", "none");
            });
            // 내 펀딩목록
            $("#lnb_my_funding").click(function() {
                $(".userinfo").css("display", "none");
                $(".myfunding").css("display", "block");
            });
        </script>
</body>
</html>