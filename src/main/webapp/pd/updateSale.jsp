<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>

<%
String pNo = request.getParameter("pNo");
String mNo = request.getParameter("mNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매처리</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		if (confirm('판매처리하시겠습니까?')) {
			//판매플래그 Y로 변경
			<%pdService.updateSaleflag(Integer.parseInt(pNo), Integer.parseInt(mNo));%>
			
			location.href="pdDetail.jsp?pNo=<%=pNo%>";
			

			return;
			
		}else{
			history.back();
		}
	});
</script>
</head>
<body>

</body>
</html>