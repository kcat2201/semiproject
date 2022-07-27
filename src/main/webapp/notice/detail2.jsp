<%@ include file="../main/top2.jsp" %>
<link rel="stylesheet" href="../css/write.css" type="text/css">
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nServie" class="com.salguMarket.nboard.model.NboardService"
	scope="session"></jsp:useBean>
<%
	String nNo=request.getParameter("nNo");
	if(nNo==null || nNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list2.jsp";
		</script>
	<%return;
	}
	//2
	NboardDAO dao= new NboardDAO();
	NboardVO vo=null;
	
	try{
		vo=nServie.selectByNo(Integer.parseInt(nNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String content=vo.getContent();
	
	if(content!=null && !content.isEmpty()){
	content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileInfo="", downInfo="";
	String fileName=vo.getOriginalFileName();
	if(fileName!=null && !fileName.isEmpty()){
		fileInfo=Utility.getFileInfo(fileName, vo.getFileSize());
		downInfo="다운 : " + vo.getDownCount();
	}
%>

<title>1:1문의수정</title>

	<article>
		<div class="container" style="padding-bottom: 350px">
			<h2>글상세보기</h2>
			<hr>
			<form name="form" id="form" role="form" method="post">
				<div class="mb-3">
					<span>제목 : </span><span><%=vo.getnTitle()%></span>
				</div>
				<hr>
				<div class="mb-3">
					<span>문의내용 : </span><span><%=content%></span>
				</div>
				<hr>
				<div>
					<span class="sp1">첨부파일</span> 
					<span>
						<a href
		="downCount.jsp?nNo=<%=nNo%>&fileName=<%=vo.getFileName()%>&originalFileName=<%=vo.getOriginalFileName()%>">
							<%=fileInfo %>
						</a>
					</span>
					<span><%=downInfo %></span>
				</div>
				<hr>
				<div class="mb-3">
					<span>조회수 :</span><span><%=vo.getReadcount()%></span>
				</div>
				<hr>
			</form>
			<%if(session.getAttribute("mId").equals("admin@salgu.com")){ %>
			<div>
				<input type="submit" value="수정" class="list" onclick="location.href='edit2.jsp?nNo=<%=nNo%>'">
				<input type="submit" value="삭제" class="list" onclick="location.href='delete2.jsp?nNo=<%=nNo%>'">
				<input type="submit" value="목록" class="list" onclick="location.href='list2.jsp'" >
			</div>
			<%} %>
		</div>
	</article>
<%@ include file="../main/bottom.jsp" %>