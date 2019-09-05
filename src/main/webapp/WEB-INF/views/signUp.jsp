<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko" class="default-style">

<head>
<title>회원 등록</title>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/x-icon" href="favicon.ico">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900"
	rel="stylesheet">

<!-- Icon fonts -->
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/fontawesome.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/ionicons.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/linearicons.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/open-iconic.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/pe-icon-7-stroke.css">

<!-- Core stylesheets -->
<link rel="stylesheet"
	href="/resources/assets/vendor/css/rtl/bootstrap.css"
	class="theme-settings-bootstrap-css">
<link rel="stylesheet"
	href="/resources/assets/vendor/css/rtl/appwork.css"
	class="theme-settings-appwork-css">
<link rel="stylesheet"
	href="/resources/assets/vendor/css/rtl/theme-corporate.css"
	class="theme-settings-theme-css">
<link rel="stylesheet"
	href="/resources/assets/vendor/css/rtl/colors.css"
	class="theme-settings-colors-css">
<link rel="stylesheet" href="/resourcescss/demo.css">

<!-- Load polyfills -->
<script src="/resources/assets/vendor/js/polyfills.js"></script>
<script>document['documentMode']===10&&document.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')</script>

<script src="/resources/assets/vendor/js/material-ripple.js"></script>
<script src="/resources/assets/vendor/js/layout-helpers.js"></script>

<!-- Core scripts -->
<script src="/resources/assets/vendor/js/pace.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Libs -->
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<!-- Page -->
<link rel="stylesheet"
	href="/resources/assets/vendor/css/pages/authentication.css">
</head>

<body>
	<div class="page-loader">
		<div class="bg-primary"></div>
	</div>

	<!-- Content -->

	<div class="authentication-wrapper authentication-3">
		<div class="authentication-inner">

			<!-- Side container -->
			<!-- Do not display the container on extra small, small and medium screens -->
			<div
				class="d-none d-lg-flex col-lg-8 align-items-center ui-bg-cover ui-bg-overlay-container p-5"
				style="background-image: url('/resources/img/background.jpg');">
				<div class="ui-bg-overlay bg-dark opacity-50"></div>

				<!-- Text -->
				<div class="w-100 text-white px-5">
					<h1 class="display-2 font-weight-bolder mb-4">
						SAFE<br>FOOD
					</h1>
					<div class="text-large font-weight-light">건강한 삶을 위한 먹거리 프로젝트</div>
				</div>
				<!-- /.Text -->
			</div>
			<!-- / Side container -->

			<!-- Form container -->
			<div class="d-flex col-lg-4 align-items-center bg-white p-5">
				<!-- Inner container -->
				<!-- Have to add `.d-flex` to control width via `.col-*` classes -->
				<div class="d-flex col-sm-7 col-md-5 col-lg-12 px-0 px-xl-4 mx-auto">
					<div class="w-100">


						<h4 class="text-center text-lighter font-weight-normal mt-5 mb-0">Create
							an Account</h4>

						<!-- Form -->
						<form class="my-5" id="form" action="save" method="post">
							<div class="form-group">
								<label class="form-label">ID</label> <input type="text" id="id"
									name="id" class="form-control" placeholder="Your ID">
							</div>
							<div class="form-group">
								<label class="form-label">Password</label> <input
									type="password" id="pwd" name="pwd" class="form-control"
									placeholder="Your Password">
							</div>
							<div class="form-group">
								<label class="form-label">Your name</label> <input type="text"
									id="name" name="name" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Your address</label> <input
									type="text" id="addr" name="addr" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">Your phone number</label> <input
									type="text" id="phone" name="phone" class="form-control">
							</div>

							<!-- Checkbox -->
							<div class="form-group">
								<label class="form-label">Allergy Info</label><br>
								<c:forEach items="${allergins }" var="aller" varStatus="status">
									<div class="col-sm-2 btn-group">
										<label class="custom-control custom-checkbox m-0"> <input
											type="checkbox" name="allergy" value="${aller.code }"
											class="custom-control-input"> <span
											class="custom-control-label">${aller.name }</span>
										</label>
									</div>
								</c:forEach>
							</div>
							<button type="button" id="submitBtn"
								class="btn btn-primary btn-block mt-4">Sign Up</button>
							<div class="text-light small mt-4">
								By clicking "Sign Up", you agree to our <a href="#">terms of
									service and privacy policy</a>. We’ll occasionally send you account
								related emails.
							</div>
						</form>
						<!-- / Form -->

						<div class="text-center text-muted">
							Already have an account? <a href="login">Sign In</a>
						</div>

					</div>
				</div>
			</div>
			<!-- / Form container -->

		</div>
	</div>

	<!-- / Content -->

	<!-- Core scripts -->
	<script src="/resources/assets/vendor/libs/popper/popper.js"></script>
	<script src="/resources/assets/vendor/js/bootstrap.js"></script>
	<script src="/resources/assets/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script
		src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>

	<script type="text/javascript">
	var id;
	var pwd;
	var name;
	var addr;
	var phone;
	var allergy = new Array();

	$(function() {
		$("#submitBtn").on('click', function(source) {
			id = $("#id").val();
			pwd = $("#pwd").val();
			name = $("#name").val();
			addr = $("#addr").val();
			phone = $("#phone").val();
			$('input:checkbox[name="allergy"]').each(function() {
				if (this.checked == true) {
					allergy.push(this.value);
				}
			});
			
			if(id.length == 0){
				alert("회원아이디는 필수입력 항목입니다.");
				return;
			}
			
			if(pwd.length == 0){
				alert("비밀번호는 필수입력 항목입니다.");
				return;
			}
			
			if(pwd.length < 6){
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.")
				return;
			}
			
			if(name.length == 0){
				alert("회원이름은 필수입력 항목입니다.");
				return;
			}
			
			if(phone.length == 0){
				alert("전화번호는 필수입력 항목입니다.");
				return;
			}
			
			$("#form").submit();
		});
	});
</script>

</body>

</html>