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

<!-- Modal -->
<!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
   <div class="modal-dialog modal-fullscreen" role="dialog">
    <div class="modal-content ">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
        




    <table class="table tablemodal " page="main_ins_modal">
		<tbody>
			<tr>
				<td>번호</td>
				<td><input type="text" placeholder="번호"></td>
				<td>품명</td>
				<td><input type="text" placeholder="품명" ></td>
				<td>품목코드</td>
          		<td><input type="text" placeholder="품목코드" ></td>
			</tr>
			<tr>
				<td>번호</td>
				<td><input type="text" placeholder="번호"></td>
				<td>품명</td>
				<td><input type="text" placeholder="품명" ></td>
				<td>품목코드</td>
          		<td><input type="text" placeholder="품목코드" ></td>
			</tr>
			<tr>
				<td>번호</td>
				<td><input type="text" placeholder="번호"></td>
				<td>품명</td>
				<td><input type="text" placeholder="품명" ></td>
				<td>품목코드</td>
          		<td><input type="text" placeholder="품목코드" ></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>            
					<button class="btn btn-danger stockDelBtn" onClick="stockDelBtnHandler(event)">
	             	 X
	            	</button>
            	</td>
			</tr>
		</tbody>
    </table>

    <button type="button" class="btn btn-secondary" id="addStock" onClick="stockOrderElement()">
      항목추가
    </button>
	<button type="button" class="btn btn-secondary" id="" onClick="">
     전체지우기
    </button> -->
    
    


<!-- 
	  <table class="table tablemodal " page="main_ins_modal">
      <thead>
        <tr> 
          <th>번호</th>
          <th>품명</th>
          <th>품목코드</th>
          <th>카테고리</th>
          <th>단위</th>
          <th>재고량</th>
          <th>유통기한</th>
          <th>물품단가</th>
          <th>비고</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="text" placeholder="번호" ></td>
          <td><input type="text" placeholder="품명" ></td>
          <td><input type="text" placeholder="품목코드" ></td>
          <td><input type="text" placeholder="카테고리" ></td>
          <td><input type="text" placeholder="단위" ></td>
          <td><input type="text" placeholder="재고량" ></td>
          <td><input type="text" placeholder="유통기한" ></td>
          <td><input type="text" placeholder="물품단가" ></td>
          <td>
            <input type="text" placeholder="비고" >
            <button class="btn btn-danger stockDelBtn" onClick="stockDelBtnHandler(event)">
              X
            </button>
          </td>
        </tr>
      </tbody>
    </table> -->
<!-- 


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">추가</button>
      </div>
    </div>
  </div>
</div> -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xl modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	            <table class="table tablemodal " page="main_ins_modal">
					<tbody>
						<tr>
							<td>품명</td>
							<td><input type="text" placeholder="품명" ></td>
							<td>품목코드</td>
			          		<td><input type="text" placeholder="품목코드" ></td>
						</tr>
						<tr>
							<td>번호</td>
							<td><input type="text" placeholder="번호"></td>
							<td>품명</td>
							<td><input type="text" placeholder="품명" ></td>
							<td>품목코드</td>
			          		<td><input type="text" placeholder="품목코드" ></td>
						</tr>
						<tr>
							<td>번호</td>
							<td><input type="text" placeholder="번호"></td>
							<td>품명</td>
							<td><input type="text" placeholder="품명" ></td>
							<td>품목코드</td>
			          		<td><input type="text" placeholder="품목코드" ></td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>            
								<button class="btn btn-danger stockDelBtn" onClick="stockDelBtnHandler(event)">
				             	 X
				            	</button>
			            	</td>
						</tr>
					</tbody>
			    </table>

			    <button type="button" class="btn btn-secondary" id="addStock" onClick="stockOrderElement()">
			      항목추가
			    </button>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Understood</button>
	      </div>
	    </div>
	  </div>
	</div>

<script type="text/javascript">
function stockDelBtnHandler(event) {
	event.target.parentElement.parentElement.remove();
}

function stockOrderBtnHandler() {
	document.querySelector("table[page='main_ins_modal'] > tbody").appendChild(stockOrderElement());
}

function stockOrderElement() {
	const tbody = document.querySelector("tbody");
	tbody.innerHTML += `
		<tr>
		<td>번호</td>
		<td><input type="text" placeholder="번호"></td>
		<td>품명</td>
		<td><input type="text" placeholder="품명" ></td>
		<td>품목코드</td>
  		<td><input type="text" placeholder="품목코드" ></td>
	</tr>
	<tr>
		<td>번호</td>
		<td><input type="text" placeholder="번호"></td>
		<td>품명</td>
		<td><input type="text" placeholder="품명" ></td>
		<td>품목코드</td>
  		<td><input type="text" placeholder="품목코드" ></td>
	</tr>
	<tr>
		<td>번호</td>
		<td><input type="text" placeholder="번호1"></td>
		<td>품명</td>
		<td><input type="text" placeholder="품명2" ></td>
		<td>품목코드</td>
  		<td><input type="text" placeholder="품목코드3" ></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td>            
			<button class="btn btn-danger stockDelBtn" onClick="stockDelBtnHandler(event)">
         	 X
        	</button>
    	</td>
	</tr>
		`
	return;
}
</script>


</body>
</html>