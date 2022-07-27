<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok2.jsp</title>
</head>
<body>
<jsp:useBean id="nService" class="com.salguMarket.nboard.model.NboardService"
	scope="session"></jsp:useBean>
<%

	/* ServletContext context = request.getSession().getServletContext();
	String realPath=context.getRealPath(upDir); */
try {
	String upDir=Utility.TEST_PATH;
	String saveDir=application.getRealPath(upDir);
	System.out.println("saveDir="+saveDir);
	
	/* saveDir=config.getServletContext().getRealPath(upDir);
	System.out.println("saveDir="+saveDir); */
	
	/* saveDir=Utility.TEST_PATH;
	System.out.println("testDir="+saveDir); */
	
	int maxSize=10*1024*1024;  
	String encoding="utf-8";
	
	
	DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
	
	MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
	System.out.println("업로드 완료");
	
	String fileName=mr.getFilesystemName("upfile");
	long fileSize=0;
	String originalFileName="";
	if(fileName!=null && !fileName.isEmpty()){
		File f = mr.getFile("upfile");
		fileSize=f.length();
		
		originalFileName=mr.getOriginalFileName("upfile");
	}

	//write.jsp에서 post방식으로 이동
	String nTitle=mr.getParameter("nTitle");
	String content=mr.getParameter("content");
	//2db
	NboardVO vo= new NboardVO();
	vo.setaId("admin@salgu.com");
	vo.setnTitle(nTitle);
	vo.setContent(content);
	vo.setFileName(fileName);
	vo.setFileSize(fileSize);
	vo.setOriginalFileName(originalFileName);
	int cnt = nService.insertNboard(vo);

	
		if (cnt > 0) {%>
			<script type="text/javascript">
				alert("글쓰기 성공");
				location.href="list2.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("글쓰기 실패");
				history.back();/* 뒤로가기 */
			</script>
		<%}
	}catch(IOException e){
		e.printStackTrace();%>
		
		<script type="text/javascript">
			alert("10M 이상의 파일은 업로드 불가!");
			history.back();
		</script>
	<%}catch(SQLException e){
		e.printStackTrace();
	}%>
</body>
</html>