<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 1px solid black;
	}
	tr, td{
		text-align: center;
		height: 50px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		count = 0;
		first = "";
		
		$('td').on('click', function() {
			
			count++;
			$(this).css( "backgroundColor", "yellow" );
			if(count == 1){
				first = $(this).text();
			}
			
			if(count == 2){
				count = 0;
				$(this).before(first);
				$('td').css( "backgroundColor", "" );
			}
			
			console.log(first + count + " " + $(this).text())
			
		});
	})
</script>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td></td>
			<td>전지혜</td>
			<td>신현근</td>
			<td>이지영</td>
			<td style="width: 220px;"></td>
			<td>김지완</td>
			<td>신국현</td>
			<td>이성일</td>
			<td></td>
		</tr>
		<tr>
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td></td>
			<td>변정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr>
			<td>김민정</td>
			<td>박승우</td>
			<td>김동혁</td>
			<td>이수진</td>
			<td></td>
			<td>홍기태</td>
			<td>김민욱</td>
			<td>진현성</td>
			<td>오미나</td>
		</tr>
		<tr>
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td></td>
			<td>배문기</td>
			<td>유이현</td>
			<td>이성일</td>
			<td></td>
		</tr>
	</table>
	
	<hr>
	<br><br>
	<button id="btnOut">현재 자리 출력하기</button>
	<div id="divOut">
		dd
	</div>	
	
	
	
	
	
</body>
</html>