<%@page import="com.salguMarket.zipcode.model.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="zipcodeService"
	class="com.salguMarket.zipcode.model.ZipcodeService" scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	
	
	List<ZipcodeVO> list = null;
	if(dong!=null && !dong.isEmpty()) {
		list = zipcodeService.selectAll(dong);
	}
	if(dong==null) dong="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#searchDong').click(function(){
			if ($.trim($("#dong").val()).length < 1) {
				alert("지역명을 입력하세요!");
				event.preventDefault();
			}
		});		
	});
	
	function setZipcode(mZip, address){
		$(opener.document).find("#mZip").val(mZip);
		$(opener.document).find("input[name=mAdd1]").val(address);
		self.close();
	}
</script>
</head>
<body>
	<h2>우편번호 검색</h2>
	<form name="frmZipcode" method="post" action="zipcode.jsp">
		<input type="text" name="dong" id="dong" class="searchbar"
			placeholder="찾으시려는 주소의 동(읍/면)을 입력하세요"
			style="ime-mode: active" value="<%=dong%>"> 
		<input type="submit" id="searchDong" class="button" value="찾기">
	</form><br>
	<%if(list!=null){ %>
	<table class="zipcodebox">
		<colgroup>
			<col style="width: 20%" />
			<col style="width: *" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">우편번호</th>
				<th scope="col">주소</th>
			</tr>
		</thead>
		<tbody>
		
	<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="2">
				<p class="red bold">해당 주소가 존재하지 않습니다.</p>
			</td>
		</tr>	
	<%}else{
		for(int i=0;i<list.size();i++){
			ZipcodeVO zipVo=list.get(i);	
			String bunji=zipVo.getStartBunji();
			String endBunji=zipVo.getEndBunji();
			
			if(endBunji!=null && !endBunji.isEmpty()){
				bunji += "~" + endBunji;
			}
			
			String address=zipVo.getSido()+" " + zipVo.getGugun() +" "
				+zipVo.getDong();
			%>
			<tr>
				<td><%=zipVo.getZipcode() %></td>
				<td>
					<a href="#" onclick
			="setZipcode('<%=zipVo.getZipcode()%>','<%=address%>')">
						<%=address %> <%=bunji %>
					</a>	
				</td>
			</tr>
			<%	}//for
			}%>
		</tbody>
	</table>
	<%} %>
</body>
</html>