<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
<jsp:useBean id="qService" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<%
	//write.jsp에서 post방식으로 이동
	//요청파라미터 인코딩
	request.setCharacterEncoding("utf-8");
	String qtitle=request.getParameter("qtitle");
	String content=request.getParameter("content");
	int mNo = Integer.parseInt(request.getParameter("mNo"));

	//2db
	QboardDAO dao= new QboardDAO();
	QboardVO vo= new QboardVO();	
	
	vo.setqTitle(qtitle);
	vo.setContent(content);
	vo.setmNo(mNo);
	
	try{
		int cnt= qService.insertQboard(vo);
		if(cnt>0){%>
			<script type="text/javascript">
				alert("글쓰기 성공");
			location.href="list.jsp";
		</script>
		<%}else{%>
			<script type="text/javascript">
				alert("글쓰기 실패");
				history.back();/* 뒤로가기 */
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>