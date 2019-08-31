<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var id = '${sessionScope.id}';
	var quan = 1;
	var code;

	function eatFood(code) {
		$.ajax({
			type : 'post',
			url : '/member/addFood',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify({
				id : id,
				quan : quan,
				code : code
			}),
			success : function(result) {
				alert("추가 성공");
			},
			error : function(result) {
				alert("에러 발생");
			}
		});
	}

	function zzimFood(code) {
		$.ajax({
			type : 'post',
			url : '/member/addZzim',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify({
				id : id,
				code : code
			}),
			success : function(result) {
				alert("추가 성공");
			},
			error : function(result) {
				alert("에러 발생");
			}
		});
	}
</script>
</head>
<body>
	<div class="container-fluid" style="margin: 10px">
		<form class="form-inline" id="frm">
			<div class="form-group">
				<label style="color: black;">검색 조건</label> <select
					class="form-control"
					style="background-color: #8C8C8C; color: white; font-weight: bold; margin-left: 10px"
					id="searchCondition">
					<option value="">선택</option>
					<option value="name">상품명</option>
					<option value="maker">제조사</option>
					<option value="material">원재료</option>
				</select>
			</div>
			<div class="form-group ml-1" style="margin-left: 20px">
				<label style="color: black;">검색 단어</label> <input type="text"
					class="form-control" id="searchWord"
					style="background-color: #8C8C8C; margin-left: 10px">
				<button type="button" class="btn btn-info" id="searchBtn"
					style="margin-left: 10px" onclick="search()">검색</button>
			</div>
			<div class="form-group ml-1" style="margin-left: 20px">
				<select name="sortType" id="bs-multiselect-1" onchange="sort()">
					<option value="">선택</option>
					<option value="1">이름</option>
					<option value="2">열량</option>
				</select>
			</div>
		</form>
	</div>
</body>
</html>