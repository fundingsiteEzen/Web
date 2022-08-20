<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!-- 카드 모달창 -->
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
            <button class="modalBtn" id="cardBtnN">
                <span>취 소</span>
			</button>
		</div>
	</div>
</div>


<!-- 계좌 모달창 -->
<div class="modal" id="CashModal">
    <div class="inner">
        <div class="paymentCash">
			<div class="title">은행계좌 등록</div>
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
				<button class="modalBtn" id="cashBtnN">
				    <span>취 소</span>
				</button>
			</div>
		</div>
	</div>
</div>