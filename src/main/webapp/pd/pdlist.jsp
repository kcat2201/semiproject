<%@page import="com.salguMarket.reply.model.ReplyDAO"%>
<%@page import="com.salguMarket.category.model.CategoryService"%>
<%@page import="com.salguMarket.category.model.CategoryDAO"%>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.pd.model.PdVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.salguMarket.common.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../main/top1.jsp"%>
<link rel="stylesheet" href="../css/pdlist.css">
<%
/* 
[1] 카테고리 종류 클릭하면 get방식으로 이동
[2] 살구마켓 로고 누르면 get방식으로 이동
[3] 검색 - pdlist.jsp에서 post방식으로 submit
[4] 페이징처리 - pdlist.jsp에서 페이지 번호 누르면 get방식으로 이동 
*/

request.setCharacterEncoding("utf-8");

String cCode = request.getParameter("cCode");
String keyword = request.getParameter("keyword");
DecimalFormat df = new DecimalFormat("#,###");

CategoryDAO dao = new CategoryDAO();
CategoryService cs = new CategoryService();
PdVO vo = new PdVO();
ReplyDAO rdao = new ReplyDAO();

List<PdVO> list = null;

/* 검색으로 조회 */
try {
	list = cs.selectAll(keyword);
} catch (SQLException e) {
	e.printStackTrace();
}

if (keyword == null) keyword = "";

/* 카테고리로 조회*/
try {
	if(cCode!=null && !cCode.isEmpty()){
	list = cs.selectByCategory(cCode);
	}
} catch (SQLException e) {
	e.printStackTrace();
}


//페이징 처리
int currentPage = 1; //현재 페이지

if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt((request.getParameter("currentPage")));
}

int totalRecord = list.size(); //총 레코드 수
int pageSize = 16; //한 페이지에 보여줄 레코드(행) 수
int blockSize = 5; //한 블럭에 보여줄 페이지 수

PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>

<div class="container" id="sangpoom">
	<section id="section3">
		<!--판매글 리스트 반복문 시작  -->
		<%
		if (list.isEmpty()) {
		%>
		<div class="noResultPage">
			<img src="../img/noresultsalgu.png">
			<p>해당 상품이 존재하지 않습니다</p>
		</div>
		<%
		} else {
		%>

		<!--게시판 내용 반복문 시작  -->
		<%
		int num = pageVo.getNum();
		int curPos = pageVo.getCurPos();

		for (int i = 0; i < pageVo.getPageSize(); i++) {
			if (num-- < 1)
				break;

			vo = list.get(curPos++);
			String originFileName = vo.getOriginalFilename();
			String path = "../pds_upload/" + originFileName;
		%>

		<div class="card">
			<a href="countUpdate.jsp?pNo=<%=vo.getpNo()%>"><img
				src="<%=path%>" class="card-img-top" alt="중고상품"></a>
			<div class="card-body">
				<p class="card-title">
					<a href="countUpdate.jsp?pNo=<%=vo.getpNo()%>"> <%=Utility.cutString(vo.getpTitle(), 13)%></a>
				</p>
				<p class="card-text"><%=Utility.cutString(vo.getDetail(), 12)%></p>
				<p class="card-price"><%=df.format(vo.getPrice())%>원
				</p>
				<small class="text-muted"><img src="../img/readcount.png">&nbsp;&nbsp;<%=vo.getReadcount() %>&nbsp;&nbsp;∙&nbsp;&nbsp;
				<img src="../img/chatcount.png">&nbsp;&nbsp;<%=rdao.countReply(vo.getpNo())%>&nbsp;&nbsp;
				<%=Utility.diffOfDate(vo.getRegdate())%></small>
			</div>
		</div>
		<%
		} //for
		%>
		<%
		} //if
		%>
	</section>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-lg">
			<!-- 이전블럭으로 이동 -->
			<%
			if (pageVo.getFirstPage() > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href='pdlist.jsp?currentPage=<%=pageVo.getFirstPage() - 1%>&keyword=<%=keyword %>'>
					이전</a></li>
			<%
			} //if
			%>
			<!-- 페이지 번호 추가 -->
			<%
			for (int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++) {
				if (i > pageVo.getTotalPage())
					break;

				if (i == currentPage) {
			%>
			<li class="page-item"
				style="color: blue; font-weight: bold; font-size: 1em"><a
				class="page-link"
				href='pdlist.jsp?currentPage=<%=i%>&keyword=<%=keyword%>'> <%=i%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href='pdlist.jsp?currentPage=<%=i%>&keyword=<%=keyword%>'> <%=i%></a></li>
			<%
			}
			%>
			<%
			} //for
			%>
			<!-- 페이지 번호 끝 -->
			<!-- 다음 블럭으로 이동 -->
			<%
			if (pageVo.getLastPage() < pageVo.getTotalPage()) {
			%>
			<li class="page-item"><a class="page-link"
				href='pdlist.jsp?currentPage=<%=pageVo.getLastPage() + 1%>&keyword=<%=keyword%>'>
					다음</a></li>
			<%
			}
			%>
		</ul>
	</nav>
	<div id="search-wrap">
		<form action="pdlist.jsp" method="post" class="d-flex" role="search">
			<input class="form-control me-2" type="text" value="<%=keyword%>"
				name="keyword" id="keyword" placeholder="내가 찾는 중고상품을"
				aria-label="Search"> <input class="btn btn-outline-success"
				type="submit" value="검색">
		</form>
	</div>
</div>

<%@ include file="../main/bottom.jsp"%>