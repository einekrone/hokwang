<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/diagnosis.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
div.dataTables_wrapper div.dataTables_paginate {
	margin-right: 30%;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		var searchType = "";
		var keyword = "";
		
		var dis_name =""; //질병이름
		var dis_comm = ""; //질병상세
		var pay_price = ""; //질병 가격
		
		var resv_no = ""; //예약번호
		var chk_type = ""; //진료타입
		var chk_no = "";
		var baby_no = "";
		
		waitList();
		resvHstList();
		resvUniq();
		getDiagDetail();
		getMedicineList();
		
		mediModal();
		mediSave();
		
		updatemediModal();
		mediUpdate();
		mediDelete();
		
		getDiseChg();
		loadDispaly();
		getDiseaseList();
	
		
		//진료 관련 버튼메뉴 출력
		$(".diagMenu").hide();
		
		//진료종료 버튼클릭
		$("#diagEnd").on('click',function(){
			diagEndInsert();
			insertPayment();
		});
		$("#prePhoto").on('click',function(){
			getImages();
		})
	});
	function openPrescript(){
		window.open("${pageContext.request.contextPath}/Prescript.jsp", "문진표", "width=1500, height=900");
	}
	
	function loadDispaly(){
		$("#diag3").css("display","none");
		$("#diag4").css("display","none");
		$("#diag5").css("display","none");
		$("#diag7").css("display","none");
	}
	
	function getImages() {
			$.ajax({
				url : 'ajax/getImages',
				type : 'GET',
				data : {
					resv_no : resv_no
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getImagesResult
			});
	}

	function getImagesResult(data) {
		$("#lastImagesList").empty();
		console.log(data);
		$.each(data, function(idx, item) {
			var img = document.createElement("img");
			img.setAttribute("src",
					"${pageContext.request.contextPath}/resources/img/"
							+ item.IMG_ADDR);
			img.setAttribute('style', 'margin:0 20px;');
			document.querySelector("#lastImagesList").appendChild(img);
		});
	}
	
	
	 //약품 인설트
	 function insertPayment(){
		console.log(resv_no);
		console.log(pay_price);
		 $.ajax({
				url : "ajax/insertPayment",
				type : 'POST',
				dataType : 'json',
				data : {
					pay_price : pay_price,
					resv_no : resv_no
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : alert("인설트 성공")
			});
	 }  

	
	//예방접종 리스트 뿌려줌
	function getCheckHist(){
		 $.ajax({
				url : 'ajax/getCheckHist',
				type : 'GET',
				dataType : 'json',
				data : {
					resv_no : resv_no,
					baby_no : baby_no
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getCheckHistResult
			});
	}
	
	function getCheckHistResult(data){
		$("#getCheckHist").empty();
		$.each(data, function(idx, item) {
			$("<tr>").append($('<td>').html(item.CHK_DIS))
					 .append($('<td>').html(item.CHK_NAME))
					 .append($('<td>').html(item.CHK_PRO))
					 .append($('<td>').html(item.HIST_DATE))
					 .appendTo($('#getCheckHist'));
		});
		
	}
	
	//예방접종 인설트
	function injectInsert(){
		 $.ajax({ 
             url: "ajax/insertInjection",  
             type: 'POST',
             data : {
             	chk_no : $("#injection").find('#chk_no').val(),
            	hist_state : $("#injection").find('#hist_state').val(),
            	resv_no : resv_no
             },
             error:function(xhr, status, message) { 
                 alert(" status: "+status+" er:"+message);
             },

             success: function(result){
            	 if (confirm('상기 예방접종을 등록하시겠습니까?')) {
            		 getCheckHist();
                	 insertPayment();
                	 UnChange();
                	 $(".btn_injectInsert").hide();
                	 alert("예방접종 등록 완료 되었습니다.")
            	 }else{
            		 alert("예방접종 등록을 취소하셨습니다.")
            	 }
             }
      });  		
	} 
	
  	  //진료 종료 인설트
	function diagEndInsert(){
		
		         $.ajax({ 
		             url: "ajax/insertDiagList",  
		             type: 'POST',  
		             data : {
		            	resv_no : resv_no,
		            	emp_no : "${emp_vo.emp_no}",
		            	diaglist_memo : $("#insertDiagList").find('#patient_records').val(),
		            	dis_code : $("#insertDiagLast").children().children().eq(0).text()
		             },
		             error:function(xhr, status, msg) { 
		                 alert(" status: "+status+" er:"+msg);
		             },
		             success : function(result){
		            	 UnChange();
		             } 
		});
	} 
	  
	function UnChange(){
		$.ajax({
			url : 'ajax/UpdateDiagStatus',
			data : {
				resv_no : resv_no,
				resv_status : $("#specValue").find("#End").val(),
				
			},
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(){
				$("#diag3").attr("disable", true);
				$("#diag4").attr("disable", true);
				$("#diag5").attr("disable", true);
				$("#diag6").attr("disable", true);
				$("#diag7").attr("disable", true);
				$(".diagMenu").hide();
			}
		});
	}
	
	//약 삭제
	function deleteMedicine(){
		 $("#deleteMediTr").on("click", function() {
				var td = $(this).parent().parent();
				td.remove();
		 });	
	}

 	//질병 삭제
	function deleteDisease(){
	$("#deleteDiseTr").on("click", function() {
		var td = $(this).parent().parent();
		td.remove();
 		});
	} 
	
	//질병검색
	function schd(){
		var keyword = $("#keyword3").val();
		console.log("keyword3 :" + keyword);
		getDiseaseList(keyword);
		$("#keyword3").val("");
	}
	  //약품 검색
	function schm(){
		var keyword = $("#keyword4").val();
		console.log("keyword4 :" + keyword);
		getMedicineList(keyword);
		$("keyword4").val("");
	};  
	
	//질병리스트 뿌려줌
	 function getDiseaseList(keyword){
		 $.ajax({
				url : 'ajax/getDisease',
				type : 'GET',
				//contentType:'application/json;charset=utf-8',
				dataType : 'json',
				data : {
					keyword : keyword
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getDiseaseListResult
			});
	 }
	  
	 function getDiseaseListResult(data){
		 $("#InsertDisease").empty();
			console.log("질병 data:"+data);
			$.each(data, function(idx, item) {
					$("<tr>").append($('<td>').html(item.dis_code))
							 .append($('<td>').html(item.dis_name))
							 .append($('<td>').html(item.dis_desc))
							 .append($('<td style="display:none;">').html(item.dis_price))
							 .appendTo("#InsertDisease");
			});
	 }

	 //약품리스트 뿌려줌
	 function getMedicineList(keyword){
		 $.ajax({
				url : 'ajax/getMedineList',
				type : 'GET',
				//contentType:'application/json;charset=utf-8',
				dataType : 'json',
				data : {
					keyword : keyword
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getMedineListResult
			});
	 }
	 
	 function getMedineListResult(data){
		 $("#schMedicineTd").empty();
			$.each(data, function(idx, item) {
				$("<tr data-toggle='modal' data-target='#mediModal'>")
						 .append($('<td>').html(item.medi_no))
						 .append($('<td>').html(item.medi_name))
						 .appendTo($('#schMedicineTd'));
			});
	 }
	 
	 //약품 모달 띄우기
	function mediModal(resv_no){
		$('#mediModal').on('show.bs.modal', function(event) {
			var tds = $(event.relatedTarget).find('td');
			var modal = $(this);
					
			modal.find('#medi_no').val(tds.eq(0).text())
			modal.find('#medi_name').val(tds.eq(1).text())
			modal.find('#pres_account').val(tds.eq(2).text())
			modal.find('#pres_count').val(tds.eq(3).text())
			modal.find('#pres_total').val(tds.eq(4).text())
			modal.find('#resv_no').val(tds.eq(5).text());
			
		});
	}
   	 //약품 인설트
	 function mediSave(){
		 $('#mediSave').on("click",function(){
			 console.log($('#medi_no').val());
			 console.log(resv_no)
			 $.ajax({
					url : "ajax/insertPres",
					type : 'POST',
					dataType : 'json',
					data : {
						medi_no : $('#medi_no').val(),
						medi_name : $('#medi_name').val(),
						pres_account : $('#pres_account').val(),
						pres_count : $('#pres_count').val(),
						pres_total : $('#pres_total').val(),
						resv_no : resv_no
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : lastInsertList
				});
		 });
	 }  
	 
	 //처방전 뿌려주기
	 function lastInsertList(){
		 $.ajax({
				url : "ajax/getPrescription",
				type : 'GET',
				dataType : 'json',
				data :{
					resv_no : resv_no
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : lastInsertListResult
			})
	 }
	 
	 function lastInsertListResult(data) {
			console.log(data);
		 $("#insertMedicine").empty();
			$.each(data, function(idx, item) {
				 $("<tr data-toggle='modal' data-target='#updatemediModal'>")
				 .append($('<td style="display:none;">').html(item.MEDI_NO))
				 .append($('<td>').html(item.MEDI_NAME))
				 .append($('<td>').html(item.PRES_ACCOUNT))
				 .append($('<td>').html(item.PRES_COUNT))
				 .append($('<td>').html(item.PRES_TOTAL))
				 .append($('<td style="display:none;">').html(item.PRES_NO))
				 .append($('<td style="display:none;">').html(item.RESV_NO))
				 .appendTo($('#insertMedicine'));
			});
		}
	 
	 //약품 수정/삭제 모달
	 function updatemediModal(resv_no){
			$('#updatemediModal').on('show.bs.modal', function(event) {
				var tds = $(event.relatedTarget).find('td');
				var modal = $(this);
				
				console.log(tds.eq(0).text());
				console.log(tds.eq(1).text());
				console.log(tds.eq(2).text());
				console.log(tds.eq(3).text());
				console.log(tds.eq(4).text());
				console.log(tds.eq(5).text());
				console.log(tds.eq(6).text());
				
				modal.find('#medi_no').val(tds.eq(0).text())
				modal.find('#medi_name').val(tds.eq(1).text())
				modal.find('#pres_account').val(tds.eq(2).text())
				modal.find('#pres_count').val(tds.eq(3).text())
				modal.find('#pres_total').val(tds.eq(4).text())
				modal.find('#pres_no').val(tds.eq(5).text())
				modal.find('#resv_no').val(tds.eq(6).text())
			});
		}
	 
	//약품 수정
	 function mediUpdate(){
		 $('#mediUpdate').on("click",function(){
			 console.log($('#pres_no').val());
			 $.ajax({
					url : "ajax/updatePrescription",
					type : 'POST',
					dataType : 'json',
					data : {
						medi_no : $("#updatemediModal").find('#medi_no').val(),
						medi_name : $("#updatemediModal").find('#medi_name').val(),
						pres_account : $("#updatemediModal").find('#pres_account').val(),
						pres_count : $("#updatemediModal").find('#pres_count').val(),
						pres_total : $("#updatemediModal").find('#pres_total').val(),
						pres_no : $("#updatemediModal").find('#pres_no').val(),
						resv_no : resv_no
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data){
						$("#insertMedicine").empty();
						lastInsertList();
					}
				});
		 });
	 }  
	 
	function mediDelete(){
		 $('#mediDelete').on("click",function(){
			 $.ajax({
					url : "ajax/deletePrescription",
					type : 'POST',
					dataType : 'json',
					data : {
						pres_no : $("#updatemediModal").find('#pres_no').val()
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data){
						$("#insertMedicine").empty();
						lastInsertList();
					}
				});
		 });
	}
	 
	 //상병 이동
	 function getDiseChg(){
		 $("body").on("click", "#InsertDisease tr", function() {
				var tdArr = new Array();
				var td = $(this).children();

				td.each(function(i) {
					tdArr.push(td.eq(i).text());
				});

				console.log("병 tr: "+ td.eq(1).text());
				
	  			$("#insertDiagLast").empty();
				$("<tr>").append($('<td style="display:none;">').html(td.eq(0).text()))
						 .append($('<td>').html(td.eq(1).text()))
					     .append($('<td>').html(td.eq(2).text()))
					     .append($('<td style="display:none;">').html(td.eq(3).text()))
				 		 .append($('<td> <button type="button" id="deleteDiseTr" onclick="deleteDisease()" style="width:50px;">X</button></td>'))
				 .appendTo($('#insertDiagLast'));
			
				 dis_name = td.eq(1).text();
				 dis_comm = td.eq(2).text();
				 pay_price = td.eq(3).text();
				 
				 console.log(dis_name);
				 console.log(dis_comm);
				 console.log(pay_price);
				 
			});
	 }
	 
	//진료 기록 상세
	function getDiagDetail() {
		$("body").on("click","#HistoryList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("진료번호 : " + td.eq(0).text());

			//진료기록 상세 다나옴
			$.ajax({
				url : 'ajax/Alldiag',
				data : {
					diag_no : td.eq(0).text(),
					resv_no : td.eq(2).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success :function(result){
					getDiagDetailResult(result.diag1);
					getDiagDetailResult3(result.diag1);
					getMedicineResult(result.medicine);
					getDiagDetailResult2(result.diag2);
					
				} 
			});
		});
	}
	 //진료일 펑션
	function getDiagDetailResult(data) {
		console.log(data);
		$("#diagDetail").empty();

		$("<tr>").append($("<td>").html(data.diag_time))
				 .appendTo('#diagDetail');

	}
	 //병 펑션
	function getDiagDetailResult2(data) {
		$("#diagDetail2").empty();
		$.each(data, function(idx, item) {
			$("<tr>").append($('<td>').html(item.DIS_NAME))
					.appendTo('#diagDetail2');
		});

	}
	 
	//의사 소견 펑션
	function getDiagDetailResult3(data) {

		console.log(data);
		console.log(data.diaglist_memo);
		$('#diagDetail3').empty();
		$('<tr>').append($('<td>').html(data.diaglist_memo)).appendTo(
				'#diagDetail3');
		console.log(data.diag_no);

	}
	//약 펑션
	function getMedicineResult(data) {
		$("#getMedicine").empty();
		 $.each(data, function(idx,item) {
			 var d = data[idx];
			 console.log(item.MEDI_NAME);
			$("<tr>").append($('<td>').html(item.MEDI_NAME)).append(
					$('<td>').html(item.PRES_COUNT)).append(
					$('<td>').html(item.PRES_ACCOUNT)).append(
					$('<td>').html(item.PRES_TOTAL)).appendTo('#getMedicine');		
		 });

	}
	//대기환자 함수
	function waitList() {
		$.ajax({
			url : 'ajax/waitList',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				emp_room : ${emp_vo.emp_room}
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : waitListResult
		});
	}

	//대기환자 리스트 출력
	function waitListResult(data) {
		$("#waitList").empty();
		$.each(data, function(idx, item) {
			var date = item.RESV_DATETIME.substring(0, 10);
			var d = new Date();
			var today = d.getFullYear() + '-' + (d.getMonth() + 1) + '-'
					+ d.getDate();

			$('<tr>').append(
					$('<td id="resvNo" value="'+item.RESV_NO+'">').html(
							item.RESV_NO)).append(
					$('<td>').html(item.RESV_DATETIME)).append(
					$('<td>').html(item.BABY_NAME)).append(
					$('<td>').html(item.CHK_TYPE)).append(
					$('<td style="display:none;">').html(item.BABY_NO))
					.appendTo('#waitList');
		});
		// Korean
		var lang_kor = {
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		}
		$('#waitList_table').DataTable({
			// 표시 건수기능 숨기기
			lengthChange : false,
			// 검색 기능 숨기기
			searching : false,
			// 정렬 기능 숨기기
			ordering : false,
			// 정보 표시 숨기기
			info : false,
			scrollY : 200,
			language : lang_kor
		});
	}
	// 진료/예약 이력 목록 클릭 시 특이사항 출력
	function resvUniq() {
		$("body").on("click", "#HistoryList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("진료번호 : " + td.eq(0).text());
			console.log("예약번호 : " + td.eq(2).text());

			$.ajax({
				url : 'ajax/MemoInfo',
				data : {
					resv_no : td.eq(2).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : MemoResult
			});
		});
	}

	function MemoResult(data) {
		$("#baby_unusual").empty();
		$("#baby_unusual").append($('<p>').html(data.RESV_DETAIL))
						  .append($('<hr>'))
						  .append($('<p>').html(data.RESV_MEMO));
	}

	// 환자목록 클릭 시 진료기록 목록 출력
	function resvHstList() {
		$("body").on("click", "#waitList tr", function() {

			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());

			});
			resv_no = td.eq(0).text();
			chk_type = td.eq(3).text();
			baby_no = td.eq(4).text();
			console.log("변수 예약번호 콘솔 :" +resv_no);
			console.log("변수 아기번호 콘솔 :" +baby_no);
			console.log("진료타입 : " + td.eq(3).text());
			console.log("아기번호 : " + td.eq(4).text());
			console.log("예약번호 : " + td.eq(0).text());
			$.ajax({
				url : 'ajax/HistoryList',
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : HistoryListResult
			});

			$.ajax({
				url : 'ajax/Info',
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : InfoResult
			});
			if (confirm('진료를 시작하시겠습니까?')) {
			$.ajax({
				url : 'ajax/UpdateDiagStatus',
				data : {
					resv_no : td.eq(0).text(),
					resv_status : $("#specValue").find("#Ing").val()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(){
					if(chk_type == "N"){
						$("#diag3").css("display","block");
						$("#diag4").css("display","block");
						$(".diagMenu").show();
					}else{
						$("#diag5").css("display","block");
						$("#diag6").css("display","none");
						$("#diag7").css("display","block");
						getInjection();
						getCheckHist();
					}

				}
			});
			alert('진료를 시작합니다.')
		}else{
			alert('진료를 시작을 취소합니다.')
		}
		});
	}

	function HistoryListResult(data) {
		$("#HistoryList").empty();
		$.each(data, function(idx, item) {
			$("<tr>").append($('<td style="display:none;">').html(item.DIAG_NO))
					 .append($("<td>").html(item.DIAG_TIME))
					 .append($('<td style="display:none;">').html(item.RESV_NO))
					 .append($('<td>').html(item.EMP_NAME))		
					 .appendTo('#HistoryList');
			console.log(item.DIAG_NO);
		});
	}

	function InfoResult(data) {
		$("#Info").empty();
		//var regno2 = data.BABY_REGNO2;
		$("#Info").append($('<p>').html('NO : ' + data.BABY_NO))
				  .append($('<p>').html('이름 : ' + data.BABY_NAME + " (" + data.BABY_BLOOD+ "형, " + data.BABY_GENDER + ")"))
		   		  .append($('<p>').html('주민번호 : ' + data.BABY_REGNO1 + '-' + data.BABY_REGNO2))
				  .append($('<hr>'))
				  .append($('<p>').html('보호자명 : ' + data.PARENT_NAME))
				  .append($('<p>').html('연락처 : ' + data.PARENT_TEL))
				  .append($('<p>').html('주소 : ' + data.PARENT_ADDR + ' '
												+ data.PARENT_ADDRDETAIL + ' '
												+ data.PARENT_POST))
	}
	
	//예방접종 띄우기
	function getInjection() {
		$.ajax({
			url : 'ajax/getInjection',
			type : 'GET',
			dataType : 'json',
			data : {
				resv_no : resv_no,
				emp_no : ${emp_vo.emp_no}
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : getInjectionResult
		});
	}
	function getInjectionResult(data){
		$("#injection").empty();
		console.log(data);
		pay_price = data.CHK_PRICE;
		console.log(pay_price);
			$("#injection").append($("<p>").html('질병명 : ' + data.CHK_DIS))
						   .append($("<p>").html('접종백신명(차수) : ' +data.CHK_NAME))	
					 	   .append($("<p>").html('접종 제품명  : ' + data.CHK_PRO))
					 	   .append($("<p>").html('제조사 : ' +data.CHK_COM))	
					 	   .append($("<p>").html('예진의사 : ' + data.EMP_NAME))
					 	   .append($("<p>").html('접종기관 : ' +data.HOSP_NAME))	
					 	   .append($('<p style="display:none;">').html(data.CHK_DIS))
					 	   .append($('<input style="display:none;" id="chk_no" name="chk_no">').val(data.CHK_NO))
					 	   .append($('<input style="display:none;" id="hist_state" name="hist_state" value="Y">'))
					 	   .appendTo('#injection');
	}

</script>
</head>
<body>
	<!-- 진료 전체 -->
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- 진료 1 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<!-- 환자정보 -->
				<div class="card shadow py-2" style="height: 280px;">
					<!-- wrapeer -->
					<div class="card-body">

						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자정보</span>
								<div style="width: 100%; height: 160px; overflow: auto;"
									id="Info"></div>
							</div>
						</div>
					</div>
					<!-- end of wrapeer -->
				</div>

				<!-- 특이사항 -->
				<div class="card shadow py-2" style="height: 150px; margin: 5px 0">
					<div class="card-body">
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-check"></i> <span class="tit"
									id="baby_unusual_title" style="font-weight: 600;">특이사항</span>
							</div>
							<div style="width: 100%; height: 96px; overflow: auto;"
								id="baby_unusual"></div>
						</div>

					</div>
				</div>
				<!-- 환자리스트 -->
				<div class="card shadow py-2" style="height: 410px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자리스트</span>
							</div>
						</div>
						<div id="content">
							<table class="table text-center" id="waitList_table">
								<thead>
									<tr id="nbda">
										<th class="text-center">NO</th>
										<th class="text-center">일시</th>
										<th class="text-center">성명</th>
										<th class="text-center">타입</th>
										<th style="display: none;"></th>
									</tr>
								</thead>
								<tbody id="waitList"></tbody>
							</table>
						</div>
						<div id="specValue" style="display: none;">
							<input type="number" id="NN" value="N" style="display: none;">
							<input type="text" id="Ing" value="I" style="display: none;">
							<input type="text" id="End" value="Y" style="display: none;">
						</div>
					</div>
				</div>
			</div>


			<!-- 진료 2 -->

			<div class="col-xl-3 col-md-6 mb-4">

				<!-- 환자 기록 -->
				<div class="card shadow py-2" style="height: 340px; margin-bottom: 10px;">
					<div class="card-body">
						<!-- 진료 기록 -->
						<div style="height: 310px; overflow: auto;">
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-file-medical"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">진료/접종 기록</span>
							</div>
							<table id="noborder_table" class="table" style="margin-top: 5px;">
								<thead>
									<tr id="nbab">
										<th>일시</th>
										<th>담당의</th>
									</tr>
								</thead>
								<tbody id="HistoryList"></tbody>
							</table>
						</div>
					</div>
				</div>


				<!-- 진료 기록 상세 -->

				<div class="card shadow py-2" style="height: 500px; overflow: auto;"
					id="diag6">
					<div class="card-body">

						<!-- logo -->
						<div class="title_logo">
							<i class="far fa-clipboard"></i>

							<!-- content -->
							<span class="tit" style="font-weight: 600;">진료 기록 상세</span>
						</div>

						<div class="card-body">

							<div style="height: 70px;">
								<table id="noborder_table">
									<thead>
										<tr id="nbab">
											<th>진료일</th>
										</tr>
									</thead>
									<tbody id="diagDetail" style="overflow: auto; width: 100%;"></tbody>
								</table>
							</div>

							<div style="height: 70px;">
								<table id="noborder_table">
									<thead>
										<tr id="nbab">
											<th>의사 소견</th>
										</tr>
									</thead>
									<tbody id="diagDetail3" style="overflow: auto; width: 100%;"></tbody>
								</table>
							</div>

							<div style="height: 70px;">
								<table id="noborder_table">
									<thead>
										<tr id="nbab">
											<th>상병</th>
										</tr>
									</thead>
									<tbody id="diagDetail2" style="overflow: auto; width: 100%;"></tbody>
								</table>
							</div>

							<div style="height: 70px;">
								<table id="noborder_table">
									<thead>
										<tr id="nbab">
											<th>처방</th>
										</tr>
										<tr>
											<th class="text-center">처방명</th>
											<th class="text-center">용량</th>
											<th class="text-center">일투</th>
											<th class="text-center">일수</th>
										</tr>
									</thead>
									<tbody id="getMedicine" style="overflow: auto; width: 100%;"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 접종 맞을 것-->
				<div class="card shadow py-2" style="height: 500px;" id="diag5">

					<div
						style="padding-left: 20px; padding-top: 20px; padding-right: 20px;">
						<!-- Title -->
						<div class="title_logo">
							<!-- logo -->
							<i class="fas fa-syringe"></i>
							<!-- content -->
							<span class="tit" style="font-weight: 600;">예방접종</span>
						</div>
					</div>

					<div class="card-body"
						style="width: 100%; height: 400px; padding-top: 5px;">
						<form id="injectInsert">
							<div>
								<div style="width: 100%;" id="injection"></div>
							</div>
							<div>
								<button type="button" class="btn_injectInsert"
									onclick="injectInsert();">예방접종 등록</button>
							</div>
						</form>
					</div>
				</div>

			</div>

			<!-- 진료 3 -->
			<div class="col-xl-3 col-md-6 mb-4" id="diag3">
				<form id="insertDiagList">
					<!-- 외래기록 -->
					<div class="card shadow py-2" style="height: 840px;">

						<div class="card-body" style="height: 200px;">
							<!-- Title -->
							<div>
								<!-- logo -->
								<div class="title_logo">
									<i class="fas fa-stethoscope"></i>

									<!-- content -->
									<span class="tit" style="font-weight: 600;">상병</span>

									<div>
										<div
											style="margin: 0 0 10px 0 !important; width: 90%; float: left;">

											<div class="input-group">
												<input type="text" class="form-control border-0 small"
													name="keyword3" id="keyword3" placeholder="질병명"
													aria-label="Search" aria-describedby="basic-addon2"
													onkeypress="if(event.keyCode=='13'){event.preventDefault(); schd();}">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button"
														id="schdisease" onclick="schd()">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="overflow: auto; width: 100%; height: 200px;">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 200px;">코드</th>
											<th style="width: 400px;">상병명</th>
											<th style="width: 500px;">상병상세</th>
										</tr>
									</thead>
									<tbody id="InsertDisease" style="overflow: auto; width: 100%;"></tbody>
								</table>
							</div>
						</div>

						<div class="card-body" style="height: 200px;">
							<!-- Title -->
							<div style="margin-top: 10px;">
								<!-- logo -->
								<div class="title_logo">
									<i class="fas fa-pencil-alt"></i>

									<!-- content -->
									<span class="tit" style="font-weight: 600;">진단서</span>
								</div>
								<!-- 진단서작성 -->
								<div style="overflow: auto; height: 350px;">
									<table>
										<thead>
											<tr>
												<th style="width: 300px;">상병명</th>
												<th style="width: 400px;">상병상세</th>
												<th style="width: 200px;">삭제</th>
											</tr>
										</thead>
										<tbody id="insertDiagLast"></tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="card-body" style="height: 200px;">
							<!-- Title -->
							<div>
								<!-- logo -->
								<div class="title_logo">
									<i class="fas fa-pencil-alt"></i>

									<!-- content -->
									<span class="tit" style="font-weight: 600;">의사 소견</span>
								</div>
							</div>

							<!--소견내용  -->
							<div>
								<textarea class="cont" id="patient_records" name="records"
									style="width: 100%; height: 200px;">
							</textarea>
							</div>
						</div>

					</div>
				</form>
			</div>

			<!-- 진료 4 -->
			<div class="col-xl-3 col-md-6 mb-4" id="diag4">
				<form id="insertMediList">
					<!-- 처방 -->
					<div class="card shadow py-2" style="height: 840px;">

						<div style="height: 100px; padding: 20px;">

							<!-- Title -->
							<div class="title_logo">
								<!-- logo -->
								<i class="fas fa-capsules"></i>
								<!-- content -->
								<span class="tit" style="font-weight: 600;">약품</span>
							</div>

							<!-- 검색버튼 -->
							<div style="margin: 0 0 10px 0 !important; width: 90%;">

								<div class="input-group">
									<input type="text" class="form-control border-0 small"
										name=keyword4 id="keyword4" placeholder="약품검색"
										aria-label="Search" aria-describedby="basic-addon2"
										onkeypress="if(event.keyCode=='13'){event.preventDefault(); schm();}">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button" id="schmedicine"
											onclick="schm()">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</div>

						</div>


						<!-- 약품리스트 -->
						<div class="card-body"
							style="overflow: auto; width: 100%; height: 200px;">
							<div>
								<table style="text-align: center;">
									<thead>
										<tr>
											<th style="width: 100px;">약품코드</th>
											<th>약품명</th>
										</tr>
									</thead>
									<tbody id="schMedicineTd"></tbody>
								</table>
							</div>
						</div>


						<!-- 처방내용  -->
						<div class="card-body" style="height: 400px;">
							<div>
								<!-- logo -->
								<i class="fas fa-capsules"></i>
								<!-- content -->
								<span class="tit" style="font-weight: 600;">처방전</span>
							</div>

							<!-- 처방전작성 -->
							<div style="overflow: auto; height: 350px;">
								<table style="">
									<thead>
										<tr>
											<th style="width: 400px;">약품명</th>
											<th style="width: 200px;">용량</th>
											<th style="width: 200px;">일수</th>
											<th style="width: 200px;">일투</th>
										</tr>
									</thead>
									<tbody id="insertMedicine"></tbody>
								</table>
							</div>

						</div>
					</div>
				</form>
			</div>

			<!-- 진료 5 -->
			<div class="col-xl-5 col-md-6 mb-4" id="diag7">

				<!-- 접종 내역-->
				<div class="card shadow py-2" style="height: 840px;">

					<div style="height: 100px; padding: 20px;">
						<!-- Title -->
						<div class="title_logo">
							<!-- logo -->
							<i class="fas fa-syringe"></i>
							<!-- content -->
							<span class="tit" style="font-weight: 600;">예방 접종 현황</span>
						</div>
					</div>
					<!-- 예방접종기록 -->
					<div class="card-body" style="height: 800px; overflow: auto;">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 200px;">질병명</th>
									<th style="width: 200px;">접종 백신명</th>
									<th style="width: 200px;">백신 제품명</th>
									<th style="width: 200px;">접종 일</th>
								</tr>
							</thead>
							<tbody id="getCheckHist"></tbody>
						</table>
					</div>
				</div>

			</div>






		</div>
	</div>
	<!-- 약품 insert Modal -->
	<div class="modal fade" id="mediModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">처방전 약품 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card" style="width: 30rem;">
						<div class="card-body">
							<span style="font-weight: 600;">약품 코드 :</span><input id="medi_no"
								style="padding: 5px; margin: 5px;" readonly /><br> <span
								style="font-weight: 600;"> 약품 명 : </span><input type="text"
								id="medi_name" style="padding: 5px; margin: 5px;" readonly /><br>
							<span style="font-weight: 600;"> 약 갯수 :</span><input type="text"
								id="pres_account" style="padding: 5px; margin: 5px;"><br>
							<span style="font-weight: 600;">일 투여 횟수 :</span><input
								type="text" id="pres_count" style="padding: 5px; margin: 5px;"><br>
							<span style="font-weight: 600;">총 투여 일수 :</span><input
								type="text" id="pres_total" style="padding: 5px; margin: 5px;"><br>
							<input type="text" id="resv_no" style="display: none;">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="mediSave"
						name="mediSave" data-dismiss="modal">Save</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 약품 update delete Modal -->
	<div class="modal fade" id="updatemediModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">처방전 약품 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card" style="width: 30rem;">
						<div class="card-body">
							<span style="font-weight: 600;">약품 코드 :</span><input id="medi_no"
								style="padding: 5px; margin: 5px;" readonly /><br> <span
								style="font-weight: 600;"> 약품 명 : </span><input type="text"
								id="medi_name" style="padding: 5px; margin: 5px;" readonly /><br>
							<span style="font-weight: 600;"> 약 갯수 :</span><input type="text"
								id="pres_account" style="padding: 5px; margin: 5px;"><br>
							<span style="font-weight: 600;">일 투여 횟수 :</span><input
								type="text" id="pres_count" style="padding: 5px; margin: 5px;"><br>
							<span style="font-weight: 600;">총 투여 일수 :</span><input
								type="text" id="pres_total" style="padding: 5px; margin: 5px;"><br>
							<input type="text" id="resv_no" style="display: none;"> <input
								type="text" id="pres_no" style="display: none;">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="mediUpdate"
						name="mediUpdate" data-dismiss="modal">update</button>
					<button type="button" class="btn btn-primary" id="mediDelete"
						name="mediDelete" data-dismiss="modal">delete</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 사진모달 -->
	<div class="modal fade" id="imagesModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 550px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">환자 사진</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>

				<div class="modal-body" style="min-height: 100px;">
					<div id="lastImagesList"
						style="max-height: 640px; overflow-y: auto; width: 100%;"></div>
					<div class="modal-footer text-center"
						style="justify-content: center !important;">
						<!-- disabled -->
						<button type="button" style="margin: 0 25px;" id="imgCBtn"
							data-dismiss="modal">취소</button>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>