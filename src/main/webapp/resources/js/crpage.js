/**
 * cr.jsp 
 */
function fn_crpageRegister(){
	// 입력받은 변수의 값을 받아온다.
	var	p_name		= $("#p_name").val();
	var	p_endDate	= $("#p_endDate").val();
	var	p_payDate	= $("#p_payDate").val();
	var	p_content	= $("#p_content").val();
	var	p_goal		= $("#p_goal").val();
	
	// 제목 항목의 값이 없으면 입력하도록 한다.
	if($("#p_name").val() == "") {
		alert("제목은 필수 입력 항목입니다.");
		$("#p_name").focus();
		return false;
		
	}
	
	
 }