<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@page import="org.apache.coyote.http11.filters.SavedRequestInputFilter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qService" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//delete.jsp에서 post방식으로 이동
	//1
	request.setCharacterEncoding("utf-8");
	String qNo = request.getParameter("qNo");
	/* String groupNo = request.getParameter("groupNo");
	String step = request.getParameter("step"); */
	//

	//2
	QboardDAO dao = new QboardDAO();
	QboardVO vo = new QboardVO();
	vo.setqNo(Integer.parseInt(qNo));
	/* vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setStep(Integer.parseInt(step)); */

	try {
		int cnt=qService.deleteqBoard(Integer.parseInt(qNo));
		if(cnt>0){%>
			<script type="text/javascript">
				alert("삭제 성공");
				location.href = "list.jsp";
			</script>
			<%}else{ %>
			<script type="text/javascript">
				alert("삭제 실패!");
				history.back();
			</script>			
			
			
			<%} %>
				
		
		
	
	<%} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>