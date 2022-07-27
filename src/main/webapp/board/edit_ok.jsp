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
<title>edit_ok.jsp</title>
</head>
<body>
<%
	//edit.jsp에서 post방식으로 서브밋
	//1
	request.setCharacterEncoding("utf-8");
	String qNo=request.getParameter("qNo");
	String qTitle=request.getParameter("qTitle");
	String content=request.getParameter("content");
		
	//2
	QboardDAO dao=new QboardDAO();
	QboardVO vo=new QboardVO();
	vo.setqNo(Integer.parseInt(qNo));
	vo.setqTitle(qTitle);
	vo.setContent(content);
	System.out.println("editok"+qNo);
	System.out.println(qTitle);
	System.out.println(content);
	
	try{
		int cnt=qService.updateQboard(vo);	
			//3
		if(cnt>0){%>		
				<script type="text/javascript">					
				alert('글 수정 성공!');
				location.href="detail.jsp?qNo=<%=qNo%>";
			</script>
		<%}else{%>
				<script type="text/javascript">					
				alert('글 수정 실패!');
				history.go(-1);
			</script>			
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}%>
</body>
</html>