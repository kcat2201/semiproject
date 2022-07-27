<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<jsp:useBean id="qServie" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<%
	// list.jsp에서 제목 누르면 get방식으로 이동
	//=>http://localhost:9090/herbmall/borad/countUpdate.jsp?no=8
	
	//1 파라미터 읽어오기
	String qNo=request.getParameter("qNo");
	if(qNo==null|| qNo.isEmpty()){%>
	<script type="text/javascript">
		alert("잘못된 URL입니다.");
		location.href="list.jsp";
	</script>
		<%return;
}
	//2
	QboardDAO dao= new QboardDAO();
	
	try{
		int cnt=qServie.updateCount(Integer.parseInt(qNo));
		//3
		if(cnt>0){
			response.sendRedirect("detail.jsp?qNo="+qNo);
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