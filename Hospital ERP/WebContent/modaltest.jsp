<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/test.css?after" rel="stylesheet">
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
<title>Insert title here</title>
</head>
<body>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  추우가아버어트은
</button>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xl modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	            <table class="table tablemodal" page="main_ins_modal">
					<tbody>
						<div class="delete_please">
							<tr>
								<td>품명</td>
								<td><input type="text" placeholder="품명" ></td>
								<td>카테고리</td>
								<td><input type="text" placeholder="카테고리"></td>
								<td>단위</td>
								<td><input type="text" placeholder="단위"></td>
								<td>재고량</td>
								<td><input type="text" placeholder="재고량" ></td>
								
							</tr>
							<tr>
								<td>유통기한</td>
								<td><input type="text" placeholder="유통기한" ></td>
								<td>물품단가</td>
								<td><input type="text" placeholder="물품단가"></td>
								<td>비고</td>
								<td><input type="text" placeholder="비고" ></td>
								<td>
									<button class="btn btn-danger itemDelBtn" onClick="itemDelBtnHandler(event)">
							    	 X
							   		</button>
								</td>
							</tr>
						</div>
					</tbody>
			    </table>

			    <button type="button" class="btn btn-secondary" id="addItem" onClick="tableAddBtnHandler()">
			      항목추가
			    </button>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">등록</button>
	      </div>
	    </div>
	  </div>
	</div>

<script type="text/javascript">
function itemDelBtnHandler(event) {
	  const select_row = $(event.target).closest('tr');
	  const front_row = select_row.prev('tr');
	  select_row.add(front_row).remove();
	}

function tableAddBtnHandler() {
	document.querySelector("table[page='main_ins_modal'] > tbody").appendChild(itemTableElement());
}

function itemTableElement() {
	const tbody = document.querySelector("tbody");
	tbody.innerHTML += `
	<div>	
		<tr>
			<td>품명</td>
			<td><input type="text" placeholder="품명" ></td>
			<td>카테고리</td>
			<td><input type="text" placeholder="카테고리"></td>
			<td>단위</td>
			<td><input type="text" placeholder="단위"></td>
			<td>재고량</td>
			<td><input type="text" placeholder="재고량" ></td>
			
		</tr>
		<tr>
			<td>유통기한</td>
			<td><input type="text" placeholder="유통기한" ></td>
			<td>물품단가</td>
			<td><input type="text" placeholder="물품단가"></td>
			<td>비고</td>
			<td><input type="text" placeholder="비고" ></td>
			<td>
				<button class="btn btn-danger itemDelBtn" onClick="itemDelBtnHandler(event)">
		    	 X
		   		</button>
			</td>
		</tr>
	</div>
		`
	return;
}
</script>


</body>
</html>