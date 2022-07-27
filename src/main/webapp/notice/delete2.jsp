<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>글 삭제</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm{
		width:650px;
		border:1px solid #ddd;		
	}
	
	.divForm div	{
		/* clear: both; */
		border:none;
		padding: 7px 0;
		margin: 0;
		overflow: auto;
	}	
	.sp{
		font-size:0.9em;
		color:#0056AC;			
	}
	.divForm fieldset	{
		border:0;
	}
</style>
<%
	//1
	String nNo=request.getParameter("nNo");
	if(nNo==null || nNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list2.jsp";
		</script>
		
	<%	return;
	}
%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmDelete]').submit(function(){
			if(confirm('삭제하시겠습니까?')){
			}else{
				event.preventDefault();
			}
		});
	});
	
</script>
</head>
<body>
<div class="divForm">
<form name="frmDelete" method="post"	action="delete2_ok.jsp" >
	<!-- 삭제 처리시 필요한 no를 hidden 필드에 넣어준다 --> 
	<input type="hidden" name="nNo" value="<%=nNo %>" />
	
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp"><%=nNo %> 번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                	OnClick="location.href='list2.jsp'" />
	        </div>
	    </fieldset>
    </form>
</div>

</body>
</html>