<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top2.jsp" %> <!-- 추가 -->
<%@page import="com.salguMarket.reply.model.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>

<jsp:useBean id="pdVo" class="com.salguMarket.pd.model.PdVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>
<jsp:useBean id="replyService"
	class="com.salguMarket.reply.model.ReplyService" scope="session"></jsp:useBean>

<%
String cnt=request.getParameter("cnt");
String pNo = request.getParameter("pNo");
String mNo=null;
if((String)session.getAttribute("mNo")!=null){
	mNo=(String)session.getAttribute("mNo");
	
}/* String mNo = request.getParameter("mNo"); */ //##로그인한 회원번호 

/* if((int)session.getAttribute("mNo")!=null){
	String mNo=Integer.toString((int)session.getAttribute("mNo"));
}else{
	mNo="";
} */

if(pNo==null || pNo.isEmpty()){%>
<script type="text/javascript">
	alert('잘못된 url입니다.');
	location.href="../pdlist.jsp"
</script>
<% 
return;
}

List<ReplyVO> list = null;

try {
	pdVo = pdService.selectByNo(Integer.parseInt(pNo));
	list = replyService.selectAllBypNo(Integer.parseInt(pNo));//댓글
} catch (SQLException e) {
	e.printStackTrace();
}
int sellerNo = pdVo.getSellerNo(); //판매자번호

String pTitle = pdVo.getpTitle();
int price = pdVo.getPrice();
DecimalFormat df=new DecimalFormat("#,###원"); //천단위 구분기호


Date d = pdVo.getRegdate();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String regdate = sdf.format(d);
String saleflag = pdVo.getSaleflag();
int readcount=pdVo.getReadcount();

String detail = pdVo.getDetail();
if (detail != null && !detail.isEmpty()) {
	detail = detail.replace("\r\n", "<br>");
}
String fileName = pdVo.getFileName();

String originFileName = pdVo.getOriginalFilename();
String path = "../pds_upload/" + originFileName;
%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 게시글 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"> -->
<link rel="stylesheet" href="../css/detail.css"> 
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		if(<%=cnt%>!=null){
			
			$('#nav-home-tab').removeClass('active');
			$('#nav-home').removeClass('show active');
			$('#nav-profile-tab').addClass('active');
			$('#nav-profile').addClass('show active');
		}
		
		if($('#saleflag').val()=='N'){
			$('#btFlag').css({'background-color':'#FD8A69','border-color':'#FD8A69'}).text('판매중');
		}else{
			$('#btFlag').css({'background-color':'gray','border-color':'gray'}).text('판매완료');
		}
		if(<%=mNo%>==<%=sellerNo%>){

			if($('#saleflag').val()=='N'){
				//$('#btFlag').removeAttr('disabled').text('판매처리');
				$('#btPdEdit').css('visibility','visible');
				$('#btPdDel').css('visibility','visible');
			}else{
				$('#btFlag').text('판매처리완료');
			}

		}
		$("#btReply").click(function(){
			if(<%=mNo%>==null){
				alert('로그인 필요');
				event.preventDefault();
			}
			
			else if ($.trim($("#rContent").val()).length == 0) {
				alert('내용을 입력하세요');
				$("#rContent").focus();
				event.preventDefault();
			}else{
				location.href="../reply/reply_ok.jsp?pNo=<%=pNo%>&mNo=<%=mNo%>";
			}
		});
		
		<%-- $("#btFlag").click(function(){
			
			if(confirm('판매처리하시겠습니까?')){
				//판매플래그 Y로 변경
				<%
				pdService.updateSaleflag(Integer.parseInt(pNo));
				%>
				location.reload();
			}
			
		}); --%>
		
		$("#btPdEdit").click(function(){
			location.href="pdEdit.jsp?pNo=<%=pNo%>";
		});
		$("#btPdDel").click(function(){
			
			if(confirm('삭제하시겠습니까?')){
				location.href="pdDelete.jsp?pNo=<%=pNo%>&fileName=<%=fileName%>";
			}
			
		});
		
	});
	
</script>

<!-- </head>

<body> -->
	<div class="detailPage">
		<div class="container col-xxl-8 px-4 py-5 ">
			<div class="row flex-lg-row-reverse align-items-center g-5 py-5">

				<div class="col-lg-6">
					<p id="title"><%=pTitle%></p>
					<p id="price"><%=df.format(price)%>
					</p>
					<hr>
					<p id="regdate">
						등록일
						<%=regdate%> <img src="../img/eye.png" width="25px" height="25px" style="margin-bottom: 5px;margin-left:10px"> 조회수 <%=readcount %></p>


					<div class="d-grid gap-2 d-md-flex justify-content-md-start">
						<button type="button" class="btn btn-primary btn-lg px-4 gap-3"
							id="btFlag" disabled="disabled"></button>
						<button type="button" class="btn btn-primary btn-lg px-4 gap-3"
							id="btPdEdit"
							style="border-color: blue; background-color: blue; visibility: hidden; font-size: 20px;	font-family: Roboto;">수정</button>
						<button type="button" class="btn btn-primary btn-lg px-4 gap-3"
							id="btPdDel"
							style="border-color: red; background-color: red; visibility: hidden; font-size: 20px;	
	font-family: Roboto;">삭제</button>
						<input type="hidden" value="<%=saleflag%>" id="saleflag">

					</div>
				</div>
				<div class="col-10 col-sm-8 col-lg-6">
					<img src="<%=path%>" class="d-block mx-lg-auto img-fluid"
						alt="Bootstrap Themes" width="400" height="400" loading="lazy"
						style="max-height: 400px; max-width: 400px">
				</div>
			</div>

		</div>
		<div class="container col-xxl-8 px-4 py-5">
			<nav>
				<div class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">상품정보</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">상품문의</button>

				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="detail" style="font-size: 14px">
						<%=detail%><br>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">

					<table class="table caption-top">
						<caption>
							<span style="font-size: 20px">상품문의</span> <span
								style="color: red; font-size: 20px"><%=list.size()%></span>
						</caption>

						<form class="reply" method="post" action="../reply/reply_ok.jsp">
							<div class="card-body">
								<input type="hidden" value=<%=pNo%> name="pNo"> <input
									type="hidden" value=<%=mNo%> name="mNo">
								<ul class="list-group list-group-flush"
									style="text-align: right">
									<li class="list-group-item"><textarea class="form-control"
											id="rContent" rows="3" name="rContent"></textarea>
										<button type="submit" class="btn btn-dark mt-3" id="btReply">등록</button>
									</li>
								</ul>
							</div>
						</form>
						<tbody>
							<!-- <tr>
							<th scope="row" class="nick">홍길동</th>
							<td>hong</td>
							<td class="buttons">
								<button type="button" class="btn btn-dark mt-3" id="btEdit" 
								style="border-color: blue;background-color: blue" >수정</button>
								<button type="button" class="btn btn-dark mt-3" id="btDel"
								style="border-color: red;background-color: red">삭제</button>
							</td>

						</tr> -->
							<%
							for (int i = 0; i < list.size(); i++) {
								ReplyVO vo = list.get(i);
							%>
							<tr>
								<th scope="row" class="nick"><%=vo.getmNick()%></th>

								<td style="font-size: 14px">
									<%
									String content = vo.getrContent();
									if (content != null && !content.isEmpty()) {
										content = content.replace("\r\n", "<br>");
									}
									%> <%=content%> <%-- <input type="text" id="rNum<%=i %>" disabled="disabled" style="width: 90%" value="<%=vo.getrContent() %>">
							 --%> <%
 if (Integer.toString(vo.getmNo()).equals(mNo)) {
 %><br><a class="delete" href="../reply/replyDel.jsp?pNo=<%=pNo%>&rNo=<%=vo.getrNo()%>">삭제</a>

									<%
									}
									if (mNo != null && Integer.parseInt(mNo) == sellerNo) {
									if ((vo.getmNo() != sellerNo) && saleflag.equals("N")) {
									%> <a href="updateSale.jsp?pNo=<%=pNo%>&mNo=<%=vo.getmNo()%>">판매처리</a>
									<%
									}
									}
									%>
								</td>



							</tr>
							<%
							}
							%>

						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>
<jsp:include page="../main/bottom.jsp" />