<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//login_ok에서 저장했던 세션
	String loginId= (String)session.getAttribute("mId");
	//String loginId= "c@c";	//테스트용

	if(loginId==null || loginId.isEmpty()){
		String ctxPath = request.getContextPath();//
		String url = ctxPath+"/login/login.jsp";
	%>
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href=<%=url%>;
		</script>
		
	<%	return;
	}
%>