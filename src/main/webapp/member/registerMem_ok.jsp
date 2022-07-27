<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMem_ok</title>
</head>
<body>
<jsp:useBean id="memService" class="com.salguMarket.member.model.MemberService"
   scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.salguMarket.member.model.MemberVO"
   scope="page"></jsp:useBean>

<%
   request.setCharacterEncoding("utf-8");

   String mId = request.getParameter("mId");
   String mPwd = request.getParameter("mPwd");
   String mName = request.getParameter("mName");
   String mNick = request.getParameter("mNick");
   String mHp = request.getParameter("mHp");
   String mZip = request.getParameter("mZip");
   String mAdd1 = request.getParameter("mAdd1");//기본주소
   String mAdd2 = request.getParameter("mAdd2");//상세주소
   String mPwdHint = request.getParameter("mPwdHint");
   String mPwdAns = request.getParameter("mPwdAns");
  	 //Agreement는 skip
   
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
   
   String msg = "가입실패! 정보를 다시 확인해주세요";
   String url = "registerMem.jsp";
   
   Cookie ck = new Cookie("ck_mId",mId);
   ck.setPath("/");
   
   try {
      int cnt = memService.insertMember(memVo);
      if(cnt>0) {
         msg = "회원가입되었습니다.";
         url = "../login/login.jsp";//로그인페이지로         
   	  	ck.setMaxAge(30*60);
		response.addCookie(ck);
      }      
   }catch(SQLException e) {
      e.printStackTrace();
   }
   
   request.setAttribute("msg", msg);
   request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>

</body>
</html>