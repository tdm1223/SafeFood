<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko" class="default-style">

<head>
<title>QnA</title>

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
<link rel="stylesheet" href="/resources/css/demo.css">

<!-- Load polyfills -->
<script src="/resources/assets/vendor/js/polyfills.js"></script>
<script>
	document['documentMode'] === 10
			&& document
					.write('<script src="https://polyfill.io/v3/polyfill.min.js?features=Intl.~locale.en"><\/script>')
</script>

<script src="/resources/assets/vendor/js/material-ripple.js"></script>
<script src="/resources/assets/vendor/js/layout-helpers.js"></script>

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

					<li class="sidenav-item"><a href="#"
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

					<li class="sidenav-item"><a href="#"
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

					<li class="sidenav-item open active"><a href="/qna/list"
						class="sidenav-link"><i class="sidenav-icon ion ion-md-help"></i>
							QnA </a></li>

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

						<h4
							class="d-flex justify-content-between align-items-center w-100 font-weight-bold py-3 mb-4">
							<div>QnA</div>
						</h4>

						<div class="card">
							<div class="card-datatable table-responsive">
								<div class="container">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th>분류</th>
												<th>제목</th>
												<th>작성자</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${qlist}" var="content">
												<tr>
													<td>${content.qno}</td>
													<td>${content.description }</td>
													<td><a href="detail?qno=${content.qno }">${content.title}</a></td>
													<td>${content.id}</td>
													<td>${content.lastdate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<hr />
									<a class="btn btn-default pull-right" href="add">글쓰기</a>

									<div class="text-center">
										<ul class="pagination">
											<c:if test="${pageMaker.prev }">
												<li><a href="list?page=${idx }">${idx }</a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx">
												<li><a href="list?page=${idx }">${idx }</a></li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage>0}">
												<li><a
													href="list?${pageMaker.makeQuery(pageMaker.endPage+1) }">&raquo;</a></li>
											</c:if>
										</ul>
									</div>
								</div>
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
</body>

</html>