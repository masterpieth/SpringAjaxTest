<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 데이터 전달</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<script>
	// 그냥 click 만 쓰면 click을 실행하는 시점이 없기 때문에 'click이벤트를 연결하는 게' 실행이 안됨
	//$('#btn').on('click',function(){}) -> 이렇게만 쓸 경우
	//$(funtion(){}) 뜻: 페이지가 준비되면 function()을 실행
	//비동기통신은 주소표시줄에 영향 X -> 브라우저 history에 기록이 남지 않는다
	$(function() {
		$('#btn').on('click', function() {
			//클릭 당시의 id, pw value
			var id = $('#id').val();
			var pw = $('#pw').val();
			var fnc = function() {
				alert("성공");
			};
			$.ajax({
				url : "ajaxtest2",
				type : "get",
				data : {
					//속성명이 컨트롤러의 변수명과 일치해야 함
					//js 데이터를 자바 자료형으로 변환 -> json이 parsing
					custId : id,
					custPw : pw,
					custAge : 20,
					custFlag : false
				},
				success : fnc,
				error : function() {
				}
			});
		});

		$('#btn2').on('click', function() {
			var id = $('#id').val();
			var pw = $('#pw').val();

			$.ajax({
				url : "ajaxtest3",
				type : "post",
				data : {
					custId : id,
					custPw : pw,
					custAge : 20,
					custFlag : false
				},
				success : function(data) {
					console.log(data);
					// var temp = data.custId;
					// console.log(temp);
					if (data.custFlag) {
						$('#age').val(data.custAge);
					}
					;
				},
				error : function() {
				}
			});
		});
		$('#btn3').on('click', function() {
			var id = $('#id').val();
			var pw = $('#pw').val();

			//JSON.stringify(param); param로 전달된 데이터를 JSON 형태의 문자열로 변환(parsing) "{custId:id,~}"
			//전달된 문자열을 자바에서 해석 -> 

			$.ajax({
				url : "ajaxtest4",
				type : "post",
				//JSON은 {속성 : "값"}
				//전달되는 값이 JSON이라는 것을 명시해주어야 함
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					custId : id,
					custPw : pw,
					custArray : [ '1', '2', '3' ]
				}),
				success : function() {
					alert("성공");
				},
				error : function() {
					alert("실패");
				}
			});
		});
		$('#btn4').on('click', function() {
			//arraylist: 내부에 객체가 있는 배열로 전달받음
			//each문으로 꺼내서 사용
			$.ajax({
				url : "ajaxtest5",
				type : "get",
				success : function(data) {
					console.log(data);
					$.each(data, function(index, item) {
						console.log(item.custId);
						console.log(item.custArray);
						$.each(item.custArray, function(index2, item2) {
							console.log(item2);
						});
					});
				},
				error : function() {
					alert("실패");
				}
			});
		});
	});
</script>
</head>
<body>

	ID :
	<input type="text" id="id">
	<br> PW :
	<input type="password" id="pw">
	<br> AGE :
	<input type="number" id="age">
	<br>
	<input type="button" id="btn" value="전송">
	<input type="button" id="btn2" value="전송2">
	<input type="button" id="btn3" value="전송3">
	<input type="button" id="btn4" value="전송4">

</body>
</html>