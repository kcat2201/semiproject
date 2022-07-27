<%@ include file="../main/top2.jsp" %>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<link rel="stylesheet" href="../css/list.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nService" class="com.salguMarket.nboard.model.NboardService" 
	scope="session"></jsp:useBean>  
<jsp:useBean id="nVo" class="com.salguMarket.nboard.model.NboardVO"
	scope="session"></jsp:useBean>  
<%
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	NboardDAO dao= new NboardDAO();
	List<NboardVO> list= null;
	
	try{
		list=nService.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";
	
	int currentPage=1;
		
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
		
	int totalRecord = list.size(); 
	int pageSize = 5; 
	int blockSize = 10; 		
	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>
<title>공지사항</title>

	<div id="container" style="padding-bottom: 350px">
		<div id="list">
			<h2>공지사항</h2>
			<%if(keyword != null && !keyword.isEmpty()){ %>
				<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색 완료.</p>
			<%} %>
		</div>

		<div>
			<table class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">조회</th>
					</tr>
				</thead>
				<tbody>
				<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">해당 글이 존재하지 않습니다.</td>
						</tr>
					<%}else{ %>	
					  <!--게시판 내용 반복문 시작  -->	
						<%		  
					  int num=pageVo.getNum();
					  int curPos=pageVo.getCurPos();
					  for(int i=0;i<pageSize;i++){ 
						  	if(num-- <1) break;
						  	
					  		NboardVO vo = list.get(curPos++);
					  %>	
					<tr>

						<td><%=vo.getnNo() %></td>
						<td>
						<%=Utility.displayFile(vo.getFileName()) %>
						<a href="countUpdate2.jsp?nNo=<%=vo.getnNo()%>">
						<%=vo.getnTitle() %></a>
						<%=Utility.displayNew(vo.getRegdate()) %>
						</td>
						<td><%=vo.getaId() %></td>
						<td><%=sdf.format(vo.getRegdate()) %></td>
						<td><%=vo.getReadcount() %></td>
					<tr>
					<%} %>
				<%} %>
				</tbody>
			</table>
			<div class="Page" style="text-align: center">
				<%if(pageVo.getFirstPage()>1){ %>
					<a href='list2.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
						<img src='../img/first.JPG'>
					</a>
				<%} %>
				
				<%
				for(int i=pageVo.getFirstPage(); i<=pageVo.getLastPage(); i++){
					if(i>pageVo.getTotalPage()) break;
					if(i==currentPage){%>
						<span><%=i %></span>
					<%}else{%>
						<a href='list2.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
						<%=i %></a>
					<%} %>
				<%} %>
				
				<%
					if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
						<a href='list2.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
							<img src='../img/last.JPG'>
						</a>
					<%} %>
			
			</div>
			<%if(session.getAttribute("mId").equals("admin@salgu.com")){ %>
			<div id="write">
				<input type="submit" value="글쓰기" class="write" onclick="location.href='write2.jsp'">
			</div>
			<%} %>
			<div class="divSearch">
				<form name="frmSearch" method="post" action='list2.jsp'>
					<select name="searchCondition">
						<option value="ntitle"
						<% if("title".equals(condition)){ %>
							selected="selected"
							<%} %>
						>제목</option>
						<option value="content"
						<% if("content".equals(condition)){ %>
							selected="selected"
							<%} %>
						>내용</option>
						<option value="aid"
						<% if("name".equals(condition)){ %>
							selected="selected"
							<%} %>
						>작성자</option>
					</select>
				 
					<input type="text" style="width: 15em;" name="searchKeyword" title="검색어 입력" value="<%=keyword %>"> 
					<input type="submit" value="검색" class="search" >
				
				</form>
			</div>
			<div id="paging"></div>
		</div>
	</div>
<%@ include file="../main/bottom.jsp" %>