<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>ajaxBoard</title>
<script>

	$(function() {
		deleteFunc();
		$('#insertBtn').on('click', function() {
			var name = $('#name').val();
			var text = $('#text').val();

			$.ajax({
				url : "insertBoard",
				type : "post",
				data : {
					board_nm : name,
					board_context : text
				},
				success : function(data) {
					var str = output(data);
					$('#tbody').html(str);
					$('#name').val("");
					$('#text').val("");
					deleteFunc();
				},
				error : function() {
					console.log("실패");
				}
			});
		});
		//삭제된 이후에 다시 리스트를 가져와서 뿌려주는 것이기 때문에 -> 새로운 태그가 됨, 이벤트도 새로
		function deleteFunc() {
			$('.deleteBtn').on('click', function() {
			//기존 코드를 변경하지 않고 선택 가능 $(this) ->지금 눌린 버튼
			//closest 선택된 대상으로부터 가장 가까운 부모를 선택함
			//find 선택된 대상으로부터 후손 모두를 선택함
				var boardNo = $(this).closest('tr').find('td').eq(0).text();
// 				var testNo = $(this).closest('td').find('.hiddenNo').val();
				$.ajax({
					url : "deleteBoard",
					type : "get",
					data : {
						board_no : boardNo
					},
					success : function(data) {
						var str = output(data);
						$('#tbody').html(str);
						//재귀함수
						deleteFunc();
					},
					error : function(e) {
						console.log(e);
					}
				});
			});
		}

		function output(data) {
			var str = '';
			$.each(data,function(index, item) {
				str += '<tr>';
				str += '<td>' + item.board_no + '</td>';
				str += '<td>' + item.board_nm + '</td>';
				str += '<td>' + item.board_context + '</td>';
				str += '<td><input type="button" class="deleteBtn" value="삭제"></td>';
				str += '<tr>';
			});
			return str;
		}
	});
</script>
</head>
<body>
	<div id="result">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>내용</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${requestScope.list}" var="board">
					<tr>
						<td>${board.board_no }</td>
						<td>${board.board_nm }</td>
						<td>${board.board_context }</td>
						<td><input type="hidden" class="hiddenNo"
							value="${board.board_no}"> <input type="button"
							class="deleteBtn" value="삭제"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<span>이름</span><input type="text" id="name"> <span>내용</span><input
			type="text" id="text"> <input type="button" id="insertBtn"
			value="등록">
	</div>

</body>
</html>