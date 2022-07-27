<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- top1.css 적용 -->
<link rel="stylesheet" href="../css/top2.css" type="text/css">
<link rel="stylesheet" href="../css/register.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>


<!-- mypage 적용 -->
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/mypage.js"></script>

<!-- header 시작 -->

<link rel="icon" href="../img/salgoomk.ico" type="image/x-icon"
	sizes="16x16">
<title>살사람 구해요 '살구마켓'</title>
</head>
<body>
	<div id='wrap'>
		<div class="container">
			<header id="fixed-bar">
				<div id="fixed-bar-wrap">
					<section id="section1">
						<a id="fixed-bar-logo-title" href="../pd/pdlist.jsp">
							<span class="sr-only">살구마켓</span> <img class="fixed-logo"
							alt="당근마켓" src="../img/2.png" width="120" height="34" />
						</a>
					</section>

					<section id="fixed-bar-search">
						<div class="search-input-wrap"></div>
					</section>

<%
	Object mid= session.getAttribute("mId");
%>

					<section class="fixed-bar-menu">
<%
	if(mid == null){
%>
						<a href="../login/login.jsp">
							<button class="chat-button"
								style="width: 82px; margin-right: 7px">
								<span class="button-text">로그인</span>
							</button>
						</a> 
						<a href="../member/registerMem.jsp">
							<button class="chat-button"
								style="width: 92px; margin-right: 7px">
								<span class="button-text">회원가입</span>
							</button>
						</a>
<%} else { %>
						<a href="../login/logout.jsp">
							<button class="chat-button"
								style="width: 92px; margin-right: 7px">
								<span class="button-text">로그아웃</span>
							</button>
						</a> 						
<%
	}
%>
						 <a href="../mypage/saleList.jsp">
							<button class="chat-button" style="width: 98px;">
								<span class="button-beta">마이페이지</span>
							</button>
						</a>
					</section>
				</div>
			</header>