<%@page import="java.io.File"%>
<%@page import="com.salguMarket.common.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 게시글 삭제</title>

</head>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>
<body>
<%
	int pNo=Integer.parseInt(request.getParameter("pNo"));
	String fileName = request.getParameter("fileName");

	if(pdService.deletePd(pNo)>0){
		String upDir=Utility.UPLOAD_PATH;//업로드할 폴더
		String saveDir=application.getRealPath(upDir);
		
		if(fileName!=null&&!fileName.isEmpty()){
			File file=new File(saveDir, fileName);
			if(file.exists()){
				boolean bool=file.delete();
				System.out.println("첨부파일 삭제: "+bool);
			}
		}
	%>
	
	<script type="text/javascript">
		alert('삭제 성공');
		location.href="../pd/pdlist.jsp"; // ##메인화면
	</script>
		<%} else{%>
	<script type="text/javascript">
		alert('삭제 실패');
		history.back();
		</script>
	<%} %>
%>
</body>
</html>