<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="nService" class="com.salguMarket.nboard.model.NboardService" 
	scope="session"></jsp:useBean>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String nNo=request.getParameter("nNo");
	String fileName=request.getParameter("fileName");
	String originalFileName=request.getParameter("originalFileName");
	
	//2
	BufferedInputStream bis=null;
	BufferedOutputStream bos=null;
	
	try{
		int cnt=nService.updateDownCount(Integer.parseInt(nNo));
		
		response.reset();
		
		response.setContentType("application/octet-stream");
		
		response.setHeader("Content-Disposition", "attachment;filename="
			+ new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1"));
		
		out.clear();
		out=pageContext.pushBody();

		String path=application.getRealPath(Utility.TEST_PATH);
		path=Utility.TEST_PATH;
		File file=new File(path, fileName);
		
		byte[] data=new byte[1024*1024];
		bis=new BufferedInputStream(new FileInputStream(file));
		bos=new BufferedOutputStream(response.getOutputStream());
		
		int count=0;
		while((count=bis.read(data))!=-1){
			bos.write(data);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(bis!=null) bis.close();
		if(bos!=null) bos.close();
	}
	
%>
</body>
</html>