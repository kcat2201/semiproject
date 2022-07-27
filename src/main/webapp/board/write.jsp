<%@ include file="../main/top2.jsp" %>
<link rel="stylesheet" href="../css/write.css" type="text/css">
<%@page import="com.salguMarket.qboard.model.QboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.qboard.model.QboardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qService" class="com.salguMarket.qboard.model.QboardService"
	scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../smarteditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">


$(function(){
	var oEditors = [];
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
    
    $('form[name=form1]').submit(function(){
		$('.form-control').each(function(idx, item){
			if($.trim($(this).val()).length<1){
			alert($(this).prev().text() +'을(를) 입력하세요!');
			event.preventDefault();
			return false;
			}
		});
	});
    
    <%-- $(function(){
    	var mid=<%=session.getAttribute("mId")%>;
    	if(mid==null||mid.isEmpty()){
    		alert('로그인을 하셔야 합니다');
    		location.href="../pd/pdlist.jsp";
    		event.preventDefault();
    	}
    }); --%>
});



</script>

<%
	String qNo=request.getParameter("qNo");
	String mNo = (String)session.getAttribute("mNo");

	QboardVO vo= null;
	boolean isReply=false;
	String url="", save="";
	if(qNo!=null && !qNo.isEmpty()){
		isReply=true;
		url="reply_ok.jsp";
		save="답변!";
		
		try{
			vo=qService.selectByNo(Integer.parseInt(qNo));
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		url="write_ok.jsp";
		save="등록";
	}
%>
<title>1:1문의
<%if(isReply){ %>
	답변게시판
<%}else{ %>
	1:1문의
<%} %>
</title>
	<article>
		<div class="container" style="padding-bottom: 350px">
			<hr>
			<form name="form1" id="form1" role="form" method="post" action="<%=url%>">
			<input type="hidden" name="mNo" value="<%=mNo%>">
				<%if(isReply){ %>					
					<input type="hidden" name="groupNo" value="<%=vo.getGroupNo()%>">
					<input type="hidden" name="step" value="<%=vo.getStep()%>">
					<input type="hidden" name="sortNo" value="<%=vo.getSortNo()%>">
				<%}
				%>	
				 <fieldset>
					<legend>
					<%if(isReply){ %>
						답변하기
					<%}else{ %>
						글쓰기
					<%} %>
					</legend>
					<div>
						<label for="qtitle">제목</label> 
						<input type="text" class="form-control" name="qtitle" 
							placeholder="제목을 입력해 주세요"
							<%if(isReply){ %>
								value="Re :<%=vo.getqTitle() %>"
							<%} %>
							>						
					</div>
					<hr>
					<div>
						<label for="content">내용</label>
						<textarea class="form-control" rows="10" name="content" id="content" "
							placeholder="내용을 입력해 주세요"></textarea>
					</div>
					<hr>
				<div>
					<input type="submit" value="<%=save %>" class="save" id="btsave">
					<input type="button" value="목록" class="list" id="btlist" name="btlist" onclick="location.href='list.jsp'" >
					<!--  -->
				</div>
				</fieldset>
			</form>
		</div>
	</article>
<%@ include file="../main/bottom.jsp" %>