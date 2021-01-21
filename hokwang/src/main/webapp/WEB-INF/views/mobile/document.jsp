<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 결제 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script type="text/javascript">
$(function() {
	babyList()
	payment()

})
</script>

<script type="text/javascript">/* 결제 메소드 */

function payment() {
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp59405263');
	
	$(document).on("click","#pay_doc",function(e){
	var vv=$(this).next().text()
	e.stopImmediatePropagation() 
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : '${parent_vo.parent_email}',
	    buyer_name : '${parent_vo.parent_name}',
	    buyer_tel : '${parent_vo.parent_tel}',
	    m_redirect_url : 'http://192.168.0.59:808/hokwang/mobile'
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
	    	   //성공시 이동할 페이지
            location.href='printDoc?vv='+vv;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	      //결제실패시 이동할 페이지
	        location.href='doc';
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

	})//end of click function
}//end on function

</script>
<script type="text/javascript">

function chgBaby() {//체인지 아기
	var babyNo = $("#baby-names option:selected").val();
	console.log("아기 번호 : " + babyNo);
	$.ajax({
		url : 'ajax/selectBaby',
		type : 'GET',
		data : {
			baby_no : babyNo,
			parent_no : "${parent_vo.parent_no}"
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : 
				selectBabyResult
	})//end of ajax
}
function babyList() {//셀렉트박스 리스트
	$.ajax({
		url : 'ajax/babyLists',
		type : 'GET',
		data : {
			parent_no : "${parent_vo.parent_no}"
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : function(data) {
			/* $.each(data, function(idx, item) {
						$('#baby-name').children().attr("value", item.baby_no).html(
								item.baby_name);
			}); */
			$.each(data, function(idx, item) {
				$("#baby-names").append(
						$('<option>').attr("value", item.baby_no).html(
								item.baby_name));
			});
		}
	});
}
function clickDoc(){
	$("#pay_doc").on("click",function(){
		var vv=$(this).next().text()
		location.href="doc?vv=" + vv
	})
	
}

function selectBabyResult(data){
	$("#docBody").empty();
	
	$.each(data,function(idx, item) {
		console.log(">>>>>>>>>>>" +idx)
	$("#docBody").append($('<div>').attr('class','col-12')
					.append($('<div>').attr('class','card')
						.append($("<p>").attr("id",'diag_times').html('진료일시 : ' + item.DIAG_TIME))
						.append($("<p>").attr("id",'diag_names').html("이름 : " + item.BABY_NAME))
						.append($("<p>").attr("id",'doc_price').html("질병 : " +item.DIS_NAME))//onclick="location.href='doc2'"
						.append($("<p>").attr("id",'doc_price').html("가격 : " +item.DIS_PRICE))
						.append($('<input>').attr("type",'button').attr("id","pay_doc").attr("value","결제").attr("style","width:50px"))
						.append($("<input>").attr("id",'doc_price').attr("type","hidden").html(item.RESV_NO))
						.append($('<input min=1 max=5>').attr("type",'number').attr("id","doc_print").attr("style","width:80px")))
	
	)
	});
}
</script>
</head>
<body>
	<h1 class="h3 mb-3">증명서 페이지</h1>
	
	<div>
	<select class="form-control" name="baby_no" id="baby-names"
			onchange="chgBaby()">
			<option value="" selected>==자녀선택==</option>
		</select>
	</div>
	<div class="row" id="docBody"></div>
	
</body>
</html>