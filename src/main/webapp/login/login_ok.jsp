<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.member.model.MemberVO"%>
<%@page import="com.salguMarket.member.model.MemberService"%>
<%@page import="com.salguMarket.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok</title>
</head>
<body>
<jsp:useBean id="memService" class="com.salguMarket.member.model.MemberService"
	scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.salguMarket.member.model.MemberVO"
	scope="session"></jsp:useBean>
<%
	//login.jsp... method=post
	request.setCharacterEncoding("utf-8");
	String mId= request.getParameter("mId");
	String mPwd= request.getParameter("mPwd");
	String chkSaveId= request.getParameter("chkSaveId");
	
	//아이디로 회원 정보 불러오기
	memVo = memService.selectById(mId);
	String mNo=Integer.toString(memVo.getmNo());//추가
	String mName = memVo.getmName();
	String mNick= memVo.getmNick();
	String mHp= memVo.getmHp();
	String mZip= memVo.getmZip();
	String mAdd1= memVo.getmAdd1();
	String mAdd2= memVo.getmAdd2();
	String mPwdHint= memVo.getmPwdHint();
	String mPwdAns= memVo.getmPwdAns();
	
	String msg="로그인 실패!", url="login.jsp";
	try{
		int result = memService.checkLogin(mId, mPwd);
		
		if(result==MemberService.LOGIN_OK){
			memVo=memService.selectById(mId);
			
			//세션(로그인 정보)
			session.setAttribute("mId", mId);
			session.setAttribute("mNo",mNo); //추가
			session.setAttribute("mPwd", mPwd);
			session.setAttribute("mName", mName);
			session.setAttribute("mNick", mNick);
			session.setAttribute("mHp", mHp);
			session.setAttribute("mZip", mZip);
			session.setAttribute("mAdd1", mAdd1);
			session.setAttribute("mAdd2", mAdd2);
			session.setAttribute("mPwdHint", mPwdHint);
			session.setAttribute("mPwdAns", mPwdAns);
			
			//쿠키
			Cookie ck = new Cookie("ck_mId",mId);
			ck.setPath("/");
			if(chkSaveId!=null){//'아이디 저장' 체크
				ck.setMaxAge(24*60*60);
				response.addCookie(ck);
			}else{
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg=mName + " 님 로그인되었습니다.";
			url="../pd/pdlist.jsp";
		}else if(result==MemberService.DISAGREE_PWD){
			msg="비번이 일치하지 않아요!";			
		}else if(result==MemberService.NONE_ID){
			msg="해당 아이디가 존재하지 않아요!";			
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg",msg);
	request.setAttribute("url",url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>

