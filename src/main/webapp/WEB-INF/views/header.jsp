<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session = request.getSession();
	String id;
	if (session.getAttribute("id") == null) {
		id = "";
	} else {
		id = (String) session.getAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
#menu {
	text-align: center;
	font-size: 25px;
	padding-top: 22px;
}

#menu a {
	text-decoration: none;
	color: black;
}

#user {
	color: white;
	margin: 0;
	margin-right: 10px;
	font-size: 25px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="header-container">
		<div class="navbar navbar-inverse" style="margin: 0">
			<div class="container">
				<!-- 로그인 navbar -->
				<div class="header-top-dropdown text-right">
					<%
						if (id.isEmpty()) {
					%>
					<div class="btn-group">
						<a href="/member/signUp" class="btn navbar-btn btn-default btn-sm"
							style="background-color: black; color: white;"> <i
							class="glyphicon glyphicon-user"></i> Sign Up
						</a>
					</div>
					<div class="btn-group">
						<a href="/member/login" class="btn navbar-btn btn-default btn-sm"
							style="background-color: black; color: white;"> <i
							class="glyphicon glyphicon-lock"></i> Login
						</a>
					</div>
					<%
						} else {
					%>
					<div class="btn-group">
						<p id="user"><%=id%>님
						</p>
					</div>
					<div class="btn-group">
						<a href="/member/mypage"
							class="btn navbar-btn btn-default btn-sm"
							style="background-color: black; color: white;"> <i
							class="glyphicon glyphicon-user"></i> 마이페이지
						</a>
					</div>
					<div class="btn-group">
						<a href="/logout"
							class="btn navbar-btn btn-default btn-sm"
							style="background-color: black; color: white;"> <i
							class="glyphicon glyphicon-lock"></i> LogOut
						</a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="header" id="myHeader">
		<div class="row">
			<!-- 메뉴 -->
			<div class="col-md-offset-2 col-md-1">
				<a href="/"><img src="/resources/img/logo.JPG" alt="mainlogo"></a>
			</div>
			<div class="col-md-9" id="menu">
				<div class="col-sm-2">
					<a href="#">공지 사항</a>
				</div>
				<div class="col-sm-2">
					<a href="/food/list">상품 정보</a>
				</div>
				<%
					if (!id.isEmpty()) {
				%>
				<div class="col-sm-2">
					<a href="#">베스트 섭취 정보</a>
				</div>
				<div class="col-sm-2">
					<a href="/member/myEat">내 섭취 정보</a>
				</div>
				<div class="col-sm-1">
					<a href="/member/zzim">찜목록</a>
				</div>
				<%
					}
				%>
				<div class="col-sm-2">
					<a href="/qna/list">QnA</a>
				</div>
				<div class="col-sm-1">
					<span class="glyphicon glyphicon-search"></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
