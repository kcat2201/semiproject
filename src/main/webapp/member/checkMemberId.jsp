<%@page import="com.salguMarket.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memService" class="com.salguMarket.member.model.MemberService" 
	scope="session"></jsp:useBean>    
<%
	request.setCharacterEncoding("utf-8");
	String mId=request.getParameter("mId");
	
	int result=0;
	if(mId!=null && !mId.isEmpty()){
		result=memService.duplicateId(mId);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){/*사용하기버튼  */
		$('#btUse').click(function(){
			$(opener.document).find('#mId').val('<%=mId%>');
			$(opener.document).find('#chkId').val('Y');
			
			self.close();
		});
	})
</script>
</head>
<body>
	<h3>아이디를 입력하세요</h3>
	<form name="frmId" method="post" action="checkMemberId.jsp">
		<input type="text" name="mId" id="mId"
			title="아이디입력" value="<%=mId%>">
		<input type="submit" id="submit" class="button" value="중복확인">
		
		<%if(result==MemberService.UNUSABLE_ID){ %>
			<p>사용 중인 아이디입니다.<br><br>다른 아이디를 입력하세요</p>
		<%}else if(result==MemberService.USABLE_ID ) { %>
			<p>사용가능한 아이디입니다.<br><br>[사용하기]버튼을 클릭하세요</p>
			<input type="button" value="사용하기" id="btUse" class="button">
		<%} %>
	</form>
</body>
</html>



