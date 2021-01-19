<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 진행 중</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li{
  display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current{
	display: inherit;
}
</style>
</head>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp59405263');
$(function() {
	getUnPaidList();
});

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 100,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    m_redirect_url : 'http://localhost:808/hokwang/mobile'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	$.ajax({
    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    }
});

imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request로부터 imp_uid확인
//merchant_uid = extract_GET_value_from_url('merchant_uid') //또는, GET query string으로부터 merchant_uid확인

payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리

if(payment_result.status == 'paid' && payment_result.amount == amount_to_be_paid){
	success_post_process(payment_result) //결제까지 성공적으로 완료
}else if(payment_result.status == 'ready' && payment.pay_method == 'vbank'){
	vbank_number_assigned(payment_result) //가상계좌 발급성공
}else{
	fail_post_process(payment_result) //결제실패 처리
}

function getUnPaidList() {
	$.ajax({
		url : 'ajax/getUnPaidList',
		type : 'GET',
		data : {
			parent_no : "${parent_vo.parent_no}"
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : unPaidListResult
	});
}


function unPaidListResult(){
	$("#unPaidList").empty();
	console.log(data);
	$.each(data,function(idx, item){
		$("#unPaidList").append($('<div>').attr('class','col-12')
				     .append($('<div>').attr('class','card'))
				     .append($('<span>').html(item.PAY_DATE))
				     .append($('<hr>'))
				     .append($('<span>').html(item.BABY_NAME))
				     .append($('<ui>')
				     .append($('<li>').append($('<span>').html(item.DIS_NAME))) //endof li
				     .append($('<li>').append($('<span>').html(item.PAY_PRICE)) 		 )
			) //END OF UI			    		 
		 ) //end of div
	});
}
</script>
<body>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">결제 내역</h5>
				</div>
				<div class="row" id="unPaidList">
					<span>결제일시</span>
					<HR>
					<span>아기이름</span>
					<ui>
						<li>
						<span>병명</span>
						</li>
						<li>
						<span>금액</span>
						</li>
					</ui>
					
				</div>
			</div>	
		</div>
	</div>
</body>
</html>