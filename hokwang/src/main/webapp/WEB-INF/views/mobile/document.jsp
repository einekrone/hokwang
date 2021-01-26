<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 결제 -->
<!-- pdf를 만등주기 위한 pdfmake js 파일 -->
<script
	src="${pageContext.request.contextPath}/resources/js/pdfmake.min.js"></script>
<!-- 한글의 깨짐을 해결하기 위한 js 파일 -->
<script
	src="${pageContext.request.contextPath}/resources/js/vfs_fonts.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card
 {
	font-weight : 900;
}
</style>
<script type="text/javascript">
$(function() {
	babyList();
	payment();
	pdfajax();
	

})
</script>

<script type="text/javascript">/* 결제 메소드 */
function pdfajax() {
	$(document).on("click","#pdfmake",function(){  //버튼 id pdfmake 발생시 행동할 이벤트
		
	//ajax->update : status Y
	var resvNo = $("#pdfmake").parent().siblings("#doc_res").text();
	$.ajax({
	url : 'ajax/printDoc',
	type : 'GET',
	data : {
	resv_no : resvNo
	},
	error : function(xhr, status, msg) {
	alert("상태값 :" + status + " Http에러메시지 :" + msg);
	},
	success : function(result){
			
			pdfPrint(result.diagnosisDoc,result.mediDoc)
		}
		})//end of ajax
	})//end of click function
}
function pdfPrint(data,data2){
	var gender = '';
	if(data.BABY_GENDER="F")
		 gender = '여자';
	else {
		 gender = '남자';
	}
	var addr = data.BABY_REGNO1 + ' - '+ data.BABY_REGNO2;
	console.log(addr)
	console.log(data2.MEDI_NAME);
	var rows = [];

	/* for(var i of [1,2,3,4]) {
	    rows.push(['#.'+i, 'xx', 'xx', 'xx', 'xx', 'xx']);
	} */
	$.each(data2, function(idx, item) {
		rows.push(item.MEDI_NAME)
		
	})
	console.log("@@@@@@@@@@@@@@@@@@"+rows);
	//$(document).on("click","#pdfmake",function(){  //버튼 id pdfmake 발생시 행동할 이벤트
		 /* documentDefinition : pdf파일에 들어갈 내용 및 여러가지를 정의 */
		 var documentDefinition = {
		
		 //content : pdf의 내용을 정의
		 content: [
		  // 스타일 적용 없이 그냥 출력
		 {
		 text: '호광 소아병원',
		 bold: true
		 }, // 텍스트에 bold 주기
		 {
		 text: '진단서',
		 style: 'style_test'
		 }, // style 부분에 정의된 style_test 적용해보기 및 한글 꺠짐 테스트
		 {
		 style: 'tableExample',
		 table: {
		 widths: [100, '*', 80, '*'],
		 body: [
		 ['성명',	data.BABY_NAME ,'성별',gender	],//td
		
		 ['주민번호',addr,'담당의',data.EMP_NAME],
		 
		 ['주소',{text : data.PARENT_ADDR, colSpan: 3},'',''],//td */
		
		 [{text: '상병명',rowSpan : 2 },{text: data.DIS_NAME ,colSpan: 3 },'',''],//td
		 ['',{text : data.DIS_DESC, colSpan: 3},'',''],//td */
		 ['처방약',{text: rows.join(', ') ,colSpan: 3 },'',''],//td
		
		 ['진료기간',{text : data.DIAG_TIME, colSpan: 3},'',''],//td */
	
		 ['특기사항',{text : data.DIAGLIST_MEMO, colSpan: 3},'','']//td */
		
		 ]//end of body
		 }//end of table
		 }//테이블 그리기
		 ],
		 //하단의 현재페이지 / 페이지 수 넣기
		 footer: function (currentPage, pageCount) {
		 return {
		 margin: 10,
		 columns: [{
		 fontSize: 9,
		 text: [{
		 text: '--------------------------------------------------------------------------' +
		 '\n',
		 margin: [0, 20]
		 },
		 {
		 text: '' + currentPage.toString() + ' of ' +
		 pageCount,
		 }
		 ],
		 alignment: 'center'
		 }]
		 };

		 },
		 //필요한 스타일 정의하기
		 styles: {
		 style_test: {
		 fontSize: 18,
		 bold: true,
		 margin: [0, 0, 0, 0],
		 alignment: 'center'
		 },
		 tableExample: {
		 margin: [0, 5, 0, 15]
		 }
		 },

		 // 페이지 크기 용지의 크기 사이즈 넣기 또는 특정 사이즈 넣기 { width: number, height: number }
		 pageSize: 'A4',

		 /* 페이지 방향 portrait : 가로 , landscape : 세로 */
		 pageOrientation: 'portrait',
		 };

		 var pdf_name = '진단서.pdf'; // pdf 만들 파일의 이름
		 pdfMake.createPdf(documentDefinition).download(pdf_name);
		 //})
	}


function payment() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp59405263');
	
	$(document).on("click","#pay_doc",function(e){
	var resv_no=$(this).next().text()
	var vv2=$(this).next().next().text()
	
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
	  //  buyer_addr : resv_no,
	    m_redirect_url : 'http://192.168.0.114:80/hokwang/maindoc?resv_no='+resv_no
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    		var msg = '결제가 완료되었습니다.';
	    		msg += '고유ID : ' + rsp.imp_uid;
	    		msg += '상점 거래ID : ' + rsp.merchant_uid;
	    		msg += '결제 금액 : ' + rsp.paid_amount;
	    		msg += '카드 승인번호 : ' + rsp.apply_num;
	    		msg += '예약번호 : ' + rsp.buyer_addr;
	    		
	    		alert("결제성공")
	    		
	    		//아작스 -> 컨트롤러 가서 매퍼간다음에 -> db->
	    		//ajax->update : status Y
	    		$.ajax({
					url : 'ajax/successDoc',
					type : 'GET',
					data : {
					resv_no : resv_no
				},
					error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data){
					$("#docBody").empty
					chgBaby()
					$("#btn_div").css("display","block");
		    		$("#pay_doc").css("display","none");
				}
	})//end of ajax
	    		} else {
	    			var msg = '결제에 실패하였습니다.';
	    			msg += '에러내용 : ' + rsp.error_msg;
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    	   //성공시 이동할 페이지
	    	console.log("@@@@@@@@@@@@@@12345>");
	    	console.log(resv_no+"vvvvvvvvvvvvvv"+vv2);
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
		var resv_no=$(this).next().text()
		location.href="doc?resv_no=" + resv_no
	})
}

function selectBabyResult(data){
	$("#docBody").empty();
	
	$.each(data,function(idx, item) {
						 if (item.DOC_STATUS == "N") {
								$("#docBody").append($('<div>').attr('class','col-12')
										.append($('<div>').attr('class','card').attr('style', 'padding:10px; margin-bottom:10px;')
											.append($("<p>").attr("id",'diag_times').html('진료일시 : ' + item.DIAG_TIME))
											.append($("<p>").attr("id",'diag_names').html("이름 : " + item.BABY_NAME))
											.append($("<p>").attr("id",'doc_dis').html("질병 : " +item.DIS_NAME))//onclick="location.href='doc2'"
											.append($("<p>").attr("id",'doc_price').html("질병가격 : " +item.DIS_PRICE))
											.append($('<input>').attr("type",'button').attr("id","pay_doc").attr("value","결제").attr("style","width:100px; background:#a0c49d; border:0px; color:white;").attr("class","pdfmakes btn"))
											.append($("<input>").attr("id",'doc_res').attr("type","hidden").html(item.RESV_NO))
											.append($("<input>").attr("id",'doc_stu').attr("type","hidden"))));
											//.append($("<div>").attr("id","btn_div").attr("style","display:none").append($('<input>').attr("type",'button').attr("id","pdfmake")
											//.attr("class","pdfmakes").attr("value","pdf_file만들기").attr("style","width:60px")))))
						 }else
						 {
								$("#docBody").append($('<div>').attr('class','col-12')
										.append($('<div>').attr('class','card').attr('style', 'padding:10px; margin-bottom:10px;').attr('class','card')
											.append($("<p>").attr("id",'diag_times').html('진료일시 : ' + item.DIAG_TIME))
											.append($("<p>").attr("id",'diag_names').html("이름 : " + item.BABY_NAME))
											.append($("<p>").attr("id",'doc_dis').html("질병 : " +item.DIS_NAME))//onclick="location.href='doc2'"
											.append($("<p>").attr("id",'doc_price').html("질병가격 : " +item.DIS_PRICE))
											//.append($('<input>').attr("type",'button').attr("id","pay_doc").attr("value","결제").attr("style","width:50px;display:block"))
											.append($("<input>").attr("id",'doc_res').attr("type","hidden").html(item.RESV_NO))
											.append($("<div>").attr("id","btn_div").append($('<input>').attr("type",'button').attr("id","pdfmake")
											.attr("class","pdfmakes btn").attr("value","증명서 출력").attr("style","width:100px; background:#78aac3; color:white;")))))
						 }
	});
}
</script>
</head>
<body>
	<h1 class="h3 mb-3">증명서 페이지</h1>
	<div>
	<select class="form-control" name="baby_no" id="baby-names" style="margin-bottom: 10px;"
			onchange="chgBaby()">
			<option value="" selected>==자녀선택==</option>
		</select>
	</div>
		<!-- <button id="pdfmake">pdf_file 만들기</button>  -->
	<div class="row" id="docBody"></div>
	
</body>
</html>