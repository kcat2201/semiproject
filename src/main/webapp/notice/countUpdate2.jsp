<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate2.jsp</title>
</head>
<body>
<jsp:useBean id="nServie" class="com.salguMarket.nboard.model.NboardService"
	scope="session"></jsp:useBean>
<%
	//1 파라미터 읽어오기
	String nNo=request.getParameter("nNo");
	if(nNo==null|| nNo.isEmpty()){%>
	<script type="text/javascript">
		alert("잘못된 URL입니다.");
		location.href="list2.jsp";
	</script>
		<%return;
}
	//2
	NboardDAO dao= new NboardDAO();
	
	try{
		int cnt=nServie.updateCount(Integer.parseInt(nNo));
		//3
		if(cnt>0){
			response.sendRedirect("detail2.jsp?nNo="+nNo);
		}else{%>
			<script type="text/javascript">
				alert('조회수 증가 실패!');
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>