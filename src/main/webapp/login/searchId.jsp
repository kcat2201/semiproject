<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.salguMarket.member.model.MemberService"%>
<%@page import="com.salguMarket.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memService"
	class="com.salguMarket.member.model.MemberService" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
//닉네임 검색
String mNick = request.getParameter("mNick");
//이름(입력값)
String mName2 = request.getParameter("mName2");
//전화번호(입력값)
String mHp2 = request.getParameter("mHp2");

int result = 0;
if (mNick != null && !mNick.isEmpty()) {
	result = memService.duplicateNick(mNick);
}

MemberVO memVo = null;
try {
	memVo = memService.selectByNick(mNick);
} catch (SQLException e) {
	e.printStackTrace();
}

//등록된 회원정보
String mName = memVo.getmName();
String mHp = memVo.getmHp();
String mId = memVo.getmId();

if (mNick == null) {
	mNick = "";
}
if (mName2 == null) {
	mName2 = "";
}
if (mHp2 == null) {
	mHp2 = "";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function() {
		//아이디찾기_닉네임 찾기
		$('#searchNick').click(function() {
			if ($.trim($("#mNick").val()).length < 1) {
				alert("닉네임을 입력하세요!");
				event.preventDefault();
			}
		});

		$('#btnSubmit').click(function() {
			//아이디찾기_(최종)확인버튼
			if ($.trim($('#mName').val()) == $.trim($('#mName2').val())) {
				if ($.trim($('#mHp').val()) == $.trim($('#mHp2').val())) {
					alert("아이디는 <%=mId %> 입니다.");
					event.preventDefault();
					self.close();
				}
			}else if ($.trim($("#mName2").val()).length < 1) {
				alert("이름을 입력하세요!");
				event.preventDefault();
			}else if ($.trim($("#mHp2").val()).length < 1) {
				alert("전화번호를 입력하세요!");
				event.preventDefault();
			}else{
				alert("입력정보와 일치하는 아이디가 없습니다.");
				$("#mName2").focus();
				event.preventDefault();
			}
		
		});
		
	});
</script>
</head>
<body class="check">
	<h3>아이디 찾기</h3>
	<form name="frmSearchId" id="frmSearchId" method="post"
		action="searchId.jsp">
		<!--닉네임 입력  -->
		<input type="text" name="mNick" id="mNick" title="닉네임입력"
			placeholder="닉네임을 입력하세요" class="searchbar"
			value="<%=mNick%>"> 
		<input type="submit" id="searchNick" class="button" value="찾기"><br>
		<!--사용가능=>미가입  -->
		<%
		if (result == MemberService.USABLE_NICKNAME) {
		%>
		<p class="red bold">존재하지 않는 닉네임입니다.<br>
			가입정보를 확인해주세요.</p>
		<%
		} else if (result == MemberService.UNUSABLE_NICKNAME) {
		%>
		<p class="gray bold">닉네임 확인완료</p><br>
		<div class="">
			<label for="mName2" class="">이름</label>
			<div class="">
				<input type="text" name="mName2" id="mName2" title="이름"
					placeholder="" class="searchbar" value="<%=mName2%>">
			</div>
			<input type="hidden" id="mName" name="mName" value="<%=mName%>">
		</div>
		<div class="">
			<label for="mHp2" class="">전화번호</label>
			<div class="">
				<input type="text" id="mHp2" name="mHp2" 
					placeholder="'-'없이 번호만 입력하세요" class="searchbar" value="<%=mHp2%>"><br>
				<br>
			</div>
			<input type="hidden" id="mHp" name="mHp" value="<%=mHp%>">
		</div>
			
		<div class="text-align__center" id="btnSearch">
			<input type="submit" id="btnSubmit" class="button" value="확인">
			<input type="reset" id="btnCancle2" class="button" value="취소">
		</div>
	</form>
	<%
	}
	%>
</body>
</html>



