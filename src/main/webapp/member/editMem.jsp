<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@ include file="../main/top.jsp"--%>	

<jsp:useBean id="memService"
	class="com.salguMarket.member.model.MemberService" scope="session"></jsp:useBean>
<%
	String mId = (String)session.getAttribute("mId");
	//String mId = "k@k";	//테스트용
	
	MemberVO memVo = null;
	try {
		memVo = memService.selectById(mId);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	String mPwd = "";
	String mName = memVo.getmName();
	String mNick= memVo.getmNick();
	String mHp= memVo.getmHp();
	String mZip= memVo.getmZip();
	String mAdd1= memVo.getmAdd1();
	String mAdd2= memVo.getmAdd2();
	String mPwdHint= memVo.getmPwdHint();
	String mPwdAns= memVo.getmPwdAns();
	
	//null 화면표시 안되게
	if(mId==null){
		mId="";
	}	
	if(mName==null){
		mName="";
	}	
	if(mNick==null){
		mNick="";
	}	
	if(mHp==null){
		mHp="";
	}	
	if(mZip==null){
		mZip="";
	}	
	if(mAdd1==null){
		mAdd1="";
	}	
	if(mAdd2==null){
		mAdd2="";
	}	
	if(mPwdAns==null){
		mPwdAns="";
	}
	
	String opt1="기억에 남는 추억의 장소는?";
	String opt2="자신의 인생 좌우명은?";
	String opt3="자신의 보물 제1호는?";
	String opt4="가장 기억에 남는 선생님 성함은?";
	String opt5="추억하고 싶은 날짜가 있다면?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link rel="stylesheet" href="../css/registerMem2.css" type="text/css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
$(function() {
	$('form[name=frmEdit]').submit(function() {
		
		
		if ($.trim($("#mPwd").val()).length < 1) {
			alert("비밀번호를 입력하세요!");
			$("#mPwd").focus();
			event.preventDefault();
		}else if ($("#mPwd").val() != $("#mPwd2").val()) {
			alert("비밀번호가 일치하지 않습니다!");
			$("#mPwd2").focus();
			event.preventDefault();
		}else if ($.trim($("#mName").val()).length < 1) {
			alert("이름을 입력하세요!");
			$("#mName").focus();
			event.preventDefault();
		}else if ($.trim($("#mNick").val()).length < 1) {
			alert("닉네임을 입력하세요!");
			$("#mName").focus();
			event.preventDefault();
		}else if ($.trim($("#mHp").val()).length < 1) {
			alert("전화번호를 입력하세요!");
			$("#mName").focus();
			event.preventDefault();
		}else if (!validate_mHp($('#mHp').val())) {
			alert("'-'없이 숫자만 입력하세요!");
			$("#mHp").focus();
			event.preventDefault();	
		}
	});
});
</script>
</head>
<body class="membership">
	<div class="membership__wrap">
		<header>
			<div class="membership__top-logo"></div>
		</header>
		<section class="membership__sec">
			<div class="membershipForm">
				<form name="frmEdit" id="frmEdit" method="post" action="editMem_ok.jsp">
					<div class="membership-input">
						<label for="mId" class="membership-input__label">아이디<strong
							class="notice">필수</strong></label>
						<!-- input__wrap: 관련 input 태그 한 줄에 -->
						<div class="membership-input__wrap">
							<!-- input__input: 개별 input 태그 -->
							<input type="email" id="editmId" name="editmId"
								class="membership-input__input"
								style="ime-mode: disabled" readonly
								value="<%=mId%>">
						</div>
					</div>
					<div class="membership-input">
						<label for="mPwd" class="membership-input__label">비밀번호변경<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="password" id="mPwd" name="mPwd"
								class="membership-input__input"
								placeholder="숫자,문자,특수문자 조합 8~15자리" maxlength="15">
						</div>
					</div>
					<div class="membership-input">
						<label for="mPwd2" class="membership-input__label">비밀번호변경확인<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="password" id="mPwd2" name="mPwd2"
								class="membership-input__input" maxlength="15" >
						</div>
					</div>
					<div class="membership-input">
						<label for="mName" class="membership-input__label">이름<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="text" id="mName" name="mName"
								class="membership-input__input"
								value="<%=mName %>">
						</div>
					</div>
					<div class="membership-input">
						<label for="mNick" class="membership-input__label">닉네임<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="text" id="mNick" name="mNick" maxlength="10"
								class="membership-input__input"
								value="<%=mNick %>">
							<input type="button" id="btnChkNick" class="membership-input__btn"
								value="중복확인" title="새창" />
							<input type="hidden" id="chkNick" name="chkNick" />
						</div>
					</div>
					<div class="membership-input">
						<label for="mHp" class="membership-input__label">HP<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="text" id="mHp" name="mHp"
								class="membership-input__input" maxlength="11"
								placeholder="'-'없이 번호만 입력하세요" required
								value="<%=mHp %>">
						</div>
					</div>
					<div class="membership-input">
						<label for="mZip" class="membership-input__label">주소<strong
							class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="text" id="mZip" name="mZip"
								class="membership-input__input" 
								placeholder="주소의 동(읍/면)을 입력하세요"	readonly required
								value="<%=mZip %>">
							<input type="button" id="btnZipcode" class="membership-input__btn" 
								value="주소찾기" title="새창" />
						</div>
					</div>
					<!-- 기본주소 -->
					<div class="membership-input">
						<div class="membership-input__wrap">
							<input type="text" id="mAdd1" name="mAdd1"
								class="membership-input__input"  readonly
								value="<%=mAdd1 %>">
						</div>
					</div>
					<!-- 상세주소 -->
					<div class="membership-input">
						<div class="membership-input__wrap">
							<input type="text" id="mAdd2" name="mAdd2"
								class="membership-input__input" placeholder="나머지 주소를 입력하세요"
								value="<%=mAdd2 %>">
						</div>
					</div>
					<div class="membership-input">
						<label for="mPwdHint" class="membership-input__label">비밀번호찾기
							질문<strong class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<select id="mPwdHint" name="mPwdHint"
								class="membership-input__input" required>
								<option value="<%=opt1 %>" 
									<%if (mPwdHint.equals(opt1)) {%>
										selected="selected"<%} %>
								>기억에 남는 추억의 장소는?</option>
								<option value="<%=opt2 %>" 
									<%if (mPwdHint.equals(opt2)) {%>
										selected="selected" <%} %>>자신의 인생 좌우명은?</option>
								<option value="<%=opt3 %>" 
									<%if  (mPwdHint.equals(opt3)) {%>
										selected="selected" <%} %>>자신의 보물 제1호는?</option>
								<option value="<%=opt4 %>" 
									<%if  (mPwdHint.equals(opt4)) {%>
										selected="selected" <%} %>>가장 기억에 남는 선생님 성함은?</option>
								<option value="<%=opt5 %>" 
									<%if  (mPwdHint.equals(opt5)) {%>
										selected="selected" <%}%>>추억하고 싶은 날짜가 있다면?</option>
							</select>
						</div>
					</div>
					<div class="membership-input">
						<label for="mPwdAns" class="membership-input__label">비밀번호찾기
							답변<strong class="notice">필수</strong></label>
						<div class="membership-input__wrap">
							<input type="text" id="mPwdAns" name="mPwdAns"
								class="membership-input__input" required
								value="<%=mPwdAns%>"><br><br>
						</div>
					</div>
					<div class="membership-input__submit">
						<input type="submit" id="btnJoin" class="membership-input__btn" value="정보수정">
						<input type="reset" id="btnCancle" value="취소">
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>











