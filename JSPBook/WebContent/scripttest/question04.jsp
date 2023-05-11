<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myProgress {
	  width: 100%;
	  background-color: #ddd;
	}
	#myBar {
	  width: 10%;
	  height: 30px;
	  background-color: #04AA6D;
	  text-align: center; /* To center it horizontally (if you want) */
	  line-height: 30px; /* To center it vertically */
	  color: white;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function move() {
	    var elem = document.getElementById("myBar");
	    var width = 1;
	    var id = setInterval(frame, 60);
	    function frame() {
	        if (width >= 100) {
	            clearInterval(id);
	        } else {
	            width++;
	            elem.style.width = width + '%';
	            document.getElementById("moveBar").innerHTML = width * 1  + '%';
	        }
	    }
	}
	$(function() {
		

		$('#btn').on('click', function() {
	
			var ran = parseInt(Math.random() * 36) + 1;

			var intervalId = setInterval(function() {
				var ran = parseInt(Math.random() * 36) + 1;
				
				$('td').css('background-color', 'white');
				$('td:eq(' + ran + ')').css('background-color', 'yellow');
				
				$('#myBar').attr("aria-valuemin")
				
				console.log($('td:eq(' + ran + ')').text() + " ran -> " + ran);
			}, 200);

			setTimeout(function() {
				clearInterval(intervalId);
			}, 6000);
	
		});
		
	})
</script>
</head>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table width="100%" border="1" style="text-align:center; font-size:24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">전지혜</td>
			<td width="10%">신현근</td>
			<td width="10%">이지영</td>
			<td width="20%"></td>
			<td width="10%">김지완</td>
			<td width="10%">신국현</td>
			<td width="10%">이성일</td>
			<td width="10%"></td>
		</tr>
		<tr height="80px">
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
		<tr height="80px">
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
		<tr height="80px">
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td></td>
			<td>배문기</td>
			<td>유이현</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<hr/>
	<div class="progress" style="height: 40px;">
		<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
			aria-valuemax="100" style="width: 1px; height: 40px;">
			<span class="sr-only" id="moveBar">60% Complete</span>
		</div>
	</div>
	<br/>
	<h4 id="txt"></h4>
	<button type="button" id="btn" style="padding:12px;border:none;cursor:pointer;" onclick="move()">출력</button>
</body>
</html>