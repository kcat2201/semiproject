<%@page import="com.salguMarket.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editMem_ok.jsp</title>
</head>
<body>
	<%@ include file="../login/loginCheck.jsp"%>

	<jsp:useBean id="memService"
		class="com.salguMarket.member.model.MemberService" scope="session"></jsp:useBean>
	<jsp:useBean id="memVo" class="com.salguMarket.member.model.MemberVO"
		scope="page"></jsp:useBean>

	<%
	request.setCharacterEncoding("utf-8");
	String mId = (String)session.getAttribute("mId");
	//String mId = "k@k"; //테스트용

	String mPwd = request.getParameter("mPwd");
	String mName = request.getParameter("mName");
	String mNick = request.getParameter("mNick");
	String mHp = request.getParameter("mHp");
	String mZip = request.getParameter("mZip");
	String mAdd1 = request.getParameter("mAdd1");
	String mAdd2 = request.getParameter("mAdd2");
	String mPwdHint = request.getParameter("mPwdHint");
	String mPwdAns = request.getParameter("mPwdAns");

	String msg = "로그인체크 실패!", url = "editMem.jsp";
	try {
			memVo.setmId(mId);
			memVo.setmPwd(mPwd);
			memVo.setmName(mName);
			memVo.setmNick(mNick);
			memVo.setmHp(mHp);
			memVo.setmZip(mZip);
			memVo.setmAdd1(mAdd1);
			memVo.setmAdd2(mAdd2);
			memVo.setmPwdHint(mPwdHint);
			memVo.setmPwdAns(mPwdAns);

			int cnt = memService.updateMember(memVo);
			if (cnt > 0) {
				msg = "가입정보가 수정되었습니다";
				url = "../pd/pdlist.jsp";
			} else {
				msg = "정보수정에 실패하였습니다";
			}

	} catch (SQLException e) {
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>