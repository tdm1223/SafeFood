<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resurces/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resurces/js/jquery-3.3.1.js"></script>
<script src="/resurces/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$("#cancelBtn").on('click', function(source) {
		$("#form").attr("action", "/index");
		$("#form").submit();
	});

</script>
<style type="text/css">
#box{
	background-color: gray;
	padding-bottom: 3%;
}
#outer {
	background-color: #F5F5F5;
	border-radius: 20px;
	margin-top: 3%;
	padding: 40px;
	padding-top: 5px;
}

#signText {
	font-size: 3em;
	font-weight: bold;
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">비밀번호 찾기</p>
			<form class="form-horizontal" action="FindPw" method="post" id="form">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="id" id="id" required>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">핸드폰 번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="phone" id="phone" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info">
							확인<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="button" class="btn btn-danger" id="cancelBtn">
							취소<span class="glyphicon glyphicon-remove" style="margin-left: 15px"></span>
						</button>						
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>