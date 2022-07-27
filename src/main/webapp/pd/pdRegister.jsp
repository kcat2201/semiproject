<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top2.jsp" %>
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.category.model.CategoryVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%

List<CategoryVO> category100 = null;
List<CategoryVO> category200 = null;
List<CategoryVO> category300 = null;
List<CategoryVO> category400 = null;
List<CategoryVO> category500 = null;
List<CategoryVO> category600 = null;
List<CategoryVO> category700 = null;
try {
	category100 = Utility.selectCategory("100");
	category200 = Utility.selectCategory("200");
	category300 = Utility.selectCategory("300");
	category400 = Utility.selectCategory("400");
	category500 = Utility.selectCategory("500");
	category600 = Utility.selectCategory("600");
	category700 = Utility.selectCategory("700");

} catch (SQLException e) {
	e.printStackTrace();
}
%>
<!-- <div class="container"> -->
<script type="text/javascript" src="../js/pdregister.js"></script>
<script type="text/javascript">
	$(function(){
		var mid=<%=session.getAttribute("mId")%>;
		if(mid==null||mid.isEmpty()){
			alert('로그인을 하셔야 합니다');
			location.href="../pd/pdlist.jsp";
			event.preventDefault();
		}
	});
</script>
<link rel="stylesheet" href="../css/register.css">
	<div class="title">
		<h2>
			| 기본정보 | <span class="red"> *필수항목</span>
		</h2>
		<br>
		<hr>
	

	<form class="reg" method="post" action="pdRegister_ok.jsp"
		encType="multipart/form-data">
		<div class="row mb-3">
			<label for="mg" class="col-sm-2 col-form-label">상품이미지<span
				class="red">*</span></label>
			<div class="col-sm-10">
				<div class="input-group mb-3">
					<!-- <img id="upload" src="../img/upload.png" style="width: 200px;height: 200px"> -->
					<input type="file" class="form-control" id="upfile" name="upfile">
					<!-- <label class="input-group-text" for="inputGroupFile02">등록</label> -->
				</div>
				<!-- <img src="images/upload.png" width="180px" height="180px"> -->
				<p class="blue">
					<b>* 상품 이미지는 400*400에 최적화 되어 있습니다.</b><br> - 상품 이미지는
					PC에서는 1:1 비율로 보여집니다.<br> - 이미지는 상품 등록 시 정사각형으로
					잘려서 등록됩니다.<br> - 큰 이미지일 경우 이미지가 깨지는 경우가
					발생할 수 있습니다.<br> 최대 지원 사이즈인 400 * 400으로 리사이즈 해서 올려주세요.(이미지 최대
					10M).
				</p>

			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="pTitle" class="col-sm-2 col-form-label">상품명<span
				class="red">*</span></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="상품명을 입력해주세요."
					id="pTitle" name="pTitle">
			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="category" class="col-sm-2 col-form-label">카테고리<span
				class="red">*</span></label>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-4">
						<div class="list-group" id="list-tab" role="tablist">
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode100" data-bs-toggle="list"
								href="#list-cCode100" role="tab" aria-controls="list-cCode100" onClick="changeCode(100)">전자기기</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode200" data-bs-toggle="list"
								href="#list-cCode200" role="tab" aria-controls="list-cCode200" onClick="changeCode(200)">생활용품</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode300" data-bs-toggle="list"
								href="#list-cCode300" role="tab" aria-controls="list-cCode300" onClick="changeCode(300)">운동기구</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode400" data-bs-toggle="list"
								href="#list-cCode400" role="tab" aria-controls="list-cCode400" onClick="changeCode(400)">뷰티/미용</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode500" data-bs-toggle="list"
								href="#list-cCode500" role="tab" aria-controls="list-cCode500" onClick="changeCode(500)">의류</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode600" data-bs-toggle="list"
								href="#list-cCode600" role="tab" aria-controls="list-cCode600" onClick="changeCode(600)">도서</a>
							<a class="list-group-item list-group-item-action"
								id="list-group-cCode700" data-bs-toggle="list"
								href="#list-cCode700" role="tab" aria-controls="list-cCode700" onClick="changeCode(700)">가방</a>

						</div>
					</div>
					<div class="col-8">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade" id="list-cCode100" role="tabpanel"
								aria-labelledby="list-group-cCode100">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category100.size(); i++) {
									%>
									<option value="<%=category100.get(i).getcCode()%>"><%=category100.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode200" role="tabpanel"
								aria-labelledby="list-group-cCode200">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category200.size(); i++) {
									%>
									<option value="<%=category200.get(i).getcCode()%>"><%=category200.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode300" role="tabpanel"
								aria-labelledby="list-group-cCode300">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category300.size(); i++) {
									%>
									<option value="<%=category300.get(i).getcCode()%>"><%=category300.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode400" role="tabpanel"
								aria-labelledby="list-group-cCode400">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category400.size(); i++) {
									%>
									<option value="<%=category400.get(i).getcCode()%>"><%=category400.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode500" role="tabpanel"
								aria-labelledby="list-group-cCode500">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%"><option selected
										disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category500.size(); i++) {
									%>
									<option value="<%=category500.get(i).getcCode()%>"><%=category500.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode600" role="tabpanel"
								aria-labelledby="list-group-cCode600">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category600.size(); i++) {
									%>
									<option value="<%=category600.get(i).getcCode()%>"><%=category600.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="tab-pane fade" id="list-cCode700" role="tabpanel"
								aria-labelledby="list-group-cCode700">
								<select class="form-select" aria-label="Default select example"
									style="width: 40%">
									<option selected disabled="disabled" value="none">하위카테고리</option>
									<%
									for (int i = 0; i < category700.size(); i++) {
									%>
									<option value="<%=category700.get(i).getcCode()%>"><%=category700.get(i).getcName()%></option>
									<%
									}
									%>

								</select>
							</div>

						</div>
						
					</div>
				</div>

			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="price" class="col-sm-2 col-form-label">상품가격<span
				class="red">*</span></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="가격을 입력해주세요."
					id="price" name="price" style="width: 50%">
			</div>
		</div>
		<hr>

		<div class="row mb-3">
			<label for="detail" class="col-sm-2 col-form-label">상품설명<span
				class="red">*</span></label>
			<div class="col-sm-10">
				<textarea class="form-control" placeholder="상품 설명을 입력해주세요."
					id="detail" name="detail" style="height: 100px"></textarea>
				<!-- <label for="floatingTextarea2"></label> -->
			</div>
		</div>
		<hr>
		<div class="buttons">
			<button type="button" class="btn btn-secondary" id="btncan" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary" id="btnreg">등록</button>
		</div>
		<input type="hidden" id="cCode" name="cCode" />
	</form>
	</div>

<jsp:include page="../main/bottom.jsp"/>

