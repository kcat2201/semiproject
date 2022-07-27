<%@page import="com.salguMarket.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memService" class="com.salguMarket.member.model.MemberService" 
	scope="session"></jsp:useBean>    
<%
	request.setCharacterEncoding("utf-8");
	String mNick=request.getParameter("mNick");
	
	int result=0;
	if(mNick!=null && !mNick.isEmpty()){
		result=memService.duplicateNick(mNick);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){/*사용하기버튼  */
		$('#btUse').click(function(){
			$(opener.document).find('#mNick').val('<%=mNick%>');
			$(opener.document).find('#chkNick').val('Y');
			self.close();
		});
	})
</script>
</head>
<body>
	<h3>닉네임을 입력하세요</h3>
	<form name="frmNick" method="post" action="checkMemberNick.jsp">
		<input type="text" name="mNick" id="mNick"
			title="닉네임입력" value="<%=mNick%>">
		<input type="submit" id="submit" value="중복확인" class="button">
		
		<%if(result==MemberService.UNUSABLE_NICKNAME){ %>
			<p>사용 중인 닉네임입니다.<br><br>다른 닉네임를 입력하세요</p>
		<%}else if(result==MemberService.USABLE_NICKNAME) { %>
			<p>사용가능한 닉네임입니다.<br><br>[사용하기]버튼을 클릭하세요</p>
			<input type="button" value="사용하기" id="btUse" class="button">
		<%} %>
	</form>
</body>
</html>



