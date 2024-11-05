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
			/* 	$.get(요청경로, callback)
				$.post(요청경로, 요청파라미터값의 객체, callback)
				$.ajax({
					url : 요청경로(★) ,  
					type : get/post
					data : 요청파라미터이름과값, 요청파라미터 값의 객체,
					dateType : 'html'/json/... 요청한 결로로 실행한 결과의 타입
					success : 요청경로 실행이 성공했을 경우, 수행할 콜백함수(★),
					error : 요청경로 실행시 실패했을 경우, 수행할 콜백함수
				});
			*/ 			
			$('button').click(function(){
				var id = $('input[name="id"]').val();			
				$.ajax({
					url : 'midConfirm.jsp',
					//type : 'get',
					//date : 'id='+id,
					type : 'post',
					data : {'id':id},
					dateType : 'html',
					success : function(data){ /*data : 요청경로 성공시 응답 받은 html */
						$('span#idConfirm').html(data);
					},
					error : function(code){/*code : 요청경로 실패시 상태정보 */
						alert(code.status + '/' + code.statusText)	
					}
				});// ajax				
			});// click 함수
			$('input[name="id"]').keyup(function(){
				var id = $(this).val();
				if(id.length < 3){
					$('span#idConfirm').text('3글자 이상 입력하세요');
				}else{
					$.ajax({
						url : 'midConfirm.jsp',
						//type : 'get',
						//date : 'id='+id,
						type : 'post',
						data : {'id':id},
						dateType : 'html',
						success : function(data){ /*data : 요청경로 성공시 응답 받은 html */
							$('span#idConfirm').html(data);
						},
						error : function(code){/*code : 요청경로 실패시 상태정보 */
							alert(code.status + '/' + code.statusText)	
						}
					});// ajax
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