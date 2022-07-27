<%@page import="com.salguMarket.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 게시글 등록 완료</title>
</head> 
<jsp:useBean id="pdVo" class="com.salguMarket.pd.model.PdVO" scope="page"></jsp:useBean>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService" scope="session"></jsp:useBean>
<body>
<%
	//register.jsp에서 post방식으로 서브밋됨
	//1
	try{
		String upDir=Utility.UPLOAD_PATH; //업로드할 폴더명 : pds_upload
		String saveDir=application.getRealPath(upDir);
		
		System.out.println("saveDir="+saveDir);
	/* 	saveDir=Utility.TEST_PATH;
		System.out.println("saveDir="+saveDir);  */
		
		int maxSize=10*1024*1024; //10M
		String encoding="utf-8";
		
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,saveDir,maxSize,encoding,policy);
		System.out.println("업로드 완료");
		
		//업로드 파일 정보
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originFileName="";
		if(fileName!=null && !fileName.isEmpty()){
			originFileName=mr.getOriginalFileName("upfile");
			File f=mr.getFile("upfile");
			fileSize=f.length();
		}
		
		//파라미터 값 읽어오기
		String pTitle=mr.getParameter("pTitle");
		String cCode=mr.getParameter("cCode");
		int price=Integer.parseInt(mr.getParameter("price"));
		String detail=mr.getParameter("detail");
		/* int sellerNo=3; //##임의의 값  =Integer.parseInt(session.getAttribute("mNo")); */
		int sellerNo=Integer.parseInt((String)session.getAttribute("mNo"));

		pdVo.setpTitle(pTitle);
		pdVo.setcCode(cCode);
		pdVo.setPrice(price);
		pdVo.setDetail(detail);
		pdVo.setSellerNo(sellerNo);
		
		//파일
		pdVo.setFileName(fileName);
		pdVo.setOriginalFilename(originFileName);
		pdVo.setFileSize(fileSize);
		System.out.println(pdVo);
		int cnt=pdService.insertPd(pdVo);
		
		if (cnt > 0) {%>
			<script type="text/javascript">
			alert("상품이 성공적으로 등록되었습니다");
			location.href="../pd/pdlist.jsp";
			</script>
			
		<% 
			
			}
	}catch(IOException e){
		e.printStackTrace();%>
		<script type="text/javascript">
			alert("10M 이상의 파일은 업로드 불가!");
			history.back();
		</script>
		<%
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>