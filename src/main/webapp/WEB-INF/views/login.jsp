<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>로그인</title>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1?ver=1.1">
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
<link rel="stylesheet" href="/resources/assets/vendor/css/rtl/uikit.css">
<link rel="stylesheet" href="/resources/assets/css/demo.css">

<!-- Load polyfills -->
<script src="/resources/assets/vendor/js/polyfills.js"></script>
<script>document['documentMode']===10&&document.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')</script>

<script src="/resources/assets/vendor/js/material-ripple.js"></script>
<script src="/resources/assets/vendor/js/layout-helpers.js"></script>

<!-- Theme settings -->
<!-- This file MUST be included after core stylesheets and layout-helpers.js in the <head> section -->
<script src="/resources/assets/vendor/js/theme-settings.js"></script>
<script>
    window.themeSettings = new ThemeSettings({
      cssPath: '/resources/assets/vendor/css/rtl/',
      themesPath: '/resources/assets/vendor/css/rtl/'
    });
  </script>

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
			<div
				class="d-none d-lg-flex col-lg-8 align-items-center ui-bg-cover ui-bg-overlay-container p-5"
				style="background-image: url('/resources/assets/img/bg/21.jpg');">
				<div class="ui-bg-overlay bg-dark opacity-50"></div>

				<!-- Text -->
				<div class="w-100 text-white px-5">
					<h1 class="display-2 font-weight-bolder mb-3">
						SAFE FOOD
						<h3>Project for Healthy Life</h3>
					</h1>
					<div class="text-large font-weight-light"> 
						● 알러지 식품 정보를 통해 안전한 식품을 확인해 보세요 !<br>
						● 내 섭취목록으로 영양 정보를 체크하세요 !<br>
						● 다양한 식품을 검색해보세요 ! 
					</div>
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

						<!-- Logo -->
						<div class="d-flex justify-content-center align-items-center">
							<div class="ui-w-60">
								<div class="w-100 position-relative" style="padding-bottom: 54%">
									<img src="/resources/img/logo.png">
								</div>
							</div>
						</div>
						<!-- / Logo -->
						<h4 class="text-center text-lighter font-weight-normal mt-4 mb-0">Login to Your Account</h4>
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
								<label
									class="form-label d-flex justify-content-between align-items-end">
									<div>Password</div> <a href="javascript:void(0)"
									class="d-block small">Forgot password?</a>
								</label> <input type="password" name="pwd" class="form-control">
							</div>
							<div
								class="d-flex justify-content-between align-items-center m-0">
								<label class="custom-control custom-checkbox m-0"> <input
									type="checkbox" class="custom-control-input"> <span
									class="custom-control-label">Remember me</span>
								</label> <input type="submit" class="btn btn-primary" value="Sign in">
							</div>
						</form>
						<!-- / Form -->

						<div class="text-center text-muted">
							Don't have an account yet? <a href="signUp">Sign Up</a>
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

</body>

</html>