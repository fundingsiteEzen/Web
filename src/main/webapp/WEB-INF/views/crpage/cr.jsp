<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>

</script>




<script type="text/javascript" src="/common/js/jquery-lastest.min.js?v=1659590069000" charset="UTF-8"></script>
<script type="text/javascript" src="/common/js/jquery.json-2.3.min.js?v=1659590069000" charset="UTF-8"></script>
<script type="text/javascript" src="/common/js/nclk_v0.4.3.js?v=1659590069000" charset="UTF-8"></script>
<link rel="shortcut icon" href="https://ssl.pstatic.net/happyimg2/img/favicon.ico" type="image/x-icon">

	
	
		<script type="text/javascript" src="/common/javascript/lcslog.js?v=1659590069000" charset="UTF-8"></script>
		
		<script type="text/javascript" src="/common/js/json2.js?v=1659590069000" charset="UTF-8"></script>
		<script type="text/javascript" src="/common/js/jstorage.min.js?v=1659590069000" charset="UTF-8"></script>
	


<script>
var ccsrv="cc.naver.com";
var $J = jQuery.noConflict();
$J.ajaxSetup({
	'scriptCharset': "utf-8"
	,'contentType': "application/x-www-form-urlencoded; charset=utf-8"
	,'beforeSend': function(xhr) {xhr.setRequestHeader("ajax", "true");}
	,'error': function(XMLHttpRequest, textStatus, errorThrown) {
		try {
			// chrome에서 jsonp 콜이 제대로 만들어 지기도 전에 페이지 새로고침이 일어나면 에러가 발생하여 예외코드 추가
			if(this.jsonp == 'callback') {
				return;
			}
		}
		catch(e) {
		}
		//alert("처리중 오류가 발생했습니다.\n잠시 후 다시 시도해주세요");
	}
});

$J(function() {
	
	$J(document.body).on('click', '.jq_nolink', function(event){
		event.preventDefault();
	});

	
	$J(document.body).on('click', '.jq_layeron', function(event){
		event.preventDefault();
		var layerClass = $J(this).data('layer');
		$J('#'+layerClass).toggle();
	});

	$J(document.body).on('click', '.jq_layeroff', function(event){
		event.preventDefault();
		var layerClass = $J(this).data('layer');
		$J('#'+layerClass).hide();
	});

	
	$J(document.body).on('click', '.jq_ajaxpaging a', function(event){
		event.preventDefault();

		var $a = $J(this);
		if ($a.attr("href") == "#")
			return;

		var ajaxview = $J('.jq_ajaxpaging').data('ajaxviewid');
		$J.get($a.attr("href"), function(data) {
			$J("#" + ajaxview).html(data);
		});
	});
});




if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, '');
  }
}
</script>

<script type="text/javascript" src="/common/js/jquery.inputform.js?v=1659590069000" charset="UTF-8"></script>
<script type="text/javascript" src="/common/javascript/hbean_all.js?v=1659590069000" charset="UTF-8"></script>
<script type="text/javascript" src="/common/js/handlebars-v2.0.0.min.js?v=1659590069000" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="/wcomp/happybean_css/css/hb_snscomment.css?v=1659590069000">
<link rel="stylesheet" type="text/css" href="/wcomp/happybean_css/img3/happybean/css2/prohibitword.css?v=1659590069000">
<link rel="stylesheet" type="text/css" href="/wcomp/happybean_css/css/spi_standard.css?v=1659590069000">
<link rel="stylesheet" type="text/css" href="/wcomp/happybean_css/css/hb.css?v=1659590069000">
<link rel="stylesheet" type="text/css" href="/wcomp/happybean_css/css/hb2.css?v=1659590069000">

<title>창작 등록 페이지</title>
</head>
<body style="">
<div id="wrap">








<script type="text/javascript" src="/common/js/lodash.compat.min.js?v=1659590069000" charset="UTF-8"></script>
<script>
	var g_ssc = "happybean.all";
	var gnbList = ['gnb_rdona', 'gnb_crowdfunding', 'gnb_flower', 'gnb_volunteer', 'gnb_campaign'];

	$J(document.body).ready(function () {

		if (typeof gnb !== 'undefined') {
			for (var i = 0; i < gnbList.length; i++) {
				if (gnbList[i] == gnb) {
					$J('#' + gnbList[i]).attr("aria-current", "true");
				}
			}

			if (gnb == 'gnb_campaign') {

				var pathname = $J(location).attr('pathname');
				if (pathname.indexOf('/goodAction') == -1) {

					$J('#lnb').css('display', 'block');

					if (pathname.toLowerCase().indexOf('/goodcompany') >= 0) {

						$J('#lnb a[name=goodcompany]').attr('aria-current', 'true');
					} else {

						var urlParams = {};
						$J(location).attr('search').replace(/[?&]+([^=&]+)=?([^&]*)?/gi, function (str, key, value) {
							urlParams[key] = value !== undefined ? value : '';
						});

						var subtype = urlParams['subType'];
						if (subtype === 'CAMPAIGN_COMPANY') {
							$J('#lnb a[name=company]').attr('aria-current', 'true');
						} else if (subtype === 'CAMPAIGN_STAR') {
							$J('#lnb a[name=star]').attr('aria-current', 'true');
						} else {
							$J('#lnb a[name=all]').attr('aria-current', 'true');
						}
					}
				}
			} else if (gnb == 'gnb_rdona') {

				var pathname = $J(location).attr('pathname');

				if (pathname.indexOf('/donations') === -1 ) {
					$J('#lnb_rdona').css('display', 'block');
				}

				if ( location.href.indexOf('rdonaNo') > -1) {
					$J('#lnb_rdona').css('display', 'none');
				}

				if (pathname.indexOf('/congfund') >= 0 || pathname.indexOf('/deposit') >= 0) {
					$J('#gnb_rdona').attr("aria-current", "false");
					$J('#gnb_campaign').attr("aria-current", "true");
					$J('#lnb_rdona').css('display', 'none');
				}
			}
		}

		
		$J.getJSON('/user/gnbInfo.json', function (data) {
			if (data.isLoggedIn === false) {
				$J("#loginWrap").css({'display': 'block'});
				return;
			}

			$J("#jq_my_bx").css({'display': 'block'});

			$J("#profileImage").attr("src", data.profileImageUrl);

			if (data.isPartner) {
				$J("#jq_name").text(data.name);
				return;
			}

			if (data.isHappylogManager) {
				$J("#jq_name").text(data.name);
				$J("#profileLink").attr("href", data.hlogUrl);
				return;
			}

			if (data.nickname) {
				$J("#jq_name").text(data.nickname);

			}

			migrationTimeline();

			
			if (!!getCookie("showDonateReceiptLayer") == false && data.isReceiptLayerOpen) {
				
				$J(".jq_donateReceiptLayer").show();
				$J(".jq_ly_personal").show();
			}
		});

		$J("#gnb_rdona").on('click', function (e) {
			e.preventDefault();
			setDoubleProject.getOngoing();
		});

		$J('#loginButton').on("click", function (e) {
			location.href = 'https://nid.naver.com/nidlogin.login?url=' + encodeURIComponent(location.href.split('#', 1));
			return false;
		});

		$J('#logOutButton').on("click", function (e) {
			location.href = 'https://nid.naver.com/nidlogin.logout?url=' + encodeURIComponent(location.href.split('#', 1));
			return false;
		});

	});

	var setDoubleProject = {
		getOngoing: function () {

			$J.ajax({
				url: '/rdona-service/double/isOngoing',
				type: "GET",
				dataType: 'json',
				async: true,
				success: function (data) {
					if (data.errorCode) {
						alert("더블 프로젝트 진행여부 조회 시 오류가 발생했습니다. " + data.errorMessage);
					} else {
						if (data.result && _.random(0, 1) === 0) {
							location.href = 'https://happybean.naver.com/doubleproject';
						} else {
							location.href = 'https://happybean.naver.com/donation/DonateHomeMain';
						}
					}
				},
				error: function () {
					alert("더블 프로젝트 진행여부 조회 시 오류가 발생했습니다.");
				}
			});
		}
	}

	var migrationTimeline = function() {
		$J.ajax({
			url : '/user-service/timeline/migration',
			dataType : 'json',
			success : function(data) {
				if (data.errorCode) {
					alert('활동내역 세팅 중 오류가 발생하였습니다. ' + data.errorMessage);
				}
			}
		});
	}
</script>

<input type="hidden" id="projectCoreType" name="projectCoreType">
<input type="hidden" id="owfsOwnerType" name="owfsOwnerType" value="FUNDING_ESTABLISHMENT">
<div id="container" class="crowd_apply">
	<div class="page_head">
		<div class="in">
			<h2 class="page_tit">펀딩 프로젝트 개설신청</h2>
		</div>
	</div>
	<!-- contents -->
	<div class="crowd_wrap">
		<div class="step_content">
			<div class="crowd_app_con">
				<h3 class="section_tit">카테고리를 선택해 주세요 <span class="required">(필수)</span></h3>
				<p class="section_desc">*승인조건에 맞지 않는 프로젝트는 반려대상이 될 수 있습니다.</p>
				<div class="section_cont">
					<div class="select type_large">
						<a href="#" class="on"><span id="projectCoreText">옵션선택</span></a>
						<!-- [D]레이어 노출 시 ly_on 클래스 추가 -->
						<div class="sel_subbox jq_sel_subbox">
							<ul id="projectCoreSelectBox">
								<li><a href="#" data-code="spring">봄</a></li>
								<li><a href="#" data-code="summer">여름</a></li>
								<li><a href="#" data-code="autumn">가을</a></li>
								<li><a href="#" data-code="winter">겨울</a></li>
								
							</ul>
						</div>
					</div>
					<div class="inp_txt type_large" style="display:none">
						<!-- [D] 기타 옵션 선택 시 disabled 속성 제거 -->
						<input id="projectCoreEtcContent" type="text" class="input" placeholder="내용을 입력해주세요" maxlength="20" disabled="">
					</div>
					<div class="form_box">
						<div class="form_item">
							<div class="item_tit"><label for="coreName">주체명 <span class="required">(필수)</span></label></div>
							<div class="item_cont">
								<div class="inp_txt" style="width:300px">
									<input type="text" id="coreName" name="coreName" class="input" placeholder="주체명을 입력해 주세요" maxlength="20" required="">
								</div>
							</div>
						</div>
						<div class="form_item">
							<div class="item_tit"><label for="chargePerson">담당자 <span class="required">(필수)</span></label></div>
							<div class="item_cont">
								<div class="inp_txt" style="width:300px">
									<input type="text" id="chargePerson" name="chargePerson" class="input" placeholder="담당자를 입력해 주세요" maxlength="20" required="">
								</div>
							</div>
						</div>
						<div class="form_item">
							<div class="item_tit"><label for="contactInformationFirst">연락처 <span class="required">(필수)</span></label></div>
							<div class="item_cont">
								<div class="inp_txt" style="width:80px">
									<input type="text" id="contactInformationFirst" name="inpTel" class="input jq_numberonly" maxlength="3" required="">
								</div>
								<span class="hyphen">—</span>
								<div class="inp_txt" style="width:100px">
									<input type="text" id="contactInformationMiddle" name="inpTel" class="input jq_numberonly" title="연락처 입력" maxlength="4" required="">
								</div>
								<span class="hyphen">—</span>
								<div class="inp_txt" style="width:100px">
									<input type="text" id="contactInformationEnd" name="inpTel" class="input jq_numberonly" title="연락처 입력" maxlength="4" required="">
								</div>
							</div>
						</div>
						<div class="form_item">
							<div class="item_tit"><label for="email">이메일</label></div>
							<div class="item_cont">
								<div class="inp_txt" style="width:140px">
									<input type="text" id="email" name="inpEmail" class="input" placeholder="" maxlength="20" required>
								</div>
								<span class="txt">@</span>
								<div class="inp_txt" style="width:140px">
									<input type="text" name="inpEmail" class="input" placeholder="" maxlength="20" required>
								</div>
								<p class="desc">* 로그인한 ID로만 가능하며, 수정 불가합니다</p>
							</div>
						</div>
						<div class="form_item">
							<div class="item_tit">참고할 정보 <span class="required">(필수)</span></div>
							<div class="item_cont">
								<p class="desc">주체 및 펀딩과 관련한 기사 또는 콘텐츠 링크도 입력 부탁드립니다.</p>
								<!-- [D]항목 추가 시 li(.item) 추가 -->
								<ul id="referenceInformationList" class="add_info">
									<li class="item">
										<div class="select">
											<a href="#" class="on"><span>옵션선택</span></a>
											<!-- [D]레이어 노출 시 ly_on 클래스 추가 -->
											<div class="sel_subbox">
												<ul class="jq_reference_type_select_box">
													<li><a href="#" data-code="HOMEPAGE">홈페이지</a></li>
													<li><a href="#" data-code="FACEBOOK">페이스북</a></li>
													<li><a href="#" data-code="INSTAGRAM">인스타그램</a></li>
													<li><a href="#" data-code="ETC">기타</a></li>
												</ul>
											</div>
											<input type="hidden" name="referenceType">
										</div>
										<div class="inp_txt" style="width:330px">
											<input type="text" name="referenceContent" class="input" maxlength="50" required="">
										</div>
										<button type="button" id="referenceInformationAddBtn" class="btn btn_add"><span class="ico"></span>추가</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="crowd_app_con">
				<h3 class="section_tit"><label for="coreIntroduction">주체 소개 <span class="required">(필수)</span></label></h3>
				<div class="in_apply">
					<div class="inp_txtarea">
						<textarea id="coreIntroduction" class="input" placeholder="프로젝트를 진행하는 주체의 소개를 작성 부탁드립니다." maxlength="500"></textarea>
					</div>
				</div>
			</div>

			<div class="crowd_app_con">
				<h3 class="section_tit"><label for="fundingProjectIntroduction">펀딩 프로젝트 소개 <span class="required">(필수)</span></label></h3>
				<div class="in_apply">
					<div class="inp_txtarea">
						<textarea id="fundingProjectIntroduction" class="input" placeholder="프로젝트 진행 계기, 상세 내용, 집행 계획 등을 구체적으로 작성 부탁드립니다." maxlength="500"></textarea>
					</div>
				</div>
			</div>

			<div class="crowd_app_con">
				<h3 class="section_tit"><label for="fundingDonationUsePlan">펀딩 후원금 사용 계획 <span class="required">(필수)</span></label></h3>
				<div class="in_apply">
					<div class="inp_txtarea">
						<textarea id="fundingDonationUsePlan" class="input" placeholder="펀딩 후원금 사용처와 사용계획을 구체적으로 작성 부탁드립니다." maxlength="500"></textarea>
					</div>
				</div>
			</div>

			<div class="crowd_app_con">
				<h3 class="section_tit"><label for="rewardIntroduction">리워드 소개 <span class="required">(필수)</span></label></h3>
				<div class="in_apply">
					<div class="inp_txtarea">
						<textarea id="rewardIntroduction" class="input" placeholder="펀딩으로 진행하는 리워드 설명을 구체적으로 작성 부탁드립니다." maxlength="500"></textarea>
					</div>
				</div>
				<div class="file_area">
					<div class="inp_file">
						<ul id="attachFileList" class="files">
						</ul>
					</div>
					<input type="file" id="inpFile" class="blind">
					<label for="inpFile" id="attachFileAddBtn" class="btn_upload">파일 첨부하기</label>
				</div>
			</div>

			<div class="crowd_app_con">
				<h3 class="section_tit">리워드 구성 <span class="required">(필수)</span></h3>
				<p class="section_desc">* 1개 이상 필수 입력해야 하며, 최대 10개까지 등록 가능합니다.</p>
				<div class="section_cont">
					<!-- [D]항목 추가 시 li(.item) 추가 -->
					<ul id="rewardList" class="add_info">
						<li class="item">
							<div class="inp_txt inp_num" style="width:160px">
								<input type="text" name="rewardAmount" class="input jq_numberonly jq_addcomma_number" required="">
							</div>
							<span class="txt">원 이상 참여 시</span>
							<div class="inp_txt" style="width:280px">
								<input type="text" name="rewardName" class="input" maxlength="30" required="">
							</div>
							<button type="button" id="rewardAddBtn" class="btn btn_add"><span class="ico"></span>추가</button>
						</li>
					</ul>
				</div>
			</div>

			<div class="crowd_app_con">
				<h3 class="section_tit">기타 <span class="optional">(선택)</span></h3>
				<p class="section_desc">추가 제출을 원하시는 자료가 있을 경우 파일 첨부 부탁드립니다.</p>
				<div class="section_cont">
					<div class="file_area">
						<div class="inp_file">
							<ul id="etcAttachFileList" class="files">
							</ul>
						</div>
						<input type="file" id="inpFile3" class="blind">
						<label for="inpFile3" id="etcFileUploadBtn" class="btn_upload">파일 첨부하기</label>
					</div>
				</div>
			</div>
			<div class="crowd_app_con">
				<h3 class="section_tit">개인정보 수집 및 이용에 동의 <span class="required">(필수)</span></h3>
				<div class="in_apply">
					<div class="term_tx_box">
						<strong class="term_tit">개인정보 수집 항목</strong>
						<p>담당자 이름, (휴대)전화번호</p>
						<strong class="term_tit">개인정보의 이용 목적</strong>
						<p>프로젝트 개설 및 진행을 위한 의사 소통</p>
						<strong class="term_tit point">개인정보 보유 기간</strong>
						<p><strong class="highlight">신청 후 90일 보관 후 파기</strong></p>
						<strong class="term_tit">개인정보 수집 및 이용에 거부할 권리</strong>
						<p>정보주체는 개인정보 수집 및 이용에 거부할 권리가 있으나, 프로젝트 개설을 위한 최소한의 개인정보 수집으로써 이를 거부하실 경우<br> 해피빈 펀딩 프로젝트를 신청하실 수 없습니다.</p>
					</div>
					<div class="chk_area">
						<input type="checkbox" id="chkAgree">
						<label for="chkAgree">개인정보의 수집 및 이용에 동의합니다.</label>
					</div>
				</div>
			</div>
			<!--결제확인버튼-->
			<div class="final_btn_area">
				<button type="submit" id="applyBtn" class="btn_submit">프로젝트 개설 신청하기</button>
			</div>
		</div>
	</div>
	<!-- //contents -->
</div>
<!-- [D] layer -->
<div class="dim" id="establishmentBasisDim" style="display:none"></div>
<div class="ly_wrapper" id="establishmentBasis" style="display:none">
	<div class="ly_bx ly_fund_apply">
		<h2 class="ly_head">펀딩 개설 기준</h2>
		<div class="ly_cont">
			<strong class="tit">펀딩 개설 정책 기준</strong>
			<p class="txt"><em class="emp">해피빈 펀딩 서비스는 우리 사회의 공익을 증진시키기 위해 운영되며, 아래의 요건을 만족시키는 프로젝트에 한해 시의성과 형평성, 적합성 등을 고려해 개설여부를 결정합니다. 아래 요건을 모두 만족한 경우에도 유사한 건이 오픈 예정이거나, 펀딩 개설 일정이 모두 마감된 경우에는 개설이 불가할 수 있습니다.<br> 심사에는 15일 정도 소요되며, 오픈까지 한 달 이상의 시간이 소요되니 이를 고려하여 신청 부탁드립니다.</em></p>
			<ul>
				<li>
					<strong class="tit">1. 목적</strong>
					<p class="txt">공익 및 대안·상생을 목적으로 하며, 해피빈 서비스의 방향에 부합해야 합니다.</p>
					<ul class="txt">
						<li>- 비영리단체나 사회적기업의 공익 프로젝트나 미디어의 공익 콘텐츠</li>
						<li>- 소상공인, 소셜벤처, 창작자의 상품으로 그들의 자립을 도우며 사회의 다양성을 높이는 프로젝트</li>
						<li>- 단순히 개인/단체의 영리만을 목적으로 하는 경우 개설이 불가합니다.</li>
					</ul>
				</li>
				<li>
					<strong class="tit">2. 내용</strong>
					<p class="txt">펀딩 목적이 부합된 콘텐츠로 타인의 저작권을 침해하지 않는 내용이어야 하며, 반드시 본인의 창작물이어야 합니다.</p>
					<ul class="txt">
						<li>- 타인의 명예를 손상시키거나 불이익을 주는 것, 공익을 저해하는 것, 정치적•종교적•성적으로 편향된 것, 법에 저촉되거나 사회 질서를 저해하는 내용이 있는 경우 공감펀딩 개설이 제한됩니다.</li>
						<li>- 리워드 디자인이나 기능 등에 대한 검토가 불가하며, 생산에 대한 명확한 계획이 없는 경우 개설이 제한됩니다.</li>
						<li>- 타 플랫폼에서 유사한 내용의 프로젝트를 동시에 진행하는 경우 개설이 제한됩니다.</li>
					</ul>
				</li>
				<li>
					<strong class="tit">3. 집행 및 리워드</strong>
					<p class="txt">펀딩에 대한 목적과 사용계획이 분명해야 합니다.</p>
					<ul class="txt">
						<li>- 실제로 집행 가능한 펀딩만 개설할 수 있으며, 허위 사실이 발각될 경우 법적•도덕적 책임을 물을 수 있습니다.</li>
						<li>- 이전에 개설한 펀딩의 후기가 미흡하거나 모금 금액의 집행•리워드 보상이 제대로 이루어지지 않은 경우, 추가 개설이 제한됩니다.</li>
					</ul>
				</li>
			</ul>
			<div class="btn_area">
				<button type="button" class="btn jq_establishment_basis_close">닫기</button>
			</div>
		</div>
		<button type="button" class="btn_pop_close jq_establishment_basis_close"><span class="sp_end">닫기</span></button>
	</div>
</div>








<!-- footer -->
<div role="contentinfo" id="footer" class="footer">
	<div class="service_info_wrap">
		<dl class="notice_wrap" id="noticeArea">
			<dt class="notice_title"><a href="https://happybean.naver.com/introduction/NoticeList">공지사항</a></dt>
		<dd class="notice_text" aria-hidden="true" style="display: block;"><a href="/notification/123463152346">해피빈 서비스 이용약관 개정에 대한 안내</a></dd></dl>
		<div class="service_info_inner">
			<dl class="service_info_grid">
				<dt class="service_info_title">해피빈 안내</dt>
				<dd class="service_info_item"><a href="https://happybean.naver.com/introduction/branding">해피빈 소개</a></dd>
				<dd class="service_info_item"><a href="https://happybean.naver.com/introduction/cong">콩 받기 안내</a></dd>
				<dd class="service_info_item"><a href="https://happybean.naver.com/introduction/DonationStatusGuide">해피빈 현황</a></dd>
				<dd class="service_info_item"><a href="https://happybean.naver.com/congstore/congcoupon/CongCouponTransfer">콩쿠폰 입력</a></dd>
			</dl>
			<dl class="service_info_grid">
				<dt class="service_info_title">제휴∙단체 안내</dt>
				<dd class="service_info_item"><a href="https://happybean.naver.com/hlog/join" target="_blank">해피로그 가입</a></dd>
				<dd class="service_info_item"><a href="https://happybean.naver.com/partner/apply" target="_blank">기업제휴 문의</a></dd>
				<dd class="service_info_item"><a href="https://happybean.naver.com/crowdFund/establishment" target="_blank">펀딩 개설 신청</a></dd>
			</dl>
		</div>
	</div>
	<div class="footer_info_wrap">
		<div class="footer_info_inner">
			<ul class="footer_info_list">
				<li class="footer_info_item"><a href="https://happybean.naver.com/introduction/terms" target="_blank">해피빈 이용약관</a></li>
				<li class="footer_info_item"><a href="https://happybean.naver.com/introduction/terms#privacy" target="_blank"><strong>개인정보처리방침</strong></a></li>
				<li class="footer_info_item"><a href="http://policy.naver.com/rules/disclaimer.html" target="_blank">책임의 한계와 법적고지</a></li>
				<li class="footer_info_item"><a href="https://help.naver.com/service/9701?lang=ko" target="_blank">고객센터</a></li>
				<li class="footer_info_item"><a href="https://www.mois.go.kr/frt/a01/frtMain.do" target="_blank">공익제보(행정안전부)</a></li>
			</ul>
			<div class="footer_info">
				<ul class="footer_info_list">
					<li class="footer_info_item">재단법인 해피빈</li>
					<li class="footer_info_item">대표자 유봉석</li>
					<li class="footer_info_item">
						<address>경기도 성남시 분당구 황새울로360번길 42, 16층</address>
					</li>
					<li class="footer_info_item">대표전화 : 1588-3820</li>
					<li class="footer_info_item">이메일 : happybean@navercorp.com</li>
					<li class="footer_info_item">사업자등록번호 : 129-82-10367</li>
					<li class="footer_info_item">통신판매업신고 : 제2015-경기성남-1190호</li>
				</ul>
			</div>
			<div class="footer_info">
				<ul class="footer_info_list">
					<li class="footer_info_item">네이버 주식회사</li>
					<li class="footer_info_item">대표이사 최수연</li>
					<li class="footer_info_item">
						<address>경기도 성남시 분당구 정자일로 95 NAVER 1784</address>
					</li>
					<li class="footer_info_item">대표전화 : 1588-3819</li>
					<li class="footer_info_item">이메일 : helpcustomer@naver.com</li>
					<li class="footer_info_item">사업자등록번호 : 220-81-62517</li>
					<li class="footer_info_item">통신판매업신고 : 제2006-경기성남-0692호</li>
				</ul>
			</div>
            <small class="footer_info_notice">(재)해피빈과 네이버(주)는 펀딩, 공감가게, 가볼까 프로젝트의 당사자가 아닙니다. 프로젝트 진행 및 거래 등에 대한 책임은 해당 프로젝트의 개설자에게 있습니다.</small>
			<div class="footer_info_copyright"><a href="https://www.naver.com/" class="footer_info_naver"><img src="https://ssl.pstatic.net/happyimg2/img/pc/footer_naver.png" width="61" height="11" alt="NAVER"></a> Copyright © NAVER Corp. All Rights Reserved.</div>
            <a href="#" id="btn_mobile" class="btn_mobile" style="display:none">모바일버전으로 보기<i class="icon_arrow"></i></a>
		</div>
	</div>
</div>

<div class="dim jq_donateReceiptLayer jq_donateReceiptLayerClose" style="display:none"></div>
<div class="ly_personal jq_donateReceiptLayer jq_ly_personal" style="display:none">
	<p class="tit">기부금 연말정산을 위해<br>개인정보제공 동의가 필요합니다</p>
	<div class="cont">
		<p class="txt"><strong class="point">올해 12월 31일까지</strong> 개인정보제공 미동의 시<br>기부금영수증 발급이 제한됩니다</p>
		<a href="#" class="btn_green" id="donateReceiptPopUpOpen">정보제공동의 바로가기</a>
		<a href="#" class="txt_link" id="noAgreeReceipt">기부금영수증 발급하지 않기</a><p></p>
		<form id="donateReceiptForm" name="donateReceiptForm" method="post" action="https://happybean.naver.com/receipt/agreeDonateReceipt">
			<input type="hidden" name="isAgreeDonateReceipt" value="N">
			<input type="hidden" name="redirectURL" id="redirectURL" value="">
		</form>
	</div>
	<p class="notice">이 안내는 올해 결제 기부자분들 중 아직 정보제공동의 확인이<br>되지 않으신 분들께만 보여지고 있습니다.</p>
	<div class="inp_chk">
		<input type="checkbox" id="inp_chk">
		<label for="inp_chk">이 창을 다시 표시 안함</label>
	</div>
	<a href="#" class="btn_pop_clse jq_donateReceiptLayerClose">팝업닫기</a>
</div>


<script type="text/javascript">
	window.addEventListener('pageshow', function(event) {
		lcs_do();

		//notice
		$J.get('/happybean-service/noticeList', function(data) {
			if (data.result) {
				var notiArea = $J("#noticeArea");
				let noticeList = data.result;
				for(var i = 0; i < noticeList.length; i++) {
					var noticeNewTag = noticeList[i].newYn == "Y" ? " <i class='icon_new'><span class='blind'>새로운 공지</span></i>" : "";
					$J("<dd class='notice_text' aria-hidden='true'><a href='/notification/" + noticeList[i].articleNo + "'>"+ noticeList[i].articleTitle + noticeNewTag + "</a></dd>").appendTo(notiArea);
				}
			}

			$J("#noticeArea dd:first").show();
			setInterval(function() { $J("#noticeArea dd:visible").next().size() > 0 ? $J("#noticeArea dd:visible").hide().next().show() : $J("#noticeArea dd").hide().first().show(); }, 5000);
		});

	})
</script>

<script id="BANNER" type="text/x-handlebars-template">
	
</script>
<script type="text/javascript" src="/common/js/handlebars-v2.0.0.min.js?v=1659590069000" charset="UTF-8"></script>
<script>
    var realNameFooterPop = null;
    var realNameFooterTimeout = null;

    $J(document.body).ready(function() {
        
        $J("#noAgreeReceipt").on("click", function() {
			$J.ajax({
				url: '/user-service/realNameCertification/save',
				type: 'POST',
				data: {individualInfoOfferAgree : 'N'},
				success: function (data) {
					if (Boolean(data.result)) {
						alert('개인정보 제공에 비동의 처리되었습니다.');
						setCookie('showDonateReceiptLayer', false, 1);
						window.location.reload();
					} else {
						alert('개인정보 제공 동의 정보 저장 시 오류가 발생하였습니다. ' + data.errorMessage);
					}
				}
			});

            return false;
        });
        $J(".jq_donateReceiptLayerClose").on("click", function() {
            var day = 1;
            if($J("#noDonateReceiptLayer").is(":checked")){
                day = 7;
            }
            setCookie( "showDonateReceiptLayer", false, day );
            $J(".jq_donateReceiptLayer").hide();
            $J(".jq_ly_personal").hide();
            return false;
        });

        $J("#donateReceiptPopUpOpen").on("click", function() {
            realNameFooterPop = window.open("https://happybean.naver.com/privacy/form", "", "width=700px, height=1123px, scrollbars=yes resizable=yes");
            $J(".jq_donateReceiptLayer").hide();
            $J(".jq_ly_personal").hide();
            doCheckFooterRealNamePopup();
            return false;
        });
        

        $J("#jq_warp").on("click", function() {
            var url = "https://happybean.naver.com/introduction/NoticeList";
            $J(location).attr('href', url).show();
        });

		$J(".btn_service_info").click(function() {
			var service_info_pressed = $J(".btn_service_info").attr("aria-pressed") === "true";
			$J(".btn_service_info").attr("aria-pressed", !service_info_pressed);
			$J(".service_info_inner").attr("aria-hidden", service_info_pressed);
		});

        
        $J('#footer_v1 .hb_svcarea_link').on("click", function(e) {
            $J('#hb_svcarea').toggle();
            return false;
        });

	    
		if(navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)){
			var pcview = getCookie("pcview");
			if (pcview != null) {
				$J('#btn_mobile').css({'display' : 'block'});
			}

			$J('#btn_mobile').on('click', function(event) {
				event.preventDefault();

				var protocol = $J(location).attr('protocol');
				var host = $J(location).attr('host');
				if (host.indexOf('local') >= 0 || host.indexOf('alpha') >= 0 || host.indexOf('qa') >= 0 || host.indexOf('dev') >= 0 || host.indexOf('pub') >= 0) {
					var hostArray = host.split('.');
					if (hostArray[0].indexOf("-") > 0) {
						hostArray[0] = hostArray[0].replace("-", "-m-");
					} else {
						hostArray[0] = hostArray[0] + "-m";
					}
					host = hostArray.join('.');
				} else {
					host = 'm.' + host;
				}

				var redirectUrl = protocol + '//' + host;

				var isMatchPathname = false;
				var pathname = $J(location).attr('pathname');
				if (pathname == '/' 
					|| pathname.indexOf('/donation/DonateHomeMain') >= 0 
					|| pathname.indexOf('/doubleproject') >= 0 
					|| pathname.indexOf('/specialdouble') >= 0 
					|| pathname.indexOf('/donation/EpilogueHome') >= 0 
					|| pathname.indexOf('/crowdFunding/Home') >= 0 
					|| pathname.indexOf('/crowdFunding/EpilogueHome') >= 0 
					|| pathname.indexOf('/fundings/home') >= 0 
					|| pathname.indexOf('/fundings/notices') >= 0 
					|| pathname.indexOf('/flower/flowerHome') >= 0 
					|| pathname.indexOf('/prddeposit/main') >= 0 
					|| pathname.indexOf('/crowdFunding/Intro/') >= 0 
					|| pathname.indexOf('/crowdFunding/PatronageApply/') >= 0 
					|| pathname.indexOf('/crowdFunding/Tiding/') >= 0 
					|| pathname.indexOf('/crowdFunding/patronageStep1/') >= 0 
					|| pathname.indexOf('/congfund/FundView/postscripts/') >= 0 
					|| pathname.indexOf('/congfund/FundView') >= 0 
					|| pathname.indexOf('/deposit/partner/') >= 0 
					|| pathname.indexOf('/deposit/my/') >= 0 
					|| pathname.indexOf('/flower/brand/') >= 0 
					|| pathname.indexOf('/club/') >= 0 
					|| pathname.indexOf('/introduction/cong') >= 0  ) {

					isMatchPathname = true
				} else if (pathname.indexOf('/donations/') >= 0) {

					isMatchPathname = true;
					var pathnames = pathname.split('/');
					pathname = '/' + pathnames[1] + '/' + pathnames[2];
				} else if (pathname.indexOf('/congfund/') >= 0) {

					isMatchPathname = true;
					var pathnames = pathname.split('/');
					pathname = '/' + pathnames[1] + '/' + pathnames[2] + '/FundDepositList';

					if (pathnames[2].indexOf('Deposit') >= 0) {
						pathname = '/' + pathnames[1] + '/FundView';
					}

					if (pathnames[2].indexOf('FundRanking') >= 0) {

						isMatchPathname = false;
						pathname = '';
					}
				} else if (pathname.indexOf('/crowdFunding/patronageStep2') >= 0) {

					isMatchPathname = true;
					var pathnames = pathname.split('/');
					pathname = '/' + pathnames[1] + '/Intro/' + pathnames[3];

				} else if (pathname.indexOf('/my/') >= 0) {

					isMatchPathname = true;
					pathname = '/my/MyCongUsingDetailMain';
				} else {
					pathname = '';
				}
				redirectUrl += pathname;

				var search = $J(location).attr('search');
				var urlParams = {};
				search.replace(/[?&]+([^=&]+)=?([^&]*)?/gi, function (str, key, value) {
					if (key != 'pcview') {

						urlParams[key] = value !== undefined ? value : '';
					}
				});

				if (isMatchPathname && Object.keys(urlParams).length > 0) {

					redirectUrl += '?';
					for (var key in urlParams) {
						if (urlParams.hasOwnProperty(key)) {

							redirectUrl += key + '=' + urlParams[key] + '&';
						}
					}
				}

				document.cookie = 'pcview=; path=/; expires=' + new Date(0).toUTCString() +';domain=.happybean.naver.com';

				location.href = redirectUrl;
			});
		}

		
        if(!!"")	{
            var data = {totalAmount : ""};
            var template = Handlebars.compile( $J("#BANNER").html().trim() );
            var html = template(data);
            $J("body").append(html);
            $J(document).on("click", ".ly_clse", function(){
                $J(this).closest(".api_ly").hide();
                return false;
            });
        }
        
        
        var contentCongBanner = getCookieAndExpire('congbanner');
        if(contentCongBanner){

            // IE8 and IE9
            if( 'XDomainRequest' in window && window.XDomainRequest !== null ) {
                var xdr = new window.XDomainRequest();
                if( xdr )
                {
                    xdr.onload = function() {
                        var template = xdr.responseText;
                        template = template.replace('{{close}}',"onclick=$J(this).attr('href','javascript:;');$J(this).parent().remove();");
                        template = template.replace('{{loginUrl}}', "https://nid.naver.com/nidlogin.login?url=" + encodeURIComponent("https://api.happybean.naver.com/congbanner/content/login?token=" + contentCongBanner));
                        $J(template).insertAfter('#header');
                    };
                    xdr.open('GET', "https://api.happybean.naver.com/congbanner/content/result?token="+contentCongBanner);
                    xdr.timeout = 4000;
                    xdr.send();
                }
            } else {
                $J.ajax({
                    type: "GET",
                    url : "https://api.happybean.naver.com/congbanner/content/result?token="+contentCongBanner,
                    success: function(template){

                        template = template.replace('{{close}}',"onclick=$J(this).attr('href','javascript:;');$J(this).parent().remove();");
                        template = template.replace('{{loginUrl}}', "https://nid.naver.com/nidlogin.login?url=" + encodeURIComponent("https://api.happybean.naver.com/congbanner/content/login?token=" + contentCongBanner));
                        $J(template).insertAfter('#header');
                    }
                });
            }

        }
    });

    function expireActiveCookies(name) {
        var expires = new Date(0).toUTCString();
        document.cookie = name + '=; path=/; expires=' + expires;
        document.cookie = name + '=; path=/; expires=' + expires +';domain=.naver.com';
        document.cookie = name + '=; path=/; expires=' + expires +';domain=.happybean.naver.com';
    }
    function setCookie(cookieName, cookieValue, expireDate){
        var today = new Date();
        today.setDate( today.getDate() + parseInt( expireDate ) );
        document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + today.toGMTString() + "; domain=.happybean.naver.com;";
    }
    function getCookie(cookieName){
        var keyValue = document.cookie.match('(^|;) ?' + cookieName + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    }
    function getCookieAndExpire(cookieName){
        var cookieValue = getCookie(cookieName);
	    if (cookieName == 'congbanner' && cookieValue != null) {

	    	
		    if ('XDomainRequest' in window && window.XDomainRequest !== null) {
			    var xdr = new window.XDomainRequest();
			    if (xdr) {
				    xdr.open('GET', "https://api.happybean.naver.com/congbanner/content/token?token=" + cookieValue);
				    xdr.timeout = 4000;
				    xdr.send();
			    }
		    } else {
			    $J.ajax({
				    type: "GET",
				    url: "https://api.happybean.naver.com/congbanner/content/token?token=" + cookieValue,
				    success: function (result) {
				    }
			    });
		    }
	    }
        expireActiveCookies(cookieName);
        return cookieValue;
    }

    function doCheckFooterRealNamePopup(){
        if(realNameFooterPop == null) return;
        if(realNameFooterPop.closed) {
            location.reload();
            return;
        }
        realNameFooterTimeout = window.setTimeout(doCheckFooterRealNamePopup, 500);
    }
</script>


</div>

<script id="REFERENCE_INFORMATION" class="tmpl" type="text/x-handlebars-template">
	<li class="item">
		<div class="select">
			<a href="#" class="on"><span>옵션선택</span></a>
			<!-- [D]레이어 노출 시 ly_on 클래스 추가 -->
			<div class="sel_subbox">
				<ul class="jq_reference_type_select_box">
					<li><a href="#" data-code="HOMEPAGE">홈페이지</a></li>
					<li><a href="#" data-code="FACEBOOK">페이스북</a></li>
					<li><a href="#" data-code="INSTAGRAM">인스타그램</a></li>
					<li><a href="#" data-code="ETC">기타</a></li>
				</ul>
			</div>
			<input type="hidden" name="referenceType">
		</div>
		<div class="inp_txt" style="width:330px">
			<input type="text" name="referenceContent" class="input">
		</div>
		<button type="button" id="referenceInformationDeleteBtn" class="btn btn_del"><span class="ico"></span>삭제</button>
	</li>
</script>

<script id="REWARD" class="tmpl" type="text/x-handlebars-template">
	<li class="item">
		<div class="inp_txt inp_num" style="width:160px">
			<input type="text" name="rewardAmount" class="input jq_numberonly jq_addcomma_number">
		</div>
		<span class="txt">원 이상 참여 시</span>
		<div class="inp_txt" style="width:280px">
			<input type="text" name="rewardName" class="input">
		</div>
		<button type="button" id="rewardDeleteBtn" onKeyDown="checkNumber(this)" class="btn btn_del"><span class="ico"></span>삭제</button>
	</li>
</script>

<script id="ATTACH_FILE" class="tmpl" type="text/x-handlebars-template">
	<li>
		<span class="file_name">{{fileName}}</span>
		<input type="hidden" name="fileName" value="{{fileName}}">
		<input type="hidden" name="filePath" value="{{filePath}}">
		<input type="hidden" name="owfsOwnerId" value="{{owfsOwnerId}}">
		<button type="button" class="sp_end btn_file_del jq_attach_file_delete">파일삭제</button>
	</li>
</script>

<script id="ETC_ATTACH_FILE" class="tmpl" type="text/x-handlebars-template">
	<li>
		<span class="file_name">{{fileName}}</span>
		<input type="hidden" name="etcFileName" value="{{fileName}}">
		<input type="hidden" name="etcFilePath" value="{{filePath}}">
		<input type="hidden" name="etcFileOwfsOwnerId" value="{{owfsOwnerId}}">
		<button type="button" class="sp_end btn_file_del jq_attach_file_delete">파일삭제</button>
	</li>
</script>

<script type="text/javascript">
	$J(document).ready(function() {
		
		$J("#establishmentBasisViewBtn").click(function(event) {
			event.preventDefault();

			$J("#establishmentBasisDim").css("display", "");
			$J("#establishmentBasis").css("display", "");
		});

		
		$J(".jq_establishment_basis_close").click(function(event) {
			event.preventDefault();

			$J("#establishmentBasisDim").css("display", "none");
			$J("#establishmentBasis").css("display", "none");
		});

		
		$J(document).on("click", "div > a.on", function(event) {
			event.preventDefault();
			if ($J(this).next('div').hasClass('ly_on') == false) {
				$J('div').filter('.ly_on').toggleClass('ly_on');
			}
			$J(this).next('div').toggleClass('ly_on');
		});

		
		$J("#projectCoreSelectBox > li > a").click(function (event) {
			event.preventDefault();

			$J("#projectCoreSelectBox > li > a").removeClass();
			$J(this).addClass("selected");
			$J("#projectCoreText").text($J(this).text());
			$J("#projectCoreType").val($J(this).data("code"));
			$J('.jq_sel_subbox').removeClass('ly_on');
			$J("#projectCoreEtcContent").val("");

			if ($J(this).data("code") == "ETC") {
				$J("#projectCoreEtcContent").removeAttr("disabled");
				$J("#projectCoreEtcContent").parent().css("display", "");
			} else {
				$J("#projectCoreEtcContent").attr("disabled", "disabled");
				$J("#projectCoreEtcContent").parent().css("display", "none");
			}
		});

		
		$J("#referenceInformationAddBtn").click(function (event) {
			event.preventDefault();

			if ($J("#referenceInformationList > li").length >=5) {
				alert("참고할 정보는 최대 5개까지 입력 가능합니다.");
				return false;
			}

			$J("#referenceInformationList").append(Handlebars.compile($J("#REFERENCE_INFORMATION").html()));
		})

		
		$J(document).on("click", "#referenceInformationDeleteBtn", function (event) {
			event.preventDefault();
			if (confirm("삭제 하시겠습니까?")) {
				$J(this).parent().remove();
			}
		});

		
		$J(document).on("click", ".jq_reference_type_select_box > li > a", function (event) {
			event.preventDefault();
			$J(".jq_reference_type_select_box > li > a").removeClass();
			$J(this).addClass("selected");
			$J(this).parent().parent().parent().siblings("a").children().text($J(this).text());
			$J(this).parent().parent().parent().siblings("input[name=referenceType]").val($J(this).data("code"));

			$J('.sel_subbox').removeClass('ly_on');
		});

		
		$J("#rewardAddBtn").click(function (event) {
			event.preventDefault();

			if($J("#rewardList > li").length >= 10) {
				alert("리워드 구성은 최대 10개까지 입력 가능합니다.");
				return false;
			}

			$J("#rewardList").append(Handlebars.compile($J("#REWARD").html()));
		});

		
		$J(document).on("click", "#rewardDeleteBtn", function (event) {
			event.preventDefault();
			if (confirm("삭제 하시겠습니까?")) {
				$J(this).parent().remove();
			}
		});

		
		$J("#attachFileAddBtn").click(function(event) {
			event.preventDefault();

			if ($J("#attachFileList > li").length >= 5) {
				alert("첨부파일은 최대 5개까지만 등록 가능합니다.");
				return false;
			}

			hbeannet.open("/FileUploadForm?callback=attachFileCallBack", "_doAddFileCallback", 400, 366);
		});

		
		$J(document).on("click", ".jq_attach_file_delete", function (event) {
			event.preventDefault();
			if (confirm("삭제 하시겠습니까?")) {
				$J(this).parent().remove();
			}
		});

		
		$J("#etcFileUploadBtn").click(function (event) {
			event.preventDefault();

			if ($J("#etcAttachFileList > li").length >= 5) {
				alert("기타 첨부파일은 최대 5개까지만 등록 가능합니다.");
				return false;
			}

			hbeannet.open("/FileUploadForm?callback=etcAttachFileCallBack", "_doAddFileCallback", 400, 366);
		});

		
		$J(document).on("click", "#etcAttachFileDeleteBtn", function(event){
			event.preventDefault();

			if (confirm("삭제 하시겠습니까?")) {
				$J("#etcAttachFileName").text("여러 파일을 첨부하실 경우, 압축파일 또는 PDF로 업로드 부탁드립니다.");
				$J("#etcAttachFileUrl").val("");
				$J("#etcAttachFileDeleteBtn").remove();
			}
		});

		
		$J(document).on('keyup', ".jq_numberonly", function() {
			$J(this).val($J(this).val().getOnlyDigit());
		});

		
		$J(document).on('keyup', ".jq_addcomma_number", function() {
			var inputValue = strNumberToDecimal($J(this).val().getOnlyDigit());
			$J(this).val(inputValue.toString().getMoney());
		});

		$J("#applyBtn").click(function (event) {
			event.preventDefault();
			var exit = false;

			// 유효성 검사
			if ($J("#projectCoreType").val() == "") {
				$J("#projectCoreText").parent("a").focus();
				alert("프로젝트 주체를 선택해 주세요.");
				return false;
			} else if ($J("#projectCoreType").val() == "ETC"){
				if (isNotValidationInputText($J("#projectCoreEtcContent"), "프로젝트 주체", 2, 20)) {
					return false;
				}
			}

			if (isNotValidationInputText($J("#coreName"), "주체명", 2, 20)) {
				return false;
			}

			if (isNotValidationInputText($J("#chargePerson"), "담당자", 2, 20)) {
				return false;
			}

			if ($J("#contactInformationFirst").val() == "" || $J("#contactInformationFirst").val().length < 3) {
				$J("#contactInformationFirst").focus();
				alert("연락처 정보를 입력해주세요 (최소 3자)");
				return false;
			} else if ($J("#contactInformationMiddle").val() == "" || $J("#contactInformationMiddle").val().length < 3 || $J("#contactInformationMiddle").val().length > 4) {
				$J("#contactInformationMiddle").focus();
				alert("연락처 정보를 입력해주세요 (최소 3자, 최대 4자)");
				return false;
			} else if ($J("#contactInformationEnd").val() == "" || $J("#contactInformationEnd").val().length < 4) {
				$J("#contactInformationEnd").focus();
				alert("연락처 정보를 입력해주세요 (최소 4자)");
				return false;
			}

			$J("input[name=referenceType]").each(function () {
				if ($J(this).val() == "") {
					$J(this).siblings("a").focus();
					exit = true;
					alert("참고할 정보의 유형을 선택해주세요");
					return false;
				}
			});

			if (exit) {
				return false;
			}

			$J("input[name=referenceContent]").each(function () {
				if (isNotValidationInputText($J(this), "참고할", 2, 50)) {
					exit = true;

					return false;
				}
			});

			if (exit) {
				return false;
			}

			if (isNotValidationInputText($J("#coreIntroduction"), "주체소개", 10, 500)) {
				return false;
			}

			if (isNotValidationInputText($J("#fundingProjectIntroduction"), "펀딩 프로젝트 소개", 10, 500)) {
				return false;
			}

			if (isNotValidationInputText($J("#fundingDonationUsePlan"), "펀딩 후원금 사용계획", 10, 500)) {
				return false;
			}

			if (isNotValidationInputText($J("#rewardIntroduction"), "리워드 소개", 10, 500)) {
				return false;
			}

			$J("input[name=rewardAmount]").each(function () {
				if ($J(this).val() == "") {
					$J(this).focus();
					alert("리워드 가격을 입력해주세요");

					exit = true;

					return false;
				}
			});

			if (exit) {
				return false;
			}

			$J("input[name=rewardName]").each(function () {
				if (isNotValidationInputText($J(this), "리워드명", 1, 30)) {
					exit = true;

					return false;
				}
			});

			if (exit) {
				return false;
			}

			if ($J("#chkAgree").is(":checked") == false) {
				alert("개인정보 수집 및 이용에 동의해주세요");
				$J("#chkAgree").focus();

				return false;
			}

			var requestParameter = {
				"projectCoreType" : $J("#projectCoreType").val(),
				"projectCoreEtcContent" : $J("#projectCoreEtcContent").val(),
				"coreName" : $J("#coreName").val(),
				"chargePerson" : $J("#chargePerson").val(),
				"contactInformation" : $J("#contactInformationFirst").val() + $J("#contactInformationMiddle").val() + $J("#contactInformationEnd").val(),
				"email" : $J("#email").val() + "@naver.com",
				"coreIntroduction" : $J("#coreIntroduction").val(),
				"fundingProjectIntroduction" : $J("#fundingProjectIntroduction").val(),
				"fundingDonationUsePlan" : $J("#fundingDonationUsePlan").val(),
				"rewardIntroduction" : $J("#rewardIntroduction").val(),
				"etcAttachFileUrl" : $J("#etcAttachFileUrl").val(),
				"individualInformationOfferAgreementYn" : $J("#chkAgree").is(":checked") ? "Y" : "N"
			}

			$J("input[name=referenceType]").each(function (index) {
				requestParameter['referenceInformation[' + index + '].referenceType'] = $J(this).val();
				requestParameter['referenceInformation[' + index + '].referenceContent'] = $J("input[name=referenceContent]:eq(" + index + ")").val();
			});

			$J("input[name=fileName]").each(function (index) {
				requestParameter['establishmentAttachFile[' + index + '].fileName'] = $J(this).val();
				requestParameter['establishmentAttachFile[' + index + '].filePath'] = $J("input[name=filePath]:eq(" + index + ")").val();
				requestParameter['establishmentAttachFile[' + index + '].owfsOwnerId'] = $J("input[name=owfsOwnerId]:eq(" + index + ")").val();
			});

			$J("input[name=rewardAmount]").each(function (index) {
				requestParameter['RewardFormation[' + index + '].rewardAmount'] = $J(this).val().getNumber();
				requestParameter['RewardFormation[' + index + '].rewardName'] = $J("input[name=rewardName]:eq(" + index + ")").val();
			});

			$J("input[name=etcFileName]").each(function (index) {
				requestParameter['etcAttachFile[' + index + '].fileName'] = $J(this).val();
				requestParameter['etcAttachFile[' + index + '].filePath'] = $J("input[name=etcFilePath]:eq(" + index + ")").val();
				requestParameter['etcAttachFile[' + index + '].owfsOwnerId'] = $J("input[name=etcFileOwfsOwnerId]:eq(" + index + ")").val();
			});

		$J.ajax({
				url : "/crowdFund/applyEstablishment",
				type : "POST",
				data : requestParameter,
				dataType : "text",
				success : function (result) {
					if (result == "true") {
						location.href = "/crowdFund/completeFundingEstablishmentApply";
					} else {
						alert("오류가 발생하였습니다. 잠시후 다시 시도해 주세요");
					}
				},
				error : function () {
					alert("오류가 발생하였습니다. 잠시후 다시 시도해 주세요");
				}

			});
		});
	});

	function etcAttachFileCallBack(params) {
		var etcAttachFileTemplate = Handlebars.compile($J("#ETC_ATTACH_FILE").html());
		$J("#etcAttachFileList").append(etcAttachFileTemplate(params));
	}

	function attachFileCallBack(params) {
		var attachFileTemplate = Handlebars.compile($J("#ATTACH_FILE").html());
		$J("#attachFileList").append(attachFileTemplate(params));
	}

	function isNotValidationInputText($object, title, minLength, maxLength) {
		if ($object.val() == "" || $object.val().length < minLength || $object.val().length > maxLength) {
			$object.focus();
			alert(title + " 정보를 입력해주세요 (최소" + minLength + "자, 최대 " + maxLength + "자)");
			return true;
		}

		return false;
	}

	function strNumberToDecimal(strNumber) {
		return parseInt(strNumber,10);
	}

	
	function checkNumber(obj) {
		var objEv = obj;
		var numPattern = /([^0-9])/;
		var numPattern = objEv.value.match(numPattern);

		if (numPattern != null) {
			alert("숫자만 입력하세요");
			objEv.value = "";
			objEv.focus();
			return false;
		}
	}
</script>

<div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div class="user_menu"><div id="temp_layer" class="cmt_lyr"><ul><li id="userPopUpiteminfo" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">해피빈 정보 보기</a></li><li id="userPopUpitemblog" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">블로그 보기</a></li><li id="userPopUpitemrdona" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">쪽지 보내기</a></li></ul></div></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div class="user_menu"><div id="temp_layer" class="cmt_lyr"><ul><li id="brandPopUpiteminfo" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">해피빈 정보 보기</a></li><li id="brandPopUpitemblog" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">블로그 보기</a></li><li id="brandPopUpitemrdona" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">쪽지 보내기</a></li></ul></div></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div class="user_menu"><div id="temp_layer" class="cmt_lyr"><ul><li id="userFundPopUpiteminfo" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">해피빈 정보 보기</a></li><li id="userFundPopUpitemblog" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">블로그 보기</a></li><li id="userFundPopUpitemrdona" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">모금함 추천하기</a></li></ul></div></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div class="user_menu"><div id="temp_layer" class="cmt_lyr"><ul><li id="brandFundPopUpiteminfo" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">해피빈 정보 보기</a></li><li id="brandFundPopUpitemblog" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">블로그 보기</a></li><li id="brandFundPopUpitemrdona" style="cursor: pointer;"><a style="text-decoration:none;" onclick="return false;">모금함 추천하기</a></li></ul></div></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="width:120px; border:1px solid #B6B6B6; padding:1px; background:#ffffff;"><ul><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="postScrapPopUpitemblog" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">블로그로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="postScrapPopUpitemcafe" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">카페로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="postScrapPopUpitemprint" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">프린트 하기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="width:120px; border:1px solid #B6B6B6; padding:1px; background:#ffffff;"><ul><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="clubTidingsScrapPopUpitemblog" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">블로그로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="clubTidingsScrapPopUpitemcafe" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">카페로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="clubTidingsScrapPopUpitemprint" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">프린트 하기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="position:absolute;z-index:1000;width:80px;padding:9px 14px;border:1px solid #737373;background:#fff;font-family:'나눔고딕',NanumGothic;letter-spacing:-1px;line-height:16px"><ul style="margin:0;padding:0;list-style:none;font-size:12px;"><li id="fundScrapPopUpitemblog" style="cursor: pointer;"><a style="color:#666;" onclick="return false;">내 블로그에 담기</a></li><li id="fundScrapPopUpitemcafe" style="cursor: pointer;"><a style="color:#666;" onclick="return false;">내 카페에 담기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="width:120px; border:1px solid #B6B6B6; padding:1px; background:#ffffff;"><ul><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="fundScrapPopUp2itemblog" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">내 블로그에 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="fundScrapPopUp2itemcafe" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">내 카페에 담기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="width:120px; border:1px solid #B6B6B6; padding:1px; background:#ffffff;"><ul><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="volunteerScrapPopUpitemblog" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">블로그로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="volunteerScrapPopUpitemcafe" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">카페로 담기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="temp_layer" style="width:120px; border:1px solid #B6B6B6; padding:1px; background:#ffffff;"><ul><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="sharePostscriptScrapPopUpitemblog" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">블로그로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="sharePostscriptScrapPopUpitemcafe" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">카페로 담기</a></li><li style="margin: 1px 0px; padding: 2px 0px 3px 10px; cursor: pointer;" id="sharePostscriptScrapPopUpitemprint" onmouseover="this.style.background='#E4FF75'" onmouseout="this.style.background=''"><a style="color:#666; font-size:12px; text-decoration:none;" onclick="return false;">프린트 하기</a></li></ul></div></div><div style="position: absolute; z-index: 1000; top: 0px; left: 0px; display: none;"><div id="useLimit_layer" style="position:absolute;left:-248px;z-index:1000;width:248px;font-family:'돋움',dotum;border:2px solid #888;color:#666;line-height:18px;background:#ffffff"><strong style="display:block;height:17px;padding:3px 0 5px 9px;background-color:#f0f0f0;color:#749D38;font-size:11px">이용제한 관련 안내</strong><div style="margin:0 10px;padding:6px 0;font-size:11px;line-height:18px;letter-spacing:-1px">	해당 게시물은 해피빈 운영 원칙에 따라 <br>	<span style="color:#749D38;">욕설/홍보/음란성</span> 등 노출 제한하고 있는 내용을<br>	 포함하고 있어 다른 이용자들이 볼 수 없도록 <br> 노출 제외 처리되었습니다</div><a href="#" style="position:absolute;top:5px;right:6px;width:15px;height:15px;padding:0;"><img src="https://ssl.pstatic.net/happyimg2/img3/happybean/img/btn_clse.gif" width="17" height="17" alt="닫기" border="0"></a></div></div></body>