<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" class="default-style">
<head>
<title>SafeFood</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var list = new Array();
		<c:forEach var="content" items="${data}">
		list.push("${content.calory}");
		</c:forEach>
		list.reverse();
		var chart1 = new Chart(document.getElementById('statistics-chart-1')
				.getContext("2d"), {
			type : 'line',
			data : {
				labels : [ '2019-05', '2019-04', '2019-03', '2019-02',
						'2019-01', '2018-12', '2018-11', '2018-10', '2018-09',
						'2018-08', '2018-07', '2018-06' ],
				datasets : [
						{
							label : '${sessionScope.id}',
							data : [ list[0], list[1], list[2], list[3],
									list[4], list[5], list[6], list[7],
									list[8], list[9], list[10], list[11] ],
							borderWidth : 1,
							backgroundColor : 'rgba(38, 180, 255, 0.1)',
							borderColor : '#26B4FF',
							fill : false
						},
						{
							label : '평균',
							data : [ 2700, 2700, 2700, 2700, 2700, 2700, 2700,
									2700, 2700, 2700, 2700, 2700 ],
							borderWidth : 1,
							borderDash : [ 5, 5 ],
							backgroundColor : 'rgba(136, 151, 170, 0.1)',
							borderColor : '#8897aa'
						} ],
			},
			options : {
				scales : {
					xAxes : [ {
						gridLines : {
							display : false
						},
						ticks : {
							fontColor : '#aaa',
							autoSkipPadding : 50
						}
					} ],
					yAxes : [ {
						gridLines : {
							display : false
						},
						ticks : {
							fontColor : '#aaa',
							maxTicksLimit : 5
						}
					} ]
				},

				responsive : false,
				maintainAspectRatio : false
			}
		});

		if ($('html').attr('dir') === 'rtl') {
			$(
					'#type-gadgets-dropdown-menu, #new-users-dropdown-menu, #age-users-dropdown-menu')
					.removeClass('dropdown-menu-right');
		}

		// Resizing charts

		function resizeCharts() {
			chart1.resize();
		}

		// Initial resize
		resizeCharts();

		// For performance reasons resize charts on delayed resize event
		window.layoutHelpers.on('resize.dashboard-5', resizeCharts);
	});
</script>
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
<link rel="stylesheet" href="/resources/assets/vendor/css/rtl/uikit.css">
<link rel="stylesheet" href="/resources/assets/css/demo.css">

<!-- Load polyfills -->
<script src="/resources/assets/vendor/js/polyfills.js"></script>
<script>
	document['documentMode'] === 10
			&& document
					.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')
</script>

<script src="/resources/assets/vendor/js/material-ripple.js"></script>
<script src="/resources/assets/vendor/js/layout-helpers.js"></script>

<!-- Theme settings -->
<!-- This file MUST be included after core stylesheets and layout-helpers.js in the <head> section -->
<script src="/resources/assets/vendor/js/theme-settings.js"></script>
<script>
	window.themeSettings = new ThemeSettings({
		cssPath : '/resources/assets/vendor/css/rtl/',
		themesPath : '/resources/assets/vendor/css/rtl/'
	});
</script>

<!-- Core scripts -->
<script src="/resources/assets/vendor/js/pace.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Libs -->
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">

</head>

<body>
	<div class="page-loader">
		<div class="bg-primary"></div>
	</div>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-2">
		<div class="layout-inner">

			<!-- Layout sidenav -->
			<div id="layout-sidenav"
				class="layout-sidenav sidenav sidenav-vertical bg-dark">

				<!-- Brand demo (see /resources/assets/css/demo/demo.css) -->
				<div class="app-brand demo">
					<a href="/index"><img alt="로고" src="/resources/img/logo.png"
						width="50px"></a> <a href="/index"
						class="app-brand-text demo sidenav-text font-weight-normal ml-2">SafeFood</a>
					<a href="/index"
						class="layout-sidenav-toggle sidenav-link text-large ml-auto">
						<i class="ion ion-md-menu align-middle"></i>
					</a>
				</div>

				<div class="sidenav-divider mt-0"></div>

				<!-- Links -->
				<ul class="sidenav-inner py-1">

					<li class="sidenav-item open active"><a href="/index"
						class="sidenav-link"><i class="sidenav-icon ion ion-ios-home "></i>
							Dashboard </a></li>

					<li class="sidenav-item"><a href="javascript:void(0)"
						class="sidenav-link sidenav-toggle"><i
							class="sidenav-icon ion ion-md-search"></i> 맛집 검색 </a>
						<ul class="sidenav-menu">
							<li class="sidenav-item"><a href="/food/searchNaver"
								class="sidenav-link"> <i
									class="sidenav-icon ion ion-ios-list-box "></i>네이버 검색

							</a></li>
							<li class="sidenav-item"><a href="/food/searchBlog"
								class="sidenav-link"> <i
									class="sidenav-icon ion ion-md-images "></i>블로그 검색

							</a></li>
						</ul></li>

					<li class="sidenav-item"><a href="javascript:void(0)"
						class="sidenav-link sidenav-toggle"><i
							class="sidenav-icon ion ion-ios-pricetag"></i> 상품정보 </a>
						<ul class="sidenav-menu">
							<li class="sidenav-item"><a href="/food/list"
								class="sidenav-link"> <i
									class="sidenav-icon ion ion-ios-list "></i>리스트

							</a></li>
							<li class="sidenav-item"><a href="/food/imgList"
								class="sidenav-link"> <i
									class="sidenav-icon ion ion-md-images "></i>이미지

							</a></li>
						</ul></li>

					<li class="sidenav-item"><a href="/member/myEat"
						class="sidenav-link"><i class="sidenav-icon ion ion-md-beer"></i>
							내 섭취 정보</a></li>

					<li class="sidenav-item"><a href="/member/zzim"
						class="sidenav-link"><i class="sidenav-icon ion ion-md-heart"></i>
							찜 목록</a></li>

					<li class="sidenav-item"><a href="/qna/list"
						class="sidenav-link"><i class="sidenav-icon ion ion-md-help"></i>
							QnA </a></li>

					<!-- Layouts -->

					<li class="sidenav-divider mb-1"></li>
				</ul>
			</div>
			<!-- / Layout sidenav -->

			<!-- Layout container -->
			<div class="layout-container">
				<!-- Layout navbar -->
				<nav
					class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x"
					id="layout-navbar">

					<!-- Brand demo (see /resources/assets/css/demo/demo.css) -->
					<a href="/index"
						class="navbar-brand app-brand demo d-lg-none py-0 mr-4"> <span
						class="app-brand-text demo font-weight-normal ml-2">SafeFood</span>
					</a>

					<!-- Sidenav toggle (see /resources/assets/css/demo/demo.css) -->
					<div
						class="layout-sidenav-toggle navbar-nav d-lg-none align-items-lg-center mr-auto">
						<a class="nav-item nav-link px-0 mr-lg-4"
							href="javascript:void(0)"> <i
							class="ion ion-md-menu text-large align-middle"></i>
						</a>
					</div>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#layout-navbar-collapse">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="navbar-collapse collapse" id="layout-navbar-collapse">
						<!-- Divider -->
						<hr class="d-lg-none w-100 my-2">

						<div class="navbar-nav align-items-lg-center">
							<!-- Search -->
							<label class="nav-item navbar-text navbar-search-box p-0 active">
								<i class="ion ion-ios-search navbar-icon align-middle"></i> <span
								class="navbar-search-input pl-2"> <input type="text"
									class="form-control navbar-text mx-2" placeholder="Search..."
									style="width: 200px">
							</span>
							</label>
						</div>

						<div class="navbar-nav align-items-lg-center ml-auto">
							<!-- Divider -->
							<div class="demo-navbar-user nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#"
									data-toggle="dropdown"> <span
									class="d-inline-flex flex-lg-row-reverse align-items-center align-middle
									ion ion-ios-person">
										<span class="px-1 mr-lg-2 ml-2 ml-lg-0">${sessionScope.id }</span>
								</span>
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="/member/mypage" class="dropdown-item"> <i
										class="ion ion-md-settings text-lightest"></i> &nbsp; Account
										settings
									</a>
									<div class="dropdown-divider"></div>
									<a href="/logout" class="dropdown-item"> <i
										class="ion ion-ios-log-out text-danger"></i> &nbsp; Log Out
									</a>
								</div>
							</div>
						</div>
					</div>
				</nav>
				<!-- / Layout navbar -->

				<!-- Layout content -->
				<div class="layout-content">

					<!-- Content -->
					<div class="container-fluid flex-grow-1 container-p-y">

						<!-- Head stats -->
						<div
							class="row no-gutters container-m-nx container-m-ny bg-lighter bg-white container-p-x pb-3 mb-4">
							<div class="col-6 col-sm-3 col-md pt-3 pr-4">
								<div class="media align-items-center">
									<div
										class="ion ion-md-battery-charging text-twitter text-large"></div>
									<div class="media-body ml-3">
										<div class="text-big font-weight-bold line-height-1">${total.calory }</div>
										<div class="text-tiny line-height-1 mt-1">열량(kcal)</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-3 col-md pt-3 pr-4">
								<div class="media align-items-center">
									<div class="ion ion-md-battery-charging text-google text-large"></div>
									<div class="media-body ml-3">
										<div class="text-big font-weight-bold line-height-1">${total.carbo }</div>
										<div class="text-tiny line-height-1 mt-1">탄수화물(g)</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-3 col-md pt-3 pr-4">
								<div class="media align-items-center">
									<div
										class="ion ion-md-battery-charging text-facebook text-large"></div>
									<div class="media-body ml-3">
										<div class="text-big font-weight-bold line-height-1">${total.protein }</div>
										<div class="text-tiny line-height-1 mt-1">단백질(g)</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-3 col-md pt-3 pr-4">
								<div class="media align-items-center">
									<div
										class="ion ion-md-battery-charging text-pinterest text-large"></div>
									<div class="media-body ml-3">
										<div class="text-big font-weight-bold line-height-1">${total.fat }</div>
										<div class="text-tiny line-height-1 mt-1">지방(g)</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-3 col-md pt-3 pr-4">
								<div class="media align-items-center">
									<div
										class="ion ion-md-battery-charging text-instagram text-large"></div>
									<div class="media-body ml-3">
										<div class="text-big font-weight-bold line-height-1">${total.natrium }</div>
										<div class="text-tiny line-height-1 mt-1">나트륨(g)</div>
									</div>
								</div>
							</div>
						</div>
						<!-- / Head stats -->

						<!-- Traffic chart + sources -->
						<div class="card mb-4">
							<h5 class="card-header with-elements border-0 pt-3 pb-0">
								<span class="card-header-title"><i
									class="ion ion-md-stats text-primary"></i>&nbsp; 월간 섭취량</span>

								<div class="card-header-elements ml-auto">
									<div class="btn-group btn-group-sm btn-group-toggle"
										data-toggle="buttons">
										<label class="btn btn-default md-btn-flat active"> <input
											type="radio" name="btn-radio" checked> Month
										</label> <label class="btn btn-default md-btn-flat"> <input
											type="radio" name="btn-radio"> 6 Months
										</label> <label class="btn btn-default md-btn-flat"> <input
											type="radio" name="btn-radio"> Year
										</label> <label class="btn btn-default md-btn-flat"> <input
											type="radio" name="btn-radio"> 3 Years
										</label>
									</div>
								</div>
							</h5>
							<hr class="border-light mb-0">
							<div class="row no-gutters row-bordered">
								<div
									class="d-flex col-md-8 col-lg-12 col-xl-8 align-items-center p-4">
									<div class="w-100" style="height: 230px;">
										<canvas id="statistics-chart-1"></canvas>
									</div>
								</div>

								<!-- Sources -->
								<div class="col-md-4 col-lg-12 col-xl-4 px-4 pt-4">
									<div class="pb-4">
										열량
										<div class="float-right small mt-1">${total.calory }</div>
										<div class="progress mt-1" style="height: 3px;">
											<div class="progress-bar bg-twitter"
												style="width: ${total.calory/78000*100}%;"></div>
										</div>
									</div>
									<div class="pb-4">
										탄수화물
										<div class="float-right small mt-1">${total.carbo }</div>
										<div class="progress mt-1" style="height: 3px;">
											<div class="progress-bar bg-google"
												style="width: ${total.carbo/13800*100}%;"></div>
										</div>
									</div>
									<div class="pb-4">
										단백질
										<div class="float-right small mt-1">${total.protein }</div>
										<div class="progress mt-1" style="height: 3px;">
											<div class="progress-bar bg-facebook"
												style="width: ${total.protein/1650*100}%;"></div>
										</div>
									</div>
									<div class="pb-4">
										지방
										<div class="float-right small mt-1">${total.fat }</div>
										<div class="progress mt-1" style="height: 3px;">
											<div class="progress-bar bg-pinterest"
												style="width: ${total.fat/25500*100}%;"></div>
										</div>
									</div>
									<div class="pb-4">
										나트륨
										<div class="float-right small mt-1">${total.natrium }</div>
										<div class="progress mt-1" style="height: 3px;">
											<div class="progress-bar bg-instagram"
												style="width: ${total.natrium/45000*100}%;"></div>
										</div>
									</div>
								</div>
								<!-- / Sources -->

							</div>
						</div>
						<!-- / Traffic chart + sources -->

						<div class="row">
							<!-- Charts -->
							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.carbo }g</strong> <small
											class="font-weight-bold">탄수화물</small>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.protein }g</strong> <small
											class="font-weight-bold">단백질</small>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.fat }g</strong> <small
											class="font-weight-bold">지방</small>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.sugar }g</strong> <small
											class="font-weight-bold">당류</small>
									</div>
								</div>
							</div>
							<!-- / Charts -->
						</div>

						<!-- ------- row 2------------ -->

						<div class="row">

							<!-- Charts -->
							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.natrium }g</strong> <small
											class="font-weight-bold">나트륨</small>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.chole }g</strong> <small
											class="font-weight-bold">콜레스테롤</small>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.fattyacid }g</strong> <small
											class="font-weight-bold">포화지방산</small>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-xl-3">
								<div class="card mb-4">
									<div class="card-body pb-3">
										<strong class="text-big">${total.transfat }g</strong> <small
											class="font-weight-bold">트랜스지방</small>
									</div>
								</div>
							</div>
							<!-- / Charts -->

						</div>

					</div>

					<div class="row container">
						<div class="col-md-12">
							<h3>
								<strong>이런 제품은 어떠세요????</strong>
							</h3>
						</div>
						<c:forEach items="${list}" var="content">
							<div class="col-md-6 col-xl-3">
								<div class="card mb-6">
									<div class="w-100">
										<a href="/food/detail?code=${content.code }"
											class="card-img-top d-block ui-rect-60 ui-bg-cover"
											style="background-image: url('${content.imgurl1}');">
											<div
												class="d-flex justify-content-between align-items-end ui-rect-content p-3">
												<c:if test="${content.isAllergy }">
													<div class="flex-shrink-1">
														<span class="badge badge-danger">알러지 주의!</span>
													</div>
												</c:if>
												<c:if test="${!content.isAllergy }">
													<div class="flex-shrink-1">
														<span class="badge badge-success">SAFETY!</span>
													</div>
												</c:if>
												<div class="text-big">
													<div class="badge badge-dark font-weight-bold">${content.calory }kcal</div>
												</div>
											</div>
										</a>
									</div>
									<div class="card-body">
										<h5 class="mb-3">
											<a href="detail?code=${content.code }" class="text-body">${content.name }
											</a>
										</h5>
										<p class="text-muted mb-3">${content.makerName }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- / Content -->

					<!-- Layout footer -->
					<nav class="layout-footer footer bg-footer-theme">
						<div
							class="container-fluid d-flex flex-wrap justify-content-between text-center container-p-x pb-3">
							<div class="pt-3">
								<span class="footer-text font-weight-bolder">SafeFood</span>
							</div>
							<div>
								<a href="javascript:void(0)" class="footer-link pt-3">About
									Us</a> <a href="/qna/list" class="footer-link pt-3 ml-4">Help</a> <a
									href="javascript:void(0)" class="footer-link pt-3 ml-4">Contact</a>
								<a href="javascript:void(0)" class="footer-link pt-3 ml-4">Terms
									&amp; Conditions</a>
							</div>
						</div>
					</nav>
					<!-- / Layout footer -->

				</div>
				<!-- Layout content -->

			</div>
			<!-- / Layout container -->

		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-sidenav-toggle"></div>
	</div>

	<!-- / Layout wrapper -->

	<!-- Core scripts -->
	<script src="/resources/assets/vendor/libs/popper/popper.js"></script>
	<script src="/resources/assets/vendor/js/bootstrap.js"></script>
	<script src="/resources/assets/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script
		src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="/resources/assets/vendor/libs/chartjs/chartjs.js"></script>

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>
</body>

</html>
