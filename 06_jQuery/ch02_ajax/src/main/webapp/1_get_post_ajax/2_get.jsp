<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function(){
			/*$.get(요청경로, callback(data, status){
				data: 요청경로 수행 결과(중복된 ID/사용 가능 ID)
				status : success/fail}
			*/ 			
			$('button').click(function(){
				var id = $('input[name="id"]').val();			
				$.get('midConfirm.jsp?id='+id, function(data, status){
					if(status == 'success'){
					$('span#idConfirm').html(data);
					}//if
				});//$.get함수
			});// click 함수
			$('input[name="id"]').keyup(function(){
				var id = $(this).val();
				if(id.length < 3){
					$('span#idConfirm').text('3글자 이상 입력하세요');
				}else{
					$.get('midConfirm.jsp?id='+id, function(data, status){
						if(status == 'success'){
						$('span#idConfirm').html(data);
						}//if
					}); // get함수
				}// if
			});// keyup			
		});// ready 함수
	</script>
</head>
<body>
	아이디 <input type="text" name="id" autocomplete="off"> <button>중복체크</button><br>
	<span id="idConfirm"></span>
</body>
</html>