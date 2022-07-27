<%@ page import="javax.servlet.http.HttpSession"%>
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
<link rel="stylesheet" href="../css/top1.css" type="text/css">
<link rel="stylesheet" href="../css/pdlist.css" type="text/css">
<link rel="stylesheet" href="../css/write.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">

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
						<a id="fixed-bar-logo-title" href="../pd/pdlist.jsp"> <span class="sr-only">살구마켓</span>
							<img class="fixed-logo" alt="살구마켓" src="../img/2.png" width="120"
							height="34" />
						</a>
					</section>

					<section id="fixed-bar-search">
						<div class="search-input-wrap">
							<span class="sr-only">검색</span>

							<form action="pdlist.jsp" method="post" role="search">

								<input type="text" value="" name="keyword"
									id="keyword" class="fixed-search-input"
									placeholder="물품명, 판매자 등을 검색해보세요">

								<button id="header-search-button" type="submit" title="검색">
									<img class="fixed-search-icon" alt="Search"
										src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/search-icon-7008edd4f9aaa32188f55e65258f1c1905d7a9d1a3ca2a07ae809b5535380f14.svg"
										width="24" height="24" />
								</button>

							</form>
						</div>
					</section>

<%
	Object mId= session.getAttribute("mId");
%>

					<section class="fixed-bar-menu">
<%
	if(mId == null){
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

			<section class="home-main-section" id="section2">

				<!-- slide 시작 -->
				<div class="home-main-content">
					<div id="carouselExampleSlidesOnly" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="../img/carousel_image1.jpg" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="../img/carousel_image2.jpg" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="../img/carousel_image3.jpg" class="d-block w-100">
							</div>
						</div>
					</div>

					<!-- 상단 버튼 시작 -->
					<div id="fixed-nav-wrap">
						<section class="fixed-nav-menu">

							<button class="chat-button" type="button"
								data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
								aria-controls="offcanvasScrolling" style="margin-right: 7px;">
								<span class="button-text">상품카테고리</span>
							</button>

							<!-- category 시작 -->
							<div class="offcanvas offcanvas-start" data-bs-scroll="true"
								data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
								aria-labelledby="offcanvasScrollingLabel">
								<div class="offcanvas-header">
									<p class="offcanvas-title" id="offcanvasScrollingLabel">카테고리</p>
									<button type="button" class="btn-close text-reset"
										data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>

								<div class="offcanvas-body">

									<!-- 카테고리 시작 -->
									<div class="accordion accordion-flush"
										id="accordionFlushExample">
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingOne">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseOne" aria-expanded="false"
													aria-controls="flush-collapseOne">전자기기</button>
											</p>
											<div id="flush-collapseOne"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingOne"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=101">컴퓨터/노트북</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=102">TV</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=103">오디오/이어폰</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingTwo">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseTwo" aria-expanded="false"
													aria-controls="flush-collapseTwo">생활용품</button>
											</p>
											<div id="flush-collapseTwo"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingTwo"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=201">욕실용품</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=202">주방용품</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingThree">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseThree" aria-expanded="false"
													aria-controls="flush-collapseThree">운동기구</button>
											</p>
											<div id="flush-collapseThree"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingThree"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=301">런닝머신</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=302">자전거</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=303">아령</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingFour">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseFour" aria-expanded="false"
													aria-controls="flush-collapseFour">뷰티/미용</button>
											</p>
											<div id="flush-collapseFour"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingFour"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=401">화장품</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=402">헤어제품</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingFive">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseFive" aria-expanded="false"
													aria-controls="flush-collapseFive">의류</button>
											</p>
											<div id="flush-collapseFive"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingFive"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=501">아우터</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=502">신발</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=503">하의</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingSix">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseSix" aria-expanded="false"
													aria-controls="flush-collapseSix">도서</button>
											</p>
											<div id="flush-collapseSix"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingSix"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=601">소설</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=602">수필</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=603">만화책</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<p class="accordion-header" id="flush-headingSeven">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#flush-collapseSeven" aria-expanded="false"
													aria-controls="flush-collapseSeven">가방</button>
											</p>
											<div id="flush-collapseSeven"
												class="accordion-collapse collapse"
												aria-labelledby="flush-headingSeven"
												data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<ul class="list-group list-group-flush">
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=701">핸드백</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=702">미니백</a></li>
														<li class="list-group-item"><a
															href="pdlist.jsp?cCode=703">에코백</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<a href="pdRegister.jsp">
								<button class="chat-button"
									style="width: 85px; margin-right: 7px">
									<span class="button-beta">살구하기</span>
								</button>
							</a> <a href="../notice/list2.jsp">
								<button class="chat-button"
									style="width: 85px; margin-right: 7px">
									<span class="button-text">공지사항</span>
								</button>
							</a> <a href="../board/list.jsp">
								<button class="chat-button" style="width: 81px;">
									<span class="button-text">1:1문의</span>
								</button>
							</a>
						</section>
					</div>