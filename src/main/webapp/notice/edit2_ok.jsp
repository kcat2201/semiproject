<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="nService" class="com.salguMarket.nboard.model.NboardService"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit2_ok.jsp</title>
</head>
<body>
<%
	//1
	try{
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
			originalFileName=mr.getOriginalFileName("upfile");
			
			File file=mr.getFile("upfile");
			fileSize=file.length();
		}
		
		String nNo=mr.getParameter("nNo");
		String nTitle=mr.getParameter("nTitle");
		String content=mr.getParameter("content");
		String oldFileName=mr.getParameter("oldFileName");
			
		//2
		NboardVO vo= new NboardVO();
		vo.setnNo(Integer.parseInt(nNo));
		vo.setnTitle(nTitle);
		vo.setContent(content);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFileName);
		vo.setFileSize(fileSize);
	
		System.out.println("글 수정결과 cnt="+nTitle);
			int cnt=nService.updateNboard(vo);
			//3
			if(cnt>0){
				if(fileName!=null && !fileName.isEmpty()){
					if(oldFileName!=null && !oldFileName.isEmpty()){
						File oldFile=new File(saveDir, oldFileName);
						if(oldFile.exists()){
							boolean bool=oldFile.delete();
							System.out.println("기존파일 삭제:"+ bool);
						}
					}
				}
			%>
				<script type="text/javascript">
					alert('글 수정 성공!');
					location.href="detail2.jsp?nNo=<%=nNo%>";
				</script>
			<%}else{%>
				<script type="text/javascript">
					alert('글 수정 실패!');
					history.go(-1);
				</script>			
			<%
			}
			%>
	<%	
	}catch(SQLException e){
		e.printStackTrace();
	}%>
</body>
</html>