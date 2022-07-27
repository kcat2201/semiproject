<%@page import="java.text.DecimalFormat"%>
<%@page import="com.salguMarket.deal.model.DealService"%>
<%@page import="com.salguMarket.pd.model.PdVO"%>
<%@page import="com.salguMarket.pd.model.PdService"%>
<%@page import="com.salguMarket.category.model.CategoryService"%>
<%@page import="com.salguMarket.common.PagingVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.salguMarket.sales.model.SalesVO"%>
<%@page import="java.util.List"%>
<%@page import="com.salguMarket.sales.model.SalesService"%>
<%@ include file="../main/top2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("구매내역화면 로딩");
	// 세션에서 값 받아옴.
	String mId = (String)session.getAttribute("mId");
	String mNo = (String)session.getAttribute("mNo");
//	String mName = (String)session.getAttribute("mName");
//	String mNic = (String)session.getAttribute("mNic");
	//String mNo = "3";
	//String mId = "hong";
	
	if(mNo == null || mNo.isEmpty()){
		mNo = "0";
	}
	
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("searchKeyword");
	
	SalesService salesService = new SalesService();
	DealService dealService = new DealService();
	PdService pdService = new PdService();
	CategoryService cateService = new CategoryService();
	
//	List<SalesVO> salesList = null;
	List<PdVO> pdList = null;
	
	try {
//		salesList = salesService.selectSalesByDNo(Integer.parseInt(userId));
		pdList = pdService.selectByBuyerNo(Integer.parseInt(mNo), keyword);

	} catch (SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
	
	if(keyword == null) {
 		keyword = "";
 	}
 	
 	// 페이징 처리
 	int currentPage = 1;	// 현재 페이지
 	
 	// saleList.jsp?currentPage=2
 	if(request.getParameter("currentPage") != null) {
 		currentPage = Integer.parseInt(request.getParameter("currentPage"));
 	}
 	
 	int totalRecord = 0;
 	if(pdList != null){
 		totalRecord = pdList.size();
 	}
 	
 	int pageSize = 5;
 	int blockSize = 5;
 	
 	PagingVO pVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
 	int totalPage = pVo.getTotalPage();
 	int firstPage = pVo.getFirstPage();
 	int lastPage = pVo.getLastPage();
 	int num = pVo.getNum();
	int curPos = pVo.getCurPos();
	
	if(mId == null || mId.isEmpty()) {
	      mNo = "0";
	   }
%>
<script type="text/javascript">
   $(function(){
      var mid=<%=session.getAttribute("mId")%>;
      if(mid==null||mid.isEmpty()){
         alert('로그인을 하셔야 합니다');
         location.href="../login/login.jsp";
         event.preventDefault();
      }
   });
</script>

<div id="mypage">
<section>
<div class="wrap">

	<nav><%@ include file="submenu.jsp" %></nav>
<article>
	<div id="divContent">
		<div class="tit_01" style="float:left;">
			<img src="../img/titleIcon1.png" alt="제목 아이콘"/>&nbsp;구매목록
		</div>
		
		
		<div style="clear:both;"></div>
		
		<div>
			<form name="frmSearch" method="post" action='buyList.jsp'>
				<input type="submit" style="width:80px;float:right;margin-left:5px;" value="검색"/>
				<input type="text" name="searchKeyword" 
					style="width:150px;height:26px;float:right;margin-left:5px;" placeholder="상품, 이름 입력"/>
	
				<div id="BSresult" style="height:20px;">
					<% if(keyword!=null && !keyword.isEmpty()){ %>
						<p>검색어 : <%=keyword%>, <%=pdList.size()%>건 검색되었습니다.</p>					
					<%} else if(pdList == null) {%>
						
					<%} else {%>
						<p>구매내역 : 총 <%=pdList.size()%>건 검색되었습니다.</p>
					<%}%>
				</div>
			</form>
		</div>
		
		<div style="clear:both;"></div>
		
		<div style="margin-top:10px;">
			<table id="tblBuyList" class="tb">
				<caption></caption>
				<colgroup>
				<!-- 1set 24% 16%, 2set 15% 25% -->
					<col width="15%" />
					<col width="25%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>상품</th>
						<th>상품명</th>
						<th>가격</th>
						<th>카테고리</th>
						<th>판매 등록일</th>
						<th>구매자</th>
						<th>비고</th>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<%if(pdList.isEmpty()) {%>
						<tr>
							<td colspan="7" class="tcx" style="height:450px">구매내역이 없습니다.</td>
						</tr>
					<%} else {%>
					<!-- 반복문 -->
						
						<%for(int i=0;i<pageSize;i++){ 
						 	if(num-- <1) break;
						  	
					  		PdVO pdVo = pdList.get(curPos++);
					  		
							String originFileName = pdVo.getOriginalFilename();
							String path = "../pds_upload/" + originFileName;
					 	%>
					 	
							<tr>
								<td class="tc">
									<img src="<%=path %>" style="width:150px;height:150px;"/>
								</td>
								<td class="tc">
									<a href="<%=request.getContextPath()%>/pd/pdDetail.jsp?pNo=<%=pdVo.getpNo() %>" class="tc"><%=pdVo.getpTitle()%></a>
								</td>
								<td class="tc"><%=df.format(pdVo.getPrice())%></td>
								<td class="tc"><%=cateService.selectCateBycCode(pdVo.getcCode())%></td>
								<td class="tc"><%=sdf.format(pdVo.getRegdate())%></td>
								<td class="tc"><%=mId%></td>
								<td class="tc">구매완료</td>
								
							</tr>
						<%}%>
					<%}%>
						
				</tbody>
			</table>
		</div>
		<div class="page_wrap">
		<div class="page_nation">
		<!-- 페이지 -->	
		
		<!-- 블록을 이전으로 전환하는 아이콘 '<<', '<' -->	
		<%if(firstPage > 1) { %>
			<a class="arrow pprev" href="buyList.jsp?currentPage=1&searchKeyword=<%=keyword %>">

			</a>
			<a class="arrow prev" href="buyList.jsp?currentPage=<%=firstPage-1 %>&searchKeyword=<%=keyword %>">

			</a>				
		<%} %>
		<!-- 페이지 번호 나열 -->
		<%
			for(int i=firstPage; i<=lastPage; i++) {
				// 페이지 번호 다 출력했으면, 반복문 탈출
				if(i > totalPage) {
					break;
				}
				// 페이지 선택시 하이라이트 처리
				// 현재페이지의 i만, span에 스타일처리
				if(i==currentPage){	%>
					<a class="active"><%=i %></a>
				<%} else {%>	
					<a href="buyList.jsp?currentPage=<%=i %>&searchKeyword=<%=keyword %>">
						<%=i %>
					</a>
				<%}%>
				
		<%  }
		%>
		<!-- <a>2</a><a>3</a><a>4</a><a>5</a> -->
		
		<!-- 블록을 다음으로 전환하는 아이콘 '>>', '>' -->	
		<%if(lastPage < totalPage) { %>
			<a class="arrow next" href="buyList.jsp?currentPage=<%=lastPage+1 %>&searchKeyword=<%=keyword %>">

			</a>	
			<a class="arrow nnext" href="buyList.jsp?currentPage=<%=totalPage %>&searchKeyword=<%=keyword %>">

			</a>			
		<%} %>
		
		<!-- 페이지 끝 -->
	</div>
	</div>
</div>
</article>
</div>
</section>
</div>
<%@ include file="../main/bottom.jsp" %>