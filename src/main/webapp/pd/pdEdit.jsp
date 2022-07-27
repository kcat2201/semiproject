<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/top2.jsp" %> <!-- 추가 -->
<%@page import="com.salguMarket.common.Utility"%>
<%@page import="com.salguMarket.category.model.CategoryVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>


<jsp:useBean id="pdService" class="com.salguMarket.pd.model.PdService"
	scope="session"></jsp:useBean>
<jsp:useBean id="pdVo" class="com.salguMarket.pd.model.PdVO"
	scope="page"></jsp:useBean>
<%
List<CategoryVO> category100 = null;
List<CategoryVO> category200 = null;
List<CategoryVO> category300 = null;
List<CategoryVO> category400 = null;
List<CategoryVO> category500 = null;
List<CategoryVO> category600 = null;
List<CategoryVO> category700 = null;
String pNo=request.getParameter("pNo");
try {
	category100 = Utility.selectCategory("100");
	category200 = Utility.selectCategory("200");
	category300 = Utility.selectCategory("300");
	category400 = Utility.selectCategory("400");
	category500 = Utility.selectCategory("500");
	category600 = Utility.selectCategory("600");
	category700 = Utility.selectCategory("700");
	pdVo = pdService.selectByNo(Integer.parseInt(pNo));

} catch (SQLException e) {
	e.printStackTrace();
}

String pTitle = pdVo.getpTitle();
String cCode = pdVo.getcCode();
//System.out.println("49번째줄 cCode="+cCode);
int price = pdVo.getPrice();
String detail = pdVo.getDetail();
/* if (detail != null && !detail.isEmpty()) {
	detail = detail.replace("\r\n", "<br>");
} */
String originFileName = pdVo.getOriginalFilename();
String fileName = pdVo.getFileName();
if (fileName == null)
	fileName = "";
System.out.println(pdVo);
%>
<link rel="stylesheet" href="../css/register.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/pdregister.js"></script>
<script type="text/javascript">
	$(function(){
		
		var cnoref=Math.floor(<%=cCode%>/100)*100;
		var sel1='#list-group-cCode'+cnoref;
		var sel2='#list-cCode'+cnoref;
		
		$(sel1).addClass('active');
		$(sel2).addClass('show active');
		
		$("option[value='<%=cCode%>']").attr('selected', 'selected');
		
		$('.form-select').change(function() {
			$('#cCode').val($(this).find('option:selected').val()); 
			
		});
		$('#btncancel').click(function() {
			history.back();
		});
	});
</script>

	<div class="pdEditPage">
	
				
		<h2>
			| 상품정보수정 | <span class="red"> *필수항목</span>
		</h2>
		<br>
		<hr>
	
		<%
		/* String saveDir=Utility.TEST_PATH+"\\"+originFileName;
		System.out.println("saveDir="+saveDir); */
		String path="../pds_upload/"+originFileName;
		%>
		
		<form class="reg" method="post" action="pdEdit_ok.jsp" encType="multipart/form-data">
			<input type="hidden" name="pNo" value="<%=pdVo.getpNo() %>" />
	<input type="hidden" id="cCode" name="cCode" value="<%=cCode%>">
	<input type="hidden" name="oldFileName" value="<%=fileName %>" />
			<div class="row mb-3">
				<label for="mg" class="col-sm-2 col-form-label">상품이미지<span
					class="red">*</span></label>
				<div class="col-sm-10">
				<span style="color: red;font-weight: bold">첨부파일을 새로 저장할 경우 기존 파일은 삭제됩니다.</span><br><br>
				
				<img src="<%=path %>" style="width: 200px;height: 200px;margin-bottom: 10px"> 
				<!-- <img src="../pds_upload/5.jpg" style="width: 200px;height: 200px;margin-bottom: 10px"> -->
					<div class="input-group mb-3">

						
						<!-- <img id="upload" src="../img/upload.png" style="width: 200px;height: 200px"> -->
						<input type="file" class="form-control" id="upfile" name="upfile">
						<!-- <label class="input-group-text" for="inputGroupFile02">등록</label> -->
					</div>
					<!-- <img src="images/upload.png" width="180px" height="180px"> -->
					<p class="blue">
						<b>* 상품 이미지는 500*500에 최적화 되어 있습니다.</b><br> - 상품 이미지는
					PC에서는 1:1 비율로 보여집니다.<br> - 이미지는 상품 등록 시 정사각형으로
					잘려서 등록됩니다.<br> - 큰 이미지일 경우 이미지가 깨지는 경우가
					발생할 수 있습니다.<br> 최대 지원 사이즈인 500 * 500으로 리사이즈 해서 올려주세요.(이미지 최대
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
						id="pTitle" name="pTitle" value="<%=pTitle%>">
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
									href="#list-cCode100" role="tab" aria-controls="list-cCode100">전자기기</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode200" data-bs-toggle="list"
									href="#list-cCode200" role="tab" aria-controls="list-cCode200">생활용품</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode300" data-bs-toggle="list"
									href="#list-cCode300" role="tab" aria-controls="list-cCode300">운동기구</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode400" data-bs-toggle="list"
									href="#list-cCode400" role="tab" aria-controls="list-cCode400">뷰티/미용</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode500" data-bs-toggle="list"
									href="#list-cCode500" role="tab" aria-controls="list-cCode500">의류</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode600" data-bs-toggle="list"
									href="#list-cCode600" role="tab" aria-controls="list-cCode600">도서</a>
								<a class="list-group-item list-group-item-action"
									id="list-group-cCode700" data-bs-toggle="list"
									href="#list-cCode700" role="tab" aria-controls="list-cCode700">가방</a>

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
						id="price" name="price" style="width: 50%" value="<%=price%>">
				</div>
			</div>
			<hr>

			<div class="row mb-3">
				<label for="detail" class="col-sm-2 col-form-label">상품설명<span
					class="red">*</span></label>
				<div class="col-sm-10">
					<textarea class="form-control" placeholder="상품 설명을 입력해주세요."
						id="detail" name="detail" style="height: 100px"><%=detail%></textarea>
					<!-- <label for="floatingTextarea2"></label> -->
				</div>
			</div>
			<hr>
			<div class="buttons">
				<button type="button" class="btn btn-secondary" id="btncancel" onclick="history.back()">취소</button>
				<button type="submit" class="btn btn-primary" id="btnedit"
					style="background-color: #FD8A69; border-color: #FD8A69">수정</button>
			</div>
			
		</form>
		</div>
<jsp:include page="../main/bottom.jsp" />