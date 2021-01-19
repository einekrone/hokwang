<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
    margin-top: 10px;
}

.nav-tabs > li {
    position:relative;    
}

.nav-tabs > li > a {
    display:inline-block;
}

.nav-tabs > li > span {
    display:none;
    cursor:pointer;
    position:absolute;
    right: 6px;
    top: 8px;
    color: red;
}

.nav-tabs > li:hover > span {
    display: inline-block;
}
</style>
<script type="text/javascript">
$(function() {
	babyList()
	tabclick()
})
</script>
<script type="text/javascript">

function tabclick(){
	$(".nav-tabs").on("click", "a", function(e) {
	    e.preventDefault();
	    $(this).tab('show');
	  })
	  .on("click", "span", function() {
	    var anchor = $(this).siblings('a');
	    $(anchor.attr('href')).remove();
	    $(this).parent().remove();
	    $(".nav-tabs li").children('a').first().click();
	  });

	$('.add-contact').click(function(e) {
	  e.preventDefault();
	  var id = $(".nav-tabs").children().length; //think about it ;)
	  $(this).closest('li').before('<li><a href="#contact_' + id + '" data-toggle="tab">New Tab</a><span>x</span></li>');
	  $('.tab-content').append('<div class="tab-pane" id="contact_' + id + '">Contact Form: New Contact ' + id + '</div>');
	});

	$(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function(e) {
	  var target = $(e.target).attr("href");
	  alert('clicked on tab' + target);
	})
}

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

function selectBabyResult(data){
	$("#docBody").empty();
	
	$.each(data,function(idx, item) {
		console.log(">>>>>>>>>>>" +idx)
	$("#docBody").append($('<div>').attr('class','col-12')
					.append($('<div>').attr('class','card')
						.append($("<p>").attr("id",'diag_times').html('진료일시 : ' + item.DIAG_TIME))
						.append($("<p>").attr("id",'diag_names').html("이름 : " + item.BABY_NAME))
						.append($("<p>").attr("id",'doc_price').html("질병 : " +item.DIS_NAME))
						.append($("<p>").attr("id",'doc_price').html("가격 : " +item.DIS_PRICE))
						.append($('<input>').attr("type",'button').attr("id","pay_doc").attr("value","결제").attr("style","width:50px"))
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
	
	<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#contact_01" data-toggle="tab">Joe Smith</a><span>x</span></li>
        <li><a href="#contact_02" data-toggle="tab">Molly Lewis</a><span>x</span> </li>
        <li><a href="#" class="add-contact" data-toggle="tab">+ Add Contact</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="contact_01">Contact Form: Joe Smith</div>
        <div class="tab-pane" id="contact_02">Contact Form: Molly Lewis</div>
    </div>
</div>
</body>
</html>