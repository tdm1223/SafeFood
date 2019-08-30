<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>상품 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchWord = document.getElementById("searchWord").value;
		location.href = "/food/info?searchCondition=" + searchCondition
				+ "&searchWord=" + searchWord + "&sortType=0";
	}
	function sort() {
		var url = window.location.href;
		var param = new Array();
		// url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
		params = url.substring(url.indexOf('?') + 1, url.length);
		// 파라미터 구분자("&") 로 분리
		params = params.split("&");

		// params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
		var size = params.length;
		var key, value;
		for (var i = 0; i < size; i++) {
			key = params[i].split("=")[0];
			value = params[i].split("=")[1];

			param[key] = value;
		}
		var searchCondition = param["searchCondition"];
		var searchWord = param["searchWord"];
		var sortType = document.getElementsByName("sortType")[0].value;
		if (searchCondition == null) {
			searchCondition = "";
		}
		if (searchWord == null) {
			searchWord = "";
		}

		location.href = "/food/info?searchCondition=" + searchCondition
				+ "&searchWord=" + searchWord + "&sortType=" + sortType;
	}

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
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/datatables/datatables.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/nouislider/nouislider.css">

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
					<a href="/index"
						class="app-brand-text demo sidenav-text font-weight-normal ml-2">SafeFood</a>
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

					<li class="sidenav-item open"><a href="javascript:void(0)"
						class="sidenav-link sidenav-toggle"><i
							class="sidenav-icon ion ion-ios-pricetag"></i> 상품정보 </a>
						<ul class="sidenav-menu">
							<li class="sidenav-item open active"><a href="/food/list"
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

					<div class="navbar-collapse collapse" id="layout-navbar-collapse">
						<!-- Divider -->
						<hr class="d-lg-none w-100 my-2">

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

						<h4 class="font-weight-bold py-3 mb-4">상품 정보</h4>
						<!--  검색창 -->
						<div style="background-color: #000000; margin: auto"
							align="center">
							<div class="container-fluid">
								<form class="form-inline" id="frm">
									<div class="form-group">
										<label style="color: white;">검색 조건</label> <select
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
										<label style="color: white;">검색 단어</label> <input type="text"
											class="form-control" id="searchWord"
											style="background-color: #8C8C8C; margin-left: 10px">
										<button type="button" class="btn btn-info" id="searchBtn"
											style="margin-left: 10px" onclick="search()">검색</button>
									</div>
									<div class="form-group ml-1" style="margin-left: 20px">
										<select name="sortType" id="bs-multiselect-1"
											onchange="sort()">
											<option value="">선택</option>
											<option value="1">이름</option>
											<option value="2">열량</option>
										</select>
									</div>
								</form>
							</div>
						</div>
						<!-- /검색창 -->

						<div class="card">
							<div class="card-datatable table-responsive">
								<table id="product-list" class="table table-bordered"
									style="text-align: center">
									<thead>
										<tr>
											<th>사진</th>
											<th>상품명</th>
											<th>열량</th>
											<th>용량</th>
											<th>제조사</th>
											<th>알러지 정보</th>
											<th>등록연도</th>
											<th>추가</th>
											<th>찜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="content">
											<tr>
												<td><img class="img-responsive"
													src="${content.imgurl1 }" alt="" width="50px"></td>
												<td><a href="detail?code=${content.code }">${content.name}</a></td>
												<td>${content.calory }kcal</td>
												<td>${content.capacity }</td>
												<td>${content.makerName }</td>
												<c:if test="${content.isAllergy }">
													<td><i class="badge badge-danger">알러지 주의!</i></td>
												</c:if>
												<c:if test="${!content.isAllergy }">
													<td><i class="badge badge-success">SAFETY!</i></td>
												</c:if>
												<td>${content.bgn_year }</td>
												<td>
													<button type="button" class="btn btn-info"
														onclick="eatFood(${content.code })">
														<span class="ion ion-md-add"></span> 추가
													</button>
												</td>
												<td><button type="button" class="btn btn-info"
														onclick="zzimFood(${content.code })">
														<span class="ion ion-md-heart"></span> 찜
													</button></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>

								<ul class="pagination">
									<c:choose>
										<c:when test="${pageMaker.prev }">
											<li class="page-item"><a class="page-link"
												href="list?page=${pageMaker.startPage-1}
											&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">Prev</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#">Prev</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" varStatus="status">
										<c:choose>
											<c:when test="${status.current eq pageMaker.cri.page}">
												<li class="page-item active"><a class="page-link"
													href="list?page=${status.current}
												&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">${status.current}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="list?page=${status.current}
												&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">${status.current}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pageMaker.next}">
											<li class="page-item"><a class="page-link"
												href="list?page=${pageMaker.endPage+1}
											&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#">Next</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
					<!-- / Content -->

					<!-- Layout footer -->
					<jsp:include page="footer.jsp"></jsp:include>
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
	<script src="/resources/assets/vendor/libs/datatables/datatables.js"></script>
	<script src="/resources/assets/vendor/libs/numeral/numeral.js"></script>
	<script src="/resources/assets/vendor/libs/nouislider/nouislider.js"></script>

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>
	<!-- <script src="/resources/assets/js/pages_e-commerce_product-list.js"></script> -->
</body>

</html>
