<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.dtext {
		width: 450px;
		height: 80px;
		border: 1px solid black;
	}
	
	#history{
		width: 450px;
		height: 200px;
		border: 1px solid black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var flag = false;
		var textBox = "";
		var elementBox;
		
		$('.dtext').on('click', function() {
			var boxSelContent = $(this).text();
			
			if(flag){
				flag = false;
				
				elementBox.html($(this).html());
				$(this).html(textBox);
				
				textBox = "";
				elementBox = null;
				$('.dtext').css('background-color', '');
			} else{
				flag = true;
				
				textBox = $(this).html();
				elementBox = $(this);
				
				$(this).css('background-color', 'yellow');
			}
			
			$('#history').append(boxSelContent + "가 선택되었습니다<br>");

			
			console.log(elementBox + "           " + textBox);
		});
		
		
		
		$('#pBtn').on('click', function() {
			
			var content = $('#content').val(); 
			var boxSelect = $('#boxSelect option:selected').val();
			var boxSelContent = $('#boxSelect option:selected').text();
			
			if(boxSelect == "1"){
				$('#firstDiv').html(content);
			} else if(boxSelect == "2"){
				$('#secondDiv').html(content);
			} else if(boxSelect == "3"){
				$('#thirdDiv').html(content);
			} else if(boxSelect == "4"){
				$('#fourDiv').html(content);
			} else{
				$('#firstDiv, #secondDiv, #thirdDiv, #fourDiv').html(content);
			}
			
			$('#history').append(boxSelContent + "가 출력되었습니다<br>");
			
			console.log(content + boxSelect)
		});
		
		var text = "";
		function process(ele, msg) {
			text += msg;
			ele.innerHTML = text;
			ele.scrollTop = ele.scrollHeight;
		}
	})
</script>
</head>
<body>
	<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll;" id="history"></div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	 
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
	
</body>
</html>