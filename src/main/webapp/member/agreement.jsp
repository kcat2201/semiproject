<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/windowOpen.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	 $('#btnSubmit').click(function(){
        if(!$('#chkAgree').is(':checked')){
           alert('약관에 동의해야 회원가입을 진행할 수 있습니다.');
           $('#chkAgree').focus();
           event.preventDefault();
	     }else{
	        	self.close();       
        }
     });
	 
	 $('#btnCancle').click(function(){
		 alert('약관에 동의해야 회원가입을 진행할 수 있습니다.');
         $('#chkAgree').focus();
         event.preventDefault();
		 self.close();
	 });
});
</script>
<h2>회원 약관</h2>
<br>
<iframe src="provision.html" width="700px" height="300px"></iframe><br><br>
<div style="width: 700px">
	<form name="frmAgree" method="post" action="registerMem.jsp">
		<fieldset style="border: none;">
			<legend style="visibility: hidden;">회원 약관</legend>
			<div class="text-align__right">
				<input type="checkbox" name="chkAgree" id="chkAgree">
				<label for="chkAgree">약관에 동의합니다.</label>
			</div>
			<div class="text-align__center">
				<input type="submit" id="btnSubmit" class="button" value="확인"> 
				<input type="reset" id="btnCancle" class="button" value="취소">
			</div>
		</fieldset>
	</form>
</div>