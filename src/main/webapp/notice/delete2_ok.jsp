<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="org.apache.coyote.http11.filters.SavedRequestInputFilter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nService" class="com.salguMarket.nboard.model.NboardService"
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
	String nNo = request.getParameter("nNo");
	//

	//2
	NboardVO vo = new NboardVO();
	vo.setnNo(Integer.parseInt(nNo));

	try {
		int cnt=nService.deleteNboard(Integer.parseInt(nNo));
		if(cnt>0){%>
			<script type="text/javascript">
				alert("삭제 성공");
				location.href = "list2.jsp";
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