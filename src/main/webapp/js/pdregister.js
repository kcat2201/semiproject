/**
 * pdRegister.jsp
 */

	$(function() {
				if($('#saleflag').val()=='N'){
			$('#btFlag').css({'background-color':'#FD8A69','border-color':'#FD8A69'}).text('구매가능');
		}else{
			$('#btFlag').css({'background-color':'gray','border-color':'gray'}).text('판매완료');
		}
		
		$("#btReply").click(function(){
			if ($.trim($("#rContent").val()).length == 0) {
				alert('내용을 입력하세요');
				$("#rContent").focus();
				event.preventDefault();
			}else{
			location.href="../reply/reply_ok.jsp?pNo=<%=pNo%>";}
		});
		$("#btPdEdit").click(function(){
			location.href="pdEdit.jsp?pNo=<%=pNo%>";
		});
		$("#btPdDel").click(function(){
			
			if(confirm('삭제하시겠습니까?')){
				location.href="pdDelete.jsp?pNo=<%=pNo%>&fileName=<%=fileName%>";
			}
			
		});
		$("#btnreg").click(function() {
							if ($.trim($("#upfile").val()).length == 0) {
								alert('파일을 선택하세요');
								$("#upfile").focus();
								event.preventDefault();
							} else if ($.trim($("#pTitle").val()).length == 0) {
								alert('상품명을 입력하세요');
								$("#pTitle").focus();
								event.preventDefault();
							} else if ($('#cCode').val().length==0||$('#cCode').val()%100==0) {
								alert('카테고리를 선택하세요');
								event.preventDefault();
							} else if ($.trim($("#price").val()).length == 0) {
								alert('가격을 입력하세요');
								$("#price").focus();
								event.preventDefault();
							} else if (!validate_price($("#price").val())) {
								alert("가격은 숫자만 가능합니다");
								$("#price").focus();
								event.preventDefault();
							} else if ($.trim($("#detail").val()).length == 0) {
								alert('상품설명을 입력하세요');
								$("#detail").focus();
								event.preventDefault();
							}
							
						
		}); 
		$('.form-select').change(function() {
			$('#cCode').val($(this).find('option:selected').val()); 
			
		});
		
		
	}); 

	function changeCode(code){
		$('#cCode').val(code); 
	}

	
	function validate_price(price) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(price); //정규식과 일치하면 true
	}
