<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.4.1.js"></script>
<title>Ajax 기본통신</title>
<script>
	$(function() {

		var test;
		console.log(1);

		//ajax 내부 function()의 실행 가능성은 알 수 없음
		$.ajax({
			//js 객체형태
			//요청주소
			url : "ajaxtest1",
			//어떤 타입의 요청인지
			type : "get",
			//요청이 성공적으로 실행되었다는 응답을 받았을 때의 콜백함수
			//자바-js사이의 언어를 변환해주는 것(?)
			success : function(data) {
				test = data;
				$('#div').html(test);
				//비동기 처리의 결과로 뭔가 하고 싶을때는 비동기 요청 내부에 있어야 함
				console.log(2);
			},
			//터졌을 때 실행할 콜백함수
			error : function() {
				alert("실패");
			}
		});
		
// 		$('#div').html(test);
		//undefind -> ajax 실행과 별개; 언제 갈 지 모름
// 		console.log(test);
		console.log(3);
	});
</script>
</head>
<body>

	<div id="div"></div>

</body>
</html>