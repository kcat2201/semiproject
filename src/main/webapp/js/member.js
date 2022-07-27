/**
 * member.js
 */
 
$(function(){
	var ctxPath="/salguMarket";
	//회원가입_아이디 중복확인버튼
	$('#btnChkId').click(function(){
		var id=$('#mId').val();
		open(ctxPath+"/member/checkMemberId.jsp?mId="+id,"idCheck",
		"resizable=yes,width=400,height=300,top=100,left=50");	
	});
	//회원가입_닉네임 중복확인버튼
	$('#btnChkNick').click(function(){
		var nick=$('#mNick').val();
		open(ctxPath+"/member/checkMemberNick.jsp?mNick="+nick,"nicknameCheck",
		"resizable=yes,width=400,height=300,top=100,left=50");	
	});
	//회원가입_우편번호찾기버튼
	$('#btnZipcode').click(function(){
		open(ctxPath + "/zipcode/zipcode.jsp","zipcodeSearch",
	"width=900,height=550,resizable=yes,top=100,left=50");
	});
	//회원가입_약관동의체크박스
	$('#agreement').click(function(){
		open(ctxPath+"/member/agreement.jsp","agreement",
		"width=1100,height=800,location=yes,resizable=yes,top=100,left=50");
	});
	//로그인_비밀번호찾기(a)
	$('#searchPwd').click(function(){
		open(ctxPath+"/login/searchPwd.jsp","searchPwd",
		"width=550,height=450,resizable=yes,top=100,left=50");
	});
	//로그인_아이디찾기(a)
	$('#searchId').click(function(){
		open(ctxPath+"/login/searchId.jsp","searchId",
		"width=550,height=450,resizable=yes,top=100,left=50");
	});
	//회원가입&로그인_취소버튼
	$('#btnCancle').click(function(){
		  alert("입력이 취소되었습니다.");
   		location.href="../pd/pdlist.jsp";
	});
	//아이디&비밀번호찾기_취소버튼(새창)
	$('#btnCancle2').click(function() {
			alert("입력이 취소되었습니다.");
			self.close();
	});
	
});

/*
//이메일아이디(input[type=email]로 이미 처리됨) 
function validate_mId(mId){
	var pattern = new RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
	return pattern.test(mId);
}
*/

//전화번호 
function validate_mHp(mHp){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(mHp); ;
}
