<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글등록완료</title>
</head>
<jsp:useBean id="replyVo" class="com.salguMarket.reply.model.ReplyVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="replyService"
	class="com.salguMarket.reply.model.ReplyService" scope="session"></jsp:useBean>
<body>

	<%
	request.setCharacterEncoding("utf-8");

	int pNo = Integer.parseInt(request.getParameter("pNo"));
	
	/* int mNo = Integer.parseInt(request.getParameter("mNo"));//##회원번호 =Integer.parseInt(session.getAttribute("mNo")); */
	int mNo=Integer.parseInt((String)session.getAttribute("mNo"));

	String mNick=(String)session.getAttribute("mNick"); //##로그인한 회원 닉네임 =(String)session.getAttribute("mNick");
	String rContent = request.getParameter("rContent");
	
	replyVo.setmNo(mNo);
	replyVo.setpNo(pNo);
	replyVo.setrContent(rContent);
	replyVo.setmNick(mNick);
	
	try {
		int cnt=replyService.insertReply(replyVo);
		if(cnt>0){
			%>
			<script type="text/javascript">
				alert('댓글등록성공');
				location.href="../pd/pdDetail.jsp?pNo=<%=pNo%>&cnt=<%=cnt%>";
				
			</script> 
			
			<% 
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
	
</body>
</html>