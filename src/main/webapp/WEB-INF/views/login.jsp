<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<title>로그인</title>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1?ver=1.1">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/x-icon" href="favicon.ico">

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
<link rel="stylesheet" href="/resources/assets/vendor/css/rtl/uikit.css">


<!-- Core scripts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="/resources/assets/vendor/css/pages/authentication.css">
</head>

<body>
	<!-- Content -->
	<div class="authentication-wrapper authentication-3">
		<div class="authentication-inner">
			<!-- Side container -->
			<div
				class="d-none d-lg-flex col-lg-8 align-items-center ui-bg-cover ui-bg-overlay-container p-5"
				style="background-image: url('/resources/assets/img/background.jpg');">
				<div class="ui-bg-overlay bg-dark opacity-50"></div>
				<div class="w-100 text-white px-5">
					<h1 class="display-2 font-weight-bolder mb-3">SAFE FOOD</h1>
					<h3>Project for Healthy Life</h3>
					<div class="text-large font-weight-light">
						● 알러지 식품 정보를 통해 안전한 식품을 확인해 보세요 !<br> ● 내 섭취목록으로 영양 정보를 체크하세요
						!<br> ● 다양한 식품을 검색해보세요 !
					</div>
				</div>
			</div>
			<!-- / Side container -->

			<!-- Form container -->
			<div class="d-flex col-lg-4 align-items-center bg-white p-5">
				<div class="d-flex col-sm-7 col-md-5 col-lg-12 px-0 px-xl-4 mx-auto">
					<div class="w-100">

						<c:if test="${not empty msg}">
							<h5 class="text-center text-primary font-weigth-bold mt-4 mb-0">${msg }</h5>
						</c:if>

						<!-- Form -->
						<form class="my-5" action="login" method="post">
							<div class="form-group">
								<label class="form-label">ID</label> <input type="text"
									name="id" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label"> Password </label> <input
									type="password" name="pwd" class="form-control">
							</div>
							<div class="form-group">
								<input style="width: 100%" type="submit" class="btn btn-primary"
									value="Sign in">
							</div>
						</form>
						<!-- / Form -->

						<div class="text-center text-muted">
							Don't have an account yet? <a href="signUp">Sign Up</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Form container -->
		</div>
	</div>
</body>

</html>