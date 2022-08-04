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
		<div class "i_header">
			<h2>회원 정보관리</h2>
		</div>
	</div>
 
 
</body>
</html>