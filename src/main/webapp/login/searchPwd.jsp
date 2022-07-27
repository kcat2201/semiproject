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
//아이디 검색
String mId = request.getParameter("mId");
//비밀번호답변(입력값)
String mPwdAns2 = request.getParameter("mPwdAns2");

int result = 0;
if (mId != null && !mId.isEmpty()) {
	result = memService.duplicateId(mId);
}

MemberVO memVo = null;
try {
	memVo = memService.selectById(mId);
} catch (SQLException e) {
	e.printStackTrace();
}

//등록된 회원정보
String mPwdHint = memVo.getmPwdHint();
String mPwdAns = memVo.getmPwdAns();
String mPwd = memVo.getmPwd();

if (mId == null) {
	mId = "";
}
if (mPwdHint == null) {
	mPwdHint = "";
}
if (mPwdAns2 == null) {
	mPwdAns2 = "";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function() {
		//비밀번호찾기_아이디 찾기
		$('#searchId2').click(function() {
			if ($.trim($("#mId").val()).length < 1) {
				alert("아이디를 입력하세요!");
				event.preventDefault();
			}
		});

		$('#btnSubmit').click(function() {
			//비밀번호찾기_(최종)확인버튼
			if ($.trim($('#mPwdAns2').val()) != $.trim($('#mPwdAns').val())) {
				alert("답변이 틀렸습니다. 가입정보를 확인해주세요.");
				$("#mPwdAns2").focus();
				event.preventDefault();
			}else {
				alert("비밀번호는 <%=mPwd %> 입니다.");
				event.preventDefault();
				self.close();
			}
		});
		
	});
</script>
</head>
<body class="check">
	<h3>비밀번호 찾기</h3>
	<form name="frmSearchPwd" id="frmSearchPwd" method="post"
		action="searchPwd.jsp">
		<!--아이디 입력  -->
		<input type="text" name="mId" id="mId" title="아이디입력"
			placeholder="아이디를 입력하세요" class="searchbar"
			style="ime-mode: disabled" value="<%=mId%>"> 
		<input type="submit" id="searchId2" class="button" value="찾기"><br>
		<!--사용가능=>미가입  -->
		<%
		if (result == MemberService.USABLE_ID) {
		%>
		<p class="red bold">존재하지 않는 계정입니다.
			<br>다른 아이디를 입력하세요.</p>
		<%
		} else if (result == MemberService.UNUSABLE_ID) {
		%>
		<div class="">
			<label for="mPwdHint" class="">비밀번호찾기 질문</label>
			<div class="">
				<input type="text" name="mPwdHint" id="mPwdHint" title="비밀번호찾기질문"
					readonly class="searchbar" value="<%=mPwdHint%>">
			</div>
		</div>
		<div class="">
			<label for="mPwdAns2" class="">비밀번호찾기 답변</label>
			<div class="">
				<input type="text" id="mPwdAns2" name="mPwdAns2" 
					placeholder="답변을 입력하세요" class="searchbar" value="<%=mPwdAns2%>"><br>
				<br>
			</div>
			<input type="hidden" id="mPwdAns" name="mPwdAns" value="<%=mPwdAns%>">
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



