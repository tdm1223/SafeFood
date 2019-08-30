<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav
		class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x"
		id="layout-navbar">

		<div class="navbar-collapse collapse" id="layout-navbar-collapse">
			<!-- Divider -->
			<hr class="d-lg-none w-100 my-2">

			<div class="navbar-nav align-items-lg-center ml-auto">
				<!-- Divider -->
				<div class="demo-navbar-user nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
						<span
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
</body>
</html>