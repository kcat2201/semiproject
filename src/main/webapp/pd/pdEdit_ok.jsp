<%@page import="com.salguMarket.common.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 게시글 수정완료</title>
</head>
<jsp:useBean id="pdVo" class="com.salguMarket.pd.model.PdVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>

<body>
	<%
	//pdEdit.jsp에서 post방식으로 서브밋
	//1
	try{
		String upDir=Utility.UPLOAD_PATH;//업로드할 폴더
		
		String saveDir=application.getRealPath(upDir);
		System.out.println("saveDir="+saveDir);
		/* saveDir=Utility.TEST_PATH;//절대 경로 */
		
		int maxSize=10*1024*1024;// 업로드 최대용량 10M
		String encoding="utf-8";
		
		//업로드시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 이름 변경
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		MultipartRequest mr
		=new MultipartRequest(request,saveDir,maxSize,encoding,policy);
		System.out.println("업로드 완료");
		
		//업로드 파일 정보
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originFileName="";
		
		if(fileName!=null&&!fileName.isEmpty()){
			originFileName=mr.getOriginalFileName("upfile");
			File file=mr.getFile("upfile");
			fileSize=file.length();
			
		}		
		
		//파라미터 값 읽어오기
		int pNo=Integer.parseInt(mr.getParameter("pNo"));
		String pTitle=mr.getParameter("pTitle");
		String cCode=mr.getParameter("cCode");
		System.out.println("editok cCode="+cCode);
		int price=Integer.parseInt(mr.getParameter("price"));
		String detail=mr.getParameter("detail");
		//int sellerNo=1; //임의의 값 
		String oldFileName=mr.getParameter("oldFileName");
		
		pdVo.setpNo(pNo);
		pdVo.setpTitle(pTitle);
		System.out.println("cCode="+cCode);
		pdVo.setcCode(cCode);
		pdVo.setPrice(price);
		pdVo.setDetail(detail);
		//pdVo.setSellerNo(sellerNo);
				
		//파일
		pdVo.setFileName(fileName);
		pdVo.setOriginalFilename(originFileName);
		pdVo.setFileSize(fileSize);
		System.out.println(pdVo);
		int cnt=pdService.updatePd(pdVo);
	
		
		if(cnt>0){
			//새로 첨부한 경우, 기존 일이 있으면 기존파일 삭제처리
				if(fileName!=null&&!fileName.isEmpty()){
					if(oldFileName!=null&&!oldFileName.isEmpty()){
						File oldFile=new File(saveDir, oldFileName);
						if(oldFile.exists()){
							boolean bool=oldFile.delete();
							System.out.println("기존파일 삭제: "+bool);
						}
					}
				}
		
		
		%>
			<script type="text/javascript">
						alert('글 수정 성공!');
						location.href="pdDetail.jsp?pNo=<%=pNo%>";
			</script>
		<%}else{%>
				<script type="text/javascript">
						alert('글 수정 실패!');
						history.go(-1);
					</script><%
			}
		}catch(Exception e){
				e.printStackTrace();
	}
	
	
%>
</body>
</html>