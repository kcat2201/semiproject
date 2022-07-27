<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//저장된 아이디(쿠키)
String ck_value = "";
Cookie[] ckArr = request.getCookies();
if (ckArr != null) {
	for (int i = 0; i < ckArr.length; i++) {
		if (ckArr[i].getName().equals("ck_mId")) {
	ck_value = ckArr[i].getValue();
	break;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="../css/registerMem.css" type="text/css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body class="membership">
	<div class="membership__wrap">
		<header>
			<div class="membership__top-logo"></div>
			<h2>로그인</h2>
		</header>
		<section class="membership__sec">
			<div class="loginForm">
				<form name="frmLogin" id="frmLogin" method="post"
					action="login_ok.jsp">
					<div>
						<div class="membership-input__wrap">
							<input type="email" id="mId" name="mId"
								class="membership-input__input"
								placeholder="아이디(someone@example.com)" required autofocus
								value="<%=ck_value%>">
						</div>
						<div class="membership-input__wrap">
							<input type="password" id="mPwd" name="mPwd"
								class="membership-input__input" placeholder="비밀번호" required>
						</div>
						<div>
							<input type="submit" class="membership-input__input login-button"
								id="login" value="로그인">
						</div>
					</div>
					<div class="login-member__util">
						<div>
							<input type="checkbox" id="chkSaveId" name="chkSaveId"
								<%if (ck_value != null && !ck_value.isEmpty()) {%>
								checked="checked" <%}%>> <label for="chkSaveId"
								class="">아이디 저장하기</label>
						</div>
						<div>
							<ul class="login-member__util__list">
								<li class="login-member__util__item"><a href="#"
									id="searchId" title="새창">&nbsp;아이디 찾기&nbsp;</a></li>
								<li class="login-member__util__item"><a href="#"
									id="searchPwd" title="새창">&nbsp;비밀번호 찾기&nbsp;</a></li>
								<li class="login-member__util__item"><a
									href="../member/registerMem.jsp" class="">&nbsp;회원가입&nbsp;</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>
