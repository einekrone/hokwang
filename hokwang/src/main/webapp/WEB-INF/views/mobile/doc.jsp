<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="module" src="https://unpkg.com/jspdf"></script>
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

	})
</script>
 <script>
      function generate() {
        var doc = new jspdf.jsPDF()

        // Simple data example
        var head = [['ID', 'Country', 'Rank', 'Capital']]
        var body = [
          [1, 'Denmark', 7.526, 'Copenhagen'],
          [2, 'Switzerland', 7.509, 'Bern'],
          [3, 'Iceland', 7.501, 'Reykjavík'],
        ]
        doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#table' })

        doc.save('table.pdf')
      }
    </script>

<body>
	<input type="button" id="pdfdown" value="pdf다운로드">
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
		
		<table id="table"><!--오토테이블   -->
		<thead>
			<tr>
				<th>ID</th>
				<th>First name</th>
				<th>Last name</th>
				<th>Email</th>
				<th>Country</th>
				<th>IP-address</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Donna</td>
				<td>Moore</td>
				<td>dmoore0@furl.net</td>
				<td>China</td>
				<td>211.56.242.221</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Janice</td>
				<td>Henry</td>
				<td>jhenry1@theatlantic.com</td>
				<td>Ukraine</td>
				<td>38.36.7.199</td>
			</tr>
		</tbody>
	</table>
	</div>
	<button onclick="generate()">Generate pdf</button>
	
</body>
</html>