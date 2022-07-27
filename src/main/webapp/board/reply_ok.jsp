<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qService" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply_ok.jsp</title>
</head>
<body>
<%
	//write.jsp에서 post방식으로 서브밋
	//1
	request.setCharacterEncoding("utf-8");
	String qTitle=request.getParameter("qtitle");
	String content=request.getParameter("content");
	//
	String groupNo=request.getParameter("groupNo");
	String step=request.getParameter("step");
	String sortNo=request.getParameter("sortNo");
		
	//2
	QboardDAO dao = new QboardDAO();
	QboardVO vo = new QboardVO();
	vo.setContent(content);
	vo.setqTitle(qTitle);
	vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setStep(Integer.parseInt(step));
	vo.setSortNo(Integer.parseInt(sortNo));
	
	try{
		int cnt=qService.reply(vo); 
		
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("답변하기 성공");
				location.href="list.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("답변하기 실패");
				history.back();
			</script>			
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	%>	
</body>
</html>