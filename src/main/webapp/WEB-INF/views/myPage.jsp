<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="en" class="default-style">

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

					<li class="sidenav-item"><a href="javascript:void(0)"
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
					<div class="app-brand demo">
						<a href="/index"><img alt="" src="/resources/img/logo.png"
							width="50px"></a> <a href="/index"
							class="app-brand-text demo sidenav-text font-weight-normal ml-2">SafeFood</a>
						<a href="/index"
							class="layout-sidenav-toggle sidenav-link text-large ml-auto">
							<i class="ion ion-md-menu align-middle"></i>
						</a>
					</div>

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
							<div class="demo-navbar-notifications nav-item dropdown mr-lg-3">
								<a class="nav-link dropdown-toggle hide-arrow" href="#"
									data-toggle="dropdown"> <i
									class="ion ion-md-notifications-outline navbar-icon align-middle"></i>
									<span class="badge badge-primary badge-dot indicator"></span> <span
									class="d-lg-none align-middle">&nbsp; Notifications</span>
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<div
										class="bg-primary text-center text-white font-weight-bold p-3">
										4 New Notifications</div>
									<div class="list-group list-group-flush">
										<a href="javascript:void(0)"
											class="list-group-item list-group-item-action media d-flex align-items-center">
											<div
												class="ui-icon ui-icon-sm ion ion-md-home bg-secondary border-0 text-white"></div>
											<div class="media-body line-height-condenced ml-3">
												<div class="text-body">Login from 192.168.1.1</div>
												<div class="text-light small mt-1">Aliquam ex eros,
													imperdiet vulputate hendrerit et.</div>
												<div class="text-light small mt-1">12h ago</div>
											</div>
										</a> <a href="javascript:void(0)"
											class="list-group-item list-group-item-action media d-flex align-items-center">
											<div
												class="ui-icon ui-icon-sm ion ion-md-person-add bg-info border-0 text-white"></div>
											<div class="media-body line-height-condenced ml-3">
												<div class="text-body">
													You have <strong>4</strong> new followers
												</div>
												<div class="text-light small mt-1">Phasellus nunc
													nisl, posuere cursus pretium nec, dictum vehicula tellus.</div>
											</div>
										</a> <a href="javascript:void(0)"
											class="list-group-item list-group-item-action media d-flex align-items-center">
											<div
												class="ui-icon ui-icon-sm ion ion-md-power bg-danger border-0 text-white"></div>
											<div class="media-body line-height-condenced ml-3">
												<div class="text-body">Server restarted</div>
												<div class="text-light small mt-1">19h ago</div>
											</div>
										</a> <a href="javascript:void(0)"
											class="list-group-item list-group-item-action media d-flex align-items-center">
											<div
												class="ui-icon ui-icon-sm ion ion-md-warning bg-warning border-0 text-body"></div>
											<div class="media-body line-height-condenced ml-3">
												<div class="text-body">99% server load</div>
												<div class="text-light small mt-1">Etiam nec fringilla
													magna. Donec mi metus.</div>
												<div class="text-light small mt-1">20h ago</div>
											</div>
										</a>
									</div>

									<a href="javascript:void(0)"
										class="d-block text-center text-light small p-2 my-1">Show
										all notifications</a>
								</div>
							</div>

							<!-- Divider -->
							<div
								class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>

							<div class="demo-navbar-user nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#"
									data-toggle="dropdown"> <span
									class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
										<img src="/resources/assets/img/avatars/1.png" alt="profile"
										class="d-block ui-w-30 rounded-circle"> <span
										class="px-1 mr-lg-2 ml-2 ml-lg-0">${sessionScope.id }</span>
								</span>
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="/member/mypage" class="dropdown-item"><i
										class="ion ion-md-settings text-lightest"></i> &nbsp; Account
										settings</a>
									<div class="dropdown-divider"></div>
									<a href="/logout" class="dropdown-item"><i
										class="ion ion-ios-log-out text-danger"></i> &nbsp; Log Out</a>
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

						<h4 class="font-weight-bold py-3 mb-4">Account settings</h4>

						<div class="card overflow-hidden">
							<div class="row no-gutters row-bordered row-border-light">
								<div class="col-md-3 pt-0">
									<div class="list-group list-group-flush account-settings-links">
										<a class="list-group-item list-group-item-action active"
											data-toggle="list" href="#account-general">General</a> <a
											class="list-group-item list-group-item-action"
											data-toggle="list" href="#account-change-password">Change
											password</a> <a class="list-group-item list-group-item-action"
											data-toggle="list" href="#account-notifications">Notifications</a>
									</div>
								</div>
								<div class="col-md-9">

									<div class="tab-content">
										<div class="tab-pane fade show active" id="account-general">

											<div class="card-body media align-items-center">
												<img src="/resources/assets/img/avatars/5-small.png" alt=""
													class="d-block ui-w-80">
												<div class="media-body ml-4">
													<label class="btn btn-outline-primary"> Upload new
														photo <input type="file"
														class="account-settings-fileinput">
													</label> &nbsp;
													<button type="button" class="btn btn-default md-btn-flat">Reset</button>

													<div class="text-light small mt-1">Allowed JPG, GIF
														or PNG. Max size of 800K</div>
												</div>
											</div>
											<hr class="border-light m-0">

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
										<div class="tab-pane fade" id="account-notifications">
											<div class="card-body pb-2">

												<h6 class="mb-4">Activity</h6>

												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input" checked> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">Email me when someone
															comments on my article</span>
													</label>
												</div>
												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input" checked> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">Email me when someone
															answers on my forum thread</span>
													</label>
												</div>
												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input"> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">Email me when someone
															follows me</span>
													</label>
												</div>
											</div>
											<hr class="border-light m-0">
											<div class="card-body pb-2">

												<h6 class="mb-4">Application</h6>

												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input" checked> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">News and announcements</span>
													</label>
												</div>
												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input"> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">Weekly product updates</span>
													</label>
												</div>
												<div class="form-group">
													<label class="switcher"> <input type="checkbox"
														class="switcher-input" checked> <span
														class="switcher-indicator"> <span
															class="switcher-yes"></span> <span class="switcher-no"></span>
													</span> <span class="switcher-label">Weekly blog digest</span>
													</label>
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
					<nav class="layout-footer footer bg-footer-theme">
						<div
							class="container-fluid d-flex flex-wrap justify-content-between text-center container-p-x pb-3">
							<div class="pt-3">
								<span class="footer-text font-weight-bolder">SafeFood</span>
							</div>
							<div>
								<a href="javascript:void(0)" class="footer-link pt-3">About
									Us</a> <a href="javascript:void(0)" class="footer-link pt-3 ml-4">Help</a>
								<a href="javascript:void(0)" class="footer-link pt-3 ml-4">Contact</a>
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