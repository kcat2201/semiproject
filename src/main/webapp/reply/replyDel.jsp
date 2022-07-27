<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String rNo=request.getParameter("rNo");
	String pNo=request.getParameter("pNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글삭제</title>
</head>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	if(confirm('삭제하시겠습니까?')){
		location.href="replyDel_ok.jsp?rNo=<%=rNo%>&pNo=<%=pNo%>";
	}
});
</script>
<body>

</body>
</html>