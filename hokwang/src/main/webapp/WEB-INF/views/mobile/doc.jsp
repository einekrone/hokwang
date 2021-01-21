<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- pdf를 만등주기 위한 pdfmake js 파일 -->
<script
	src="${pageContext.request.contextPath}/resources/js/pdfmake.min.js"></script>
<!-- 한글의 깨짐을 해결하기 위한 js 파일 -->
<script
	src="${pageContext.request.contextPath}/resources/js/vfs_fonts.js"></script>

<script type="module" src="https://unpkg.com/jspdf-autotable"></script>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.min.js.map"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-color: #93a1a1;
	border-spacing: 0;
}

.tg td {
	background-color: #fdf6e3;
	border-color: #93a1a1;
	border-style: solid;
	border-width: 1px;
	color: #002b36;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	background-color: #657b83;
	border-color: #93a1a1;
	border-style: solid;
	border-width: 1px;
	color: #fdf6e3;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-vxds {
	background-color: #eee8d5;
	border-color: #000000;
	text-align: left;
	vertical-align: top
}

.tg .tg-wp8o {
	border-color: #000000;
	text-align: center;
	vertical-align: top
}

.tg .tg-73oq {
	border-color: #000000;
	text-align: left;
	vertical-align: top
}

.tg .tg-xwyw {
	border-color: #000000;
	text-align: center;
	vertical-align: middle
}

.tg .tg-0a7q {
	border-color: #000000;
	text-align: left;
	vertical-align: middle
}

  html {
      box-sizing: border-box;
    }

    *,
    *:before,
    *:after {
      box-sizing: inherit;
    }
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#print").click(function() {
			$("#report").printThis();
		});
		//pdfdown 버튼 클릭시 report 하위 div가 canvas 변환 -> pdf 다운로드
		$("#pdfdown").click(function() {
			html2canvas(document.getElementById("report"), {
				onrendered : function(canvas) {
					var imgData = canvas.toDataURL('image/png');
					console.log('Report Image URL: ' + imgData);
					var doc = new jsPDF('p', 'mm', [ 297, 210 ]);
					doc.addImage(imgData, 'PNG', 10, 10, 190, 95);
					doc.save('sample-file.pdf');
				}
			});
		});

		
		$("#pdfmake").click(function () { //버튼 id pdfmake 발생시 행동할 이벤트
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
			 ['성명',//tr
			{ text: '여기 성명입력', italics: true, color: 'black' },//td
			{ text: '성별', italics: true, color: 'black' },
			{ text: '여기성별입력', italics: true, color: 'black' }],//td
			
			 ['주소',//tr
			{ text: '여기 주소', italics: true, color: 'black' },
			{ text: '주민번호', italics: true, color: 'black' },
			{ text: '주민번호 입력', italics: true, color: 'black' }],//td

			
			 ['상병명',//tr
			{ text: ' 감기 ,너무아픈 다리', italics: true, color: 'black',colSpan: 3 },'',''],//td
			
			 ['진료기간',//tr
			{ text: '2020/01/21', italics: true, color: 'black',colSpan: 3 },'',''],//td */
		
			 ['특기사항',//tr
			{ text: '많이 아픈데 곧 괜찮아질듯', italics: true, color: 'black',colSpan: 3 },'','']//td  */
			
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
			 })
		
		
		
	})
</script>
 <script>

    </script>

<body>
	<button id="pdfmake">pdf_file 만들기</button> 
<!-- <input type="button" id="pdfdown" value="pdf다운로드"> -->
	<input type="button" id="print" value="출력">
	<div id="report">

		<table class="tg">
			<thead>
				<tr>
					<th class="tg-wp8o">성명</th>
					<th class="tg-73oq" colspan="3">여기가 이름입력</th>
					<th class="tg-xwyw" colspan="2">성별</th>
					<th class="tg-73oq" colspan="3">성별입력부분</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-wp8o">주소</td>
					<td class="tg-vxds" colspan="3">주소입력부분</td>
					<td class="tg-xwyw" colspan="2">주민번호</td>
					<td class="tg-73oq" colspan="3">주민입력부분</td>
				</tr>
				<tr>
					<td class="tg-wp8o" rowspan="5">상병명</td>
					<td class="tg-vxds" colspan="8" rowspan="5">병이름입력</td>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-wp8o">진료기간</td>
					<td class="tg-vxds" colspan="8">기간ㄴ입력</td>
				</tr>
				<tr>
					<td class="tg-wp8o" colspan="9">특기사항</td>
				</tr>
				<tr>
					<td class="tg-0a7q" colspan="9" rowspan="4">특이사항입력</td>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
			</tbody>
		</table>
		</div>
		
	
</body>
</html>