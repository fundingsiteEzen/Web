<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 카드 모달창 -->
<div class="modal" id="CardModal">
	<div class="inner">
		<div class="paymentCard">
			<form class="form-horizontal" method="post" action="${contextPath}/myPage/addCard.do">
			<div class="title">신용/체크 카드 등록</div>
                <div class="cardBox">
                <div class="cardGap">
					<div class="cardSubT">카드번호</div>
					<div class="cardBody">
					    <div class="cardNum">
					        <span class="inCardNum">
					        <input type="text" placeholder="0000" maxlength="4" class="textCardNum" value="" name="ci_num1">
					        </span>
					        <span class="jMWjNk">-</span>
					        <span class="inCardNum">
					        <input type="password" placeholder="0000" maxlength="4" class="pwdCardNum" value="" name="ci_num2">
					        </span>
					        <span class="jMWjNk">-</span>
					        <span class="inCardNum">
					        <input type="password" placeholder="0000" maxlength="4" class="pwdCardNum" value="" name="ci_num3">
					        </span>
					        <span class="jMWjNk">-</span>
					        <span class="inCardNum">
					        <input type="text" placeholder="0000" maxlength="4" class="textCardNum" value="" name="ci_num4">
					        </span>
					    </div>
					</div>
                </div>
                <div class="cardGap">
	                <div class="cardSubT">카드 유효기간</div>
	                <div class="cardBody">
	                    <div class="cardLife">
	                        <div class="cLifeDetail">
	                            <select class="selDetail" name="ci_month">
	                            <option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">4월</option><option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option><option value="09">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
	                            </select>
	                        </div>
	                        <div class="cLifeDetail">
	                            <select class="selDetail" name="ci_year">
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
                        <input type="password" placeholder="앞 2자리를 입력해주세요." maxlength="2" class="pwdCardNum" value="" name="ci_pass"></span>
                    </div>
                </div>
                <div class="cardGap">
                    <div class="cardSubT">소유주 생년월일</div>
                    <div class="cardBody">
                        <span class="cardInfo">
                        <input type="text" placeholder="예) 920101" maxlength="6" class="textCardNum" value="" name="ci_birth"></span>
                    </div>
                </div>
			</div>
            <button type="submit" class="modalBtn">
                <div class="cardBtnY">
                    <span>등록 완료</span>
                </div>
            </button>
            <button type="button" class="modalBtn" id="cardBtnN">
                <span>취 소</span>
			</button>
			</form>
		</div>
	</div>
</div>


<!-- 계좌 모달창 -->
<div class="modal" id="CashModal">
    <div class="inner">
        <div class="paymentCash">
        <form class="form-horizontal" method="post" action="${contextPath}/myPage/addAccount.do">
			<div class="title">은행계좌 등록</div>
			<div class="selectBank">
			    <div class="sub">
			        <div class="subTitle">결제 은행</div>
			        <div class="bankList">
			            <select class="selectList" name="ai_bank">
			            <option>농협</option><option>우리은행</option><option>SC은행</option><option>새마을금고</option><option>우체국</option><option>하나은행</option><option>신한은행</option><option>기업은행</option><option>국민은행</option>
			            </select>
			        </div>
			    </div>
				<div class="sub">
				    <div class="subTitle">계좌번호</div>
				    <span class="inputBox">
				    <input type="text" placeholder="공백, -없이 입력해주세요." maxlength="20" name="ai_num" class="inputDetail" value="">
				    </span>
				</div>
				<div class="sub">
				    <div class="subTitle">예금주명</div>
				    <span class="inputBox">
				    <input type="text" inputmode="text" placeholder="예금주 명을 입력해주세요." name="ai_name" class="inputDetail" value="">
				    </span>
				</div>
				<div class="sub">
				    <div class="subTitle">예금주 생년월일</div>
				    <span class="inputBox">
				    <input type="text" placeholder="예) 920101" maxlength="6" name="ai_birth" class="inputDetail" value="">
				    </span>
				</div>
				<button type="submit" class="modalBtn">
				    <div class="cashBtnY">
				    <span>등록 완료</span>
				    </div>
				</button>
				<button type="button" class="modalBtn" id="cashBtnN">
				    <span>취 소</span>
				</button>
			</div>
			</form>
		</div>
	</div>
</div>