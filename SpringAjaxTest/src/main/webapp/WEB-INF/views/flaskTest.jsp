<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.4.1.js"></script>
<title>플라스크 api 테스트 페이지</title>
<script>
$(function(){
	$('#testBtn').on('click', function(){
	    var id = $('#username').val();
	    var pwd = $('#password').val();
		var data = {
			username : id,
			password : pwd
		}
		var jsonData = JSON.stringify(data);
		$.ajax({
	        url : "http://127.0.0.1:5000/api/login",
	        type: "post",
	        contentType : "application/json; charset=UTF-8",
	        data: jsonData,
	        success: function(data){
	            $('#result').html(data);
	        }, error : function(data){
	            $('#result').html(data);
	        }
	    })
	})
})
</script>
</head>
<body>
<h1>플라스크 테스트 중</h1>
<input type="text" id="username">
<input type="text" id="password">
<input type="button" value="클릭" id="testBtn">
<div id="result"></div>
</body>
</html>