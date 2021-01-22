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