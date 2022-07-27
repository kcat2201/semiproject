<%@ include file="../main/top2.jsp"%>
<link rel="stylesheet" href="../css/write.css" type="text/css">
<%@page import="com.salguMarket.nboard.model.NboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.salguMarket.nboard.model.NboardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nService"
	class="com.salguMarket.nboard.model.NboardService" scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="../smarteditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content", //textarea에서 지정한 id와 일치해야 합니다.

			sSkinURI : '<c:url value="/smarteditor2/SmartEditor2Skin.html" />',
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["content"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#btsave").click(function() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});

		$('form[name=form1]').submit(function() {
			$('.form-control').each(function(idx, item) {
				if ($.trim($(this).val()).length < 1) {
					alert($(this).prev().text() + '을(를) 입력하세요!');
					event.preventDefault();
					return false;
				}
			});
		});

	});
</script>
<title>공지사항</title>
<section>
	<article>
		<div class="container" style="padding-bottom: 350px;">
			<h2>글쓰기</h2>
			<hr>
			<form name="form1" id="form1" method="post" action="write2_ok.jsp"
				enctype="multipart/form-data">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="nTitle" id="nTitle"
						placeholder="제목을 입력해 주세요">
				</div>
				<hr>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea>
				</div>
				<hr>
				<div class="mb-3">
					<label for="upfile">첨부파일</label> <input type="file" id="upfile"
						name="upfile" /> <span>(최대 10M)</span>
				</div>
				<hr>
				<div>
					<input type="submit" value="저장" class="save" id="btsave"> <input
						type="button" value="목록" class="list" id="btlist2"
						onclick="location.href='list2.jsp'">
				</div>
			</form>
		</div>
	</article>
</section>
<%@ include file="../main/bottom.jsp"%>