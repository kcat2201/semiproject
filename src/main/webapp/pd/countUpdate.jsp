<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>
	
<body>
<%
	String pNo=request.getParameter("pNo");
	if(pNo==null || pNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			history.back();
		</script>
		<% 
		return;
	}
	
	try{
	
	int cnt=pdService.updateCount(Integer.parseInt(pNo));
	if(cnt>0){
		response.sendRedirect("pdDetail.jsp?pNo="+pNo); //mNo : session에서 읽어오기
	}else{%>
		<script type="text/javascript">
				alert("조회수 증가 실패!");
				history.back();
		</script>	
	<%
		
	}
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	 
%>
</body>
</html>