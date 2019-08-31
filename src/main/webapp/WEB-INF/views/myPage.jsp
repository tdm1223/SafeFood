<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="ko" class="default-style">

<head>
<title>마이페이지 - SafeFood</title>

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
	href="/resources/assets/vendor/libs/select2/select2.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/bootstrap-tagsinput/bootstrap-tagsinput.css">

<!-- Page -->
<link rel="stylesheet"
	href="/resources/assets/vendor/css/pages/account.css">
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
				<!-- Layout header -->
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Layout header -->

				<!-- Layout content -->
				<div class="layout-content">

					<!-- Content -->
					<div class="container-fluid flex-grow-1 container-p-y">

						<h4 class="font-weight-bold py-3 mb-4">Account settings</h4>

						<div class="card overflow-hidden">
							<div class="row no-gutters row-bordered row-border-light">
								<div class="col-md-3 pt-0">
									<div class="list-group list-group-flush account-settings-links">
										<a class="list-group-item list-group-item-action active"
											data-toggle="list" href="#account-general">General</a> <a
											class="list-group-item list-group-item-action"
											data-toggle="list" href="#account-change-password">Change
											password</a> 
									</div>
								</div>
								<div class="col-md-9">

									<div class="tab-content">
										<div class="tab-pane fade show active" id="account-general">
											<div class="card-body">
												<div class="form-group">
													<label class="form-label">ID</label> <input type="text"
														id="id" class="form-control mb-1"
														value="${sessionScope.id }" readonly>
												</div>
												<div class="form-group">
													<label class="form-label">Name</label> <input type="text"
														id="name" class="form-control" value="${member.name }">
												</div>
												<div class="form-group">
													<label class="form-label">Address</label> <input
														type="text" id="addr" class="form-control mb-1"
														value="${member.addr}">
												</div>
												<div class="form-group">
													<label class="form-label">Phone</label> <input type="text"
														id="phone" class="form-control" value="${member.phone }">
												</div>

												<div class="form-group">
													<label class="form-label">Allergy Info</label><br>
													<hr class="border-light m-2">

													<c:forEach items="${allergins }" var="aller"
														varStatus="status">
														<div class="col-sm-2 btn-group">
															<label class="custom-control custom-checkbox m-0">
																<c:choose>
																	<c:when test="${fn:contains(haveAller, aller.name)}">
																		<input type="checkbox" name="allergy"
																			value="${aller.code }" class="custom-control-input"
																			checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" name="allergy"
																			value="${aller.code }" class="custom-control-input">
																	</c:otherwise>
																</c:choose> <span class="custom-control-label">${aller.name }</span>
															</label>
														</div>
													</c:forEach>
												</div>
												<div class="text-left mt-2">
													<button id="saveBtn" type="button" class="btn btn-primary">Save
														changes</button>
													&nbsp;
												</div>
											</div>

										</div>
										<div class="tab-pane fade" id="account-change-password">
											<div class="card-body pb-2">

												<div class="form-group">
													<label class="form-label">Current password</label> <input
														type="password" class="form-control">
												</div>

												<div class="form-group">
													<label class="form-label">New password</label> <input
														type="password" class="form-control">
												</div>

												<div class="form-group">
													<label class="form-label">Repeat new password</label> <input
														type="password" class="form-control">
												</div>
											</div>
										</div>
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


	<script type="text/javascript">
		var id = '${sessionScope.id}';
		var name;
		var addr;
		var phone;
		var allergy = new Array();

		$(function() {
			$("#saveBtn").on('click', function(source) {
				name = $("#name").val();
				addr = $("#addr").val();
				phone = $("#phone").val();

				$('input:checkbox[name="allergy"]').each(function() {
					if (this.checked == true) {
						allergy.push(this.value);
					}
				});

				$.ajax({
					type : 'post',
					url : '/member/update',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify({
						id : id,
						name : name,
						addr : addr,
						phone : phone,
						allergy : allergy
					}),
					success : function(result) {
						alert("회원정보 수정 성공");
						//	alert(result.msg);
					},
					error : function(result) {
						alert("에러 발생");
						//	alert(result.msg);
					}
				});

			});
		});
	</script>

	<!-- Core scripts -->
	<script src="/resources/assets/vendor/libs/popper/popper.js"></script>
	<script src="/resources/assets/vendor/js/bootstrap.js"></script>
	<script src="/resources/assets/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script
		src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="/resources/assets/vendor/libs/select2/select2.js"></script>
	<script
		src="/resources/assets/vendor/libs/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

	<!-- Demo -->
	<script src="/resources/assets/js/demo.js"></script>
	<script src="/resources/assets/js/pages_account-settings.js"></script>

</body>
</html>