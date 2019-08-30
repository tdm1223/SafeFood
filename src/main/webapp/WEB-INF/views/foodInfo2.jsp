<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko" class="default-style">

<head>
<title>상품 목록(이미지)</title>
<script type="text/javascript">
	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchWord = document.getElementById("searchWord").value;
		location.href = "/food/imgInfo?searchCondition=" + searchCondition
				+ "&searchWord=" + searchWord + "&sortType=0";
	}
	function sort() {
		var url = window.location.href;
		var param = new Array();
		var params;
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

		location.href = "/food/imgInfo?searchCondition=" + searchCondition
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


<script src="/resources/assets/vendor/js/material-ripple.js"></script>
<script src="/resources/assets/vendor/js/layout-helpers.js"></script>

<!-- Load polyfills -->
<script src="/resources/assets/vendor/js/polyfills.js"></script>
<script>
	document['documentMode'] === 10
			&& document
					.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')
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
					<a href="/index"
						class="app-brand-text demo sidenav-text font-weight-normal ml-2">SafeFood</a>
				</div>

				<div class="sidenav-divider mt-0"></div>

				<!-- Links -->
				<ul class="sidenav-inner py-1">

					<li class="sidenav-item"><a href="/index" class="sidenav-link"><i
							class="sidenav-icon ion ion-ios-home "></i> Dashboard</a></li>

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
							<li class="sidenav-item"><a href="/food/list"
								class="sidenav-link"> <i
									class="sidenav-icon ion ion-ios-list "></i>리스트

							</a></li>
							<li class="sidenav-item open active"><a href="/food/imgList"
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
							QnA</a></li>

					<!-- Layouts -->

					<li class="sidenav-divider mb-1"></li>
				</ul>
			</div>
			<!-- / Layout sidenav -->

			<!-- Layout container -->
			<div class="layout-container">
				<!-- Layout header -->
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Layout header -->

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

						<div class="row">
							<c:forEach items="${list}" var="content">
								<div class="col-sm-6 col-xl-4">
									<div class="card mb-4">
										<div class="w-100">
											<a href="detail?code=${content.code }"
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
											<div class="media">
												<div class="media-body">
													<button type="button" class="btn btn-info"
														onclick="eatFood(${content.code })">
														<span class="ion ion-md-add"></span> 추가
													</button>
													<button type="button" class="btn btn-info"
														onclick="zzimFood(${content.code})">
														<span class="ion ion-md-heart"></span> 찜
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<hr class="border-light mt-2 mb-4">
						<div class="text-center">
							<ul class="pagination">
								<c:choose>
									<c:when test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link"
											href="imgList?page=${pageMaker.startPage-1}
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
												href="imgList?page=${status.current}
												&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">${status.current}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="imgList?page=${status.current}
												&searchCondition=${searchCondition}&searchWord=${searchWord}&sortType=${sortType}">${status.current}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageMaker.next}">
										<li class="page-item"><a class="page-link"
											href="imgList?page=${pageMaker.endPage+1}
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

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>

</body>

</html>
