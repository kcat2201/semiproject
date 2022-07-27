<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글삭제완료</title>
</head>
<jsp:useBean id="replyService" class="com.salguMarket.reply.model.ReplyService"
	scope="session"></jsp:useBean>

<body>
<% 
	String rNo=request.getParameter("rNo");
	String pNo=request.getParameter("pNo");
	
	try {
		int cnt=replyService.deleteReply(Integer.parseInt(rNo));
		if(cnt>0){
			%>
			<script type="text/javascript">
				alert('댓글삭제성공');
				location.href="../pd/pdDetail.jsp?pNo=<%=pNo%>";
				
			</script> 
			
			<% 
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>