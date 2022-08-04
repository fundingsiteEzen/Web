<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style>

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
    font-family: NanumSquareWebFont,dotum,Sans-serif;
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
.tbl_model td, .tbl_model th {
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
    </style>

</head>
<body>
	<div class="wrap">
		<div class="my_lnb_wrap" id="myLnb">
			<div id="lnb" class="my_lnb" role="menu">
	         <a href="" role="menuitem" class="my_lnb_item" id="lnb_infor" aria-current="true">회원정보 관리</a>   
	         <a href="" role="menuitem" class="my_lnb_item" id="lnb_pay" aria-current="true">결제정보 관리</a>
	         <a href="" role="menuitem" class="my_lnb_item" id="lnb_my_funding" aria-current="true">내 펀딩 목록</a>
	         <a href="" role="menuitem" class="my_lnb_item" id="lnb_project" aria-current="true">프로젝트 등록</a>
	         <a href="" role="menuitem" class="my_lnb_item" id="lnb_qna" aria-current="true">Q&A</a>

			</div> 
		</div>
		<div class "c_header">
			<h2>회원 정보관리</h2>
			<p class="contxt">회원 비밀번호, 닉네임, 계좌정보를 관리 하실 수 있습니다.</p>
		</div>
		<table border="0" class="tbl_model">
			<colgroup>
			<col style="width:22%;">
			<col>
			</colgroup>
			<tr>
			<th scope="row">
				<div class="thcell">
					<label for="inpNickname">닉네임</label>
				</div>
			</th>
			<td>
				<div class="tdcell">
				<p class="contxt_webctrl nickname">
				<input type="text" name="nickname" id="inpNickname" value="닉네임" style="width:254px" onclick="clickcr(this, 'prf.nick', '', '', event);">
				<input type="text" style="display: none;">
				</p>
				</div>
				</td>
			</tr>
		</table>
		
	</div>
 
 
</body>
</html>