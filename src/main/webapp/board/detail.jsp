<%@ include file="../main/top2.jsp" %>
<link rel="stylesheet" href="../css/write.css" type="text/css">
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qServie" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<%
	String qNo=request.getParameter("qNo");
	if(qNo==null || qNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list.jsp";
		</script>
	<%return;
	}
	//2
	QboardDAO dao= new QboardDAO();
	QboardVO vo=null;
	
	try{
		vo=qServie.selectByNo(Integer.parseInt(qNo));
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
%>

<title>1:1문의수정</title>
	<article>
		<div class="container" >
			<h2>글상세보기</h2>
			<hr>
			<form name="form" id="form" role="form" method="post">
				<div class="mb-3">
					<span>제목 : </span><span><%=vo.getqTitle()%></span>
				</div>
				<hr>
				<div class="mb-3">
					<span>문의내용 : </span><span><%=content%></span>
				</div>
				<hr>
				<div class="mb-3">
					<span>조회수 :</span><span><%=vo.getReadcount()%></span>
				</div>
				<hr>
			</form>
			<div>
				<input type="submit" value="수정" class="list" onclick="location.href='edit.jsp?qNo=<%=qNo%>'">
				<input type="submit" value="삭제" class="list" onclick="location.href='delete.jsp?qNo=<%=qNo%>'">
				<%if(session.getAttribute("mId").equals("admin@salgu.com")){ %>
				<input type="submit" value="답변" class="list" onclick="location.href='write.jsp?qNo=<%=qNo%>'">
				<%} %>
				<input type="submit" value="목록" class="list" onclick="location.href='list.jsp'" >
		</div>
		</div>
	</article>
<%@ include file="../main/bottom.jsp" %>