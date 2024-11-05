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
			//p태그와 input 태그에 내용을 넣기
			$('p#msg').html('<b>중복된 아이디 입니다</b>');
			//$('p#msg').text('사용가능 해'); 태그를 같이 넣을수가 없다
			$('input[name="msg"]').val('Hello, World');
			//button 클릭시 : p태그내용과 input태그 value를 가져와서 alert창에 출력하세요
			$('button').click(function(){
				var pMsgTag = $('p#msg').html(); //<b>중복된 아이디 입니다</b>
				var pMsgText = $('p#msg').text(); // 중복된 아이디 입니다
				var inputMsg = $('input[name="msg"]').val(); // value값
				alert(pMsgTag + '\n' + pMsgText + '\n' + inputMsg);
			});
		});
	</script>
</head>
<body>
	<p id="msg"></p>
	<p>정보 : <input type="text" name="msg"></p>
	<button>msg 내용 alert</button>
</body>
</html>