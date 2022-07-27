<%@ include file="../main/top2.jsp" %>
<link rel="stylesheet" href="../css/write.css" type="text/css">
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nServie" class="com.salguMarket.nboard.model.NboardService"
	scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../smarteditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.

        sSkinURI: '<c:url value="/smarteditor2/SmartEditor2Skin.html" />',  
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         
            fOnBeforeUnload : function(){
                 
            }
        }, 
        fOnAppLoad : function(){
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["content"].exec("PASTE_HTML", [""]);
        },
        fCreator: "createSEditor2"
    });
    
    //저장버튼 클릭시 form 전송
    $("#btsave").click(function(){
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
    }); 
});

</script>
<%
	String nNo=request.getParameter("nNo");
	if(nNo==null || nNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list2.jsp";
		</script>
	<%return;
	}
	//2
	NboardDAO dao= new NboardDAO();
	NboardVO vo=null;
	
	try{
		vo=nServie.selectByNo(Integer.parseInt(nNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String content=vo.getContent();
	
	if(content!=null && !content.isEmpty()){
	content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String originalFileName=vo.getOriginalFileName();
	String fileName=vo.getFileName();
	if(fileName==null) fileName="";
%>
<title>공지사항 수정</title>
	<article>
		<div class="container" style="padding-bottom: 350px">
			<h2>글수정</h2>
			<hr>
			<form name="form" id="form" role="form" method="post" action="edit2_ok.jsp"
			enctype="multipart/form-data">
			<input type="hidden" name="nNo" value="<%=nNo %>" />
			<input type="hidden" name="oldFileName" value="<%=fileName %>" />
				<div class="mb-3">
					<label for="title">제목</label> 
					<input type="text"
						class="form-control" name="nTitle" id="nTitle" value="<%=vo.getnTitle()%>">
					
				</div>
				<hr>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="10" name="content" id="content" ><%=content %></textarea>
				</div>
				<hr>
				<div class="mb-3">
					<label for="title">조회수</label> <input type="text"
						class="form-control" name="readcount" id="readcount" value="<%=vo.getReadcount()%>">
				</div>
				<div>
            <label for="upfile">첨부파일</label>
            <input type="file" id="upfile" name="upfile"/>
        </div>
	        <div>
	            <span class="sp1">첨부파일목록</span>            
	            <%if(originalFileName !=null && !originalFileName.isEmpty()){ %>
	            	<span>
	            	<%=Utility.getFileInfo(originalFileName, vo.getFileSize()) %>
	            	</span>
	            	<br>
	            	<span style="color: orange;font-weight: bold;">
	            		첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
	            <%} %>
	        </div>
				<hr>
				<input type="submit" value="수정" class="list" id="btsave">
			</form>
				<input type="submit" value="목록" class="list" onclick="location.href='list2.jsp'" >
		</div>
	</article>
<%@ include file="../main/bottom.jsp" %>