<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,com.edu.ssafy.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>상품 세부 정보</title>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	drawChart();
});

var id = '${sessionScope.id}';
function eatFood(code) {
	var quan = $("#quan").val();	
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
function drawChart() {
	new Chart($("#chart"), {
		type : "doughnut",
		data : {
			labels : ["탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤",
					"포화 지방산", "트랜스지방" ],
			datasets : [ {
				label : '# of Votes',
				data : [${food.carbo},
					${food.protein},
					${food.fat},
					${food.sugar},
					${food.natrium},
					${food.chole},
					${food.fattyacid},
					${food.transfat}],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(65, 200, 64, 0.2)',
						'rgba(200, 120, 64, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)', 'rgba(65, 200, 64, 1)',
						'rgba(200, 120, 64, 1)' ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
}


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
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/blueimp-gallery/gallery.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/blueimp-gallery/gallery-indicator.css">

<!-- Page -->
<link rel="stylesheet"
	href="/resources/assets/vendor/css/pages/products.css">
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
					<a href="/index"><img alt="" src="/resources/img/logo.png"
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

					<li class="sidenav-item"><a href="/index" class="sidenav-link"><i
							class="sidenav-icon ion ion-ios-home "></i> Dashboard </a></li>

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

					<li class="sidenav-item active"><a href="javascript:void(0)"
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
							내 섭취 정보 </a></li>

					<li class="sidenav-item"><a href="/member/zzim"
						class="sidenav-link"><i class="sidenav-icon ion ion-md-heart"></i>
							찜 목록 </a></li>

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
						<div class="media align-items-center py-3 mb-4">
							<img src="${food.imgurl1 }" alt=""
								class="d-block ui-w-80 ui-bordered">
							<div class="media-body ml-4">
								<h4 class="font-weight-bold mb-2">${food.name}</h4>
							</div>
						</div>

						<div class="nav-tabs-top nav-responsive-sm">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#item-overview">상세정보</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#item-description">영양정보</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#item-images">사진</a></li>
							</ul>

							<div class="tab-content">
								<!-- Overview -->
								<div class="tab-pane fade show active" id="item-overview">
									<div class="card-body p-5">
										<div class="col-md-6 col-md-offset-4">
											<img id="foodImg" src="${food.imgurl1 }" width="200px"
												height="200px">
										</div>
										<div class="col-md-8" id="info">
											<hr>
											<div class="row">
												<div class="col-md-3">제품명</div>
												<div class="col-md-9" id="name">${food.name }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">용량</div>
												<div class="col-md-9" id="name">${food.capacity }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">제조사</div>
												<div class="col-md-9" id="maker">${food.makerName }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">판매자</div>
												<div class="col-md-9" id="material">${food.sellerName }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">원재료</div>
												<div class="col-md-9" id="material">${food.material }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">등록연도</div>
												<div class="col-md-9" id="material">${food.bgn_year }</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">알레르기 성분</div>
												<div class="col-md-9" id="aller">${allergy}</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-md-3">내가 가진 알레르기 성분</div>
												<div class="col-md-9 text-danger" id="myAller">${myAllergy}</div>
											</div>
											<hr>
											<div class="col-md-2" style="padding: 0">
												<form action="#" method="get" id="form">
													<input type="hidden" name="code" value="${food.code}">
													<div class="form-group">
														<label for="quan">Quantity</label> <input type="number"
															class="form-control" name="quan" id="quan" value="1"
															min="1">
													</div>
												</form>
												<div class="btn-group">
													<button type="button" class="btn btn-info"
														onclick="eatFood(${food.code })">
														<span class="ion ion-md-add"></span> 추가
													</button>
													<button type="button" class="btn btn-info"
														onclick="zzimFood(${food.code })">
														<span class="ion ion-md-heart" style="margin-right: 5px"></span>찜
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /Overview -->

								<!-- Description -->
								<div class="tab-pane fade" id="item-description">
									<div class="card-body p-5">
										<h3>${food.name }</h3>
										<div class="row">
											<div class="col-md-6">
												<canvas id="chart" height="220px"></canvas>
											</div>
											<div class="col-md-6">
												<hr>
												<div class="row">
													<div class="col-md-3">용량</div>
													<div class="col-md-9" id="oneday">${food.capacity }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">칼로리</div>
													<div class="col-md-9" id="kcal">${food.calory }kcal</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">탄수화물</div>
													<div class="col-md-9" id="tan">${food.carbo }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">단백질</div>
													<div class="col-md-9" id="dan">${food.protein }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">지방</div>
													<div class="col-md-9" id="fat">${food.fat }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">당류</div>
													<div class="col-md-9" id="dang">${food.sugar }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">나트륨</div>
													<div class="col-md-9" id="na">${food.natrium }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">콜레스테롤</div>
													<div class="col-md-9" id="col">${food.chole }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">포화 지방산</div>
													<div class="col-md-9" id="po">${food.fattyacid }</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-3">트랜스지방</div>
													<div class="col-md-9" id="trans">${food.transfat }</div>
												</div>
												<hr>
											</div>
										</div>
									</div>
								</div>
								<!-- / Description -->

								<!-- Images -->
								<div class="tab-pane fade" id="item-images">
									<div class="card-body">

										<div class="mb-4">
											<span class="badge badge-dot badge-primary"></span>
											${food.name} 이미지
										</div>

										<!-- Lightbox template -->
										<div id="product-item-lightbox"
											class="blueimp-gallery blueimp-gallery-controls">
											<div class="slides"></div>
											<h3 class="title"></h3>
											<a class="prev">‹</a> <a class="next">›</a> <a class="close">×</a>
											<ol class="indicator"></ol>
										</div>

										<div id="product-item-images" class="row">

											<div class="col-12 col-sm-6 col-md-4 col-xl-3 mb-4">
												<a href="${food.imgurl1 }"
													class="d-block border-primary ui-bordered"> <img
													src="${food.imgurl1 }" class="img-fluid" alt="">
												</a>
											</div>

											<div class="col-12 col-sm-6 col-md-4 col-xl-3 mb-4">
												<a href="${food.imgurl2 }" class="d-block ui-bordered">
													<img src="${food.imgurl2 }" class="img-fluid" alt="">
												</a>
											</div>

											<div class="col-12 col-sm-6 col-md-4 col-xl-3 mb-4">
												<a href="${food.imgurl1 }" class="d-block ui-bordered">
													<img src="${food.imgurl1 }" class="img-fluid" alt="">
												</a>
											</div>

											<div class="col-12 col-sm-6 col-md-4 col-xl-3 mb-4">
												<a href="${food.imgurl2 }" class="d-block ui-bordered">
													<img src="${food.imgurl2 }" class="img-fluid" alt="">
												</a>
											</div>

										</div>
									</div>
								</div>
								<!-- / Images -->
							</div>
						</div>
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
	<script src="/resources/assets/vendor/libs/blueimp-gallery/gallery.js"></script>
	<script
		src="/resources/assets/vendor/libs/blueimp-gallery/gallery-fullscreen.js"></script>
	<script
		src="/resources/assets/vendor/libs/blueimp-gallery/gallery-indicator.js"></script>

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>
	<script src="/resources/assets/js/pages_e-commerce_product-item.js"></script>
</body>

</html>