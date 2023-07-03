<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/style.css?after" rel="stylesheet"> <!-- 사용자css -->
  <link href="${pageContext.request.contextPath }/resources/style.css?after" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
<title>재고 관리</title>


</head>
<body>
	<div class="container-fluid">
	
		<div class="d-flex" id="title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user"></i>병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="#" class="title-a">진료</a></div>
			<div class="p-2"><a href="#" class="title-a">재고</a></div>
			<div class="p-2"><a href="#" class="title-a">진료기록</a></div>
			  
		</div>
		<div class="container-fluid">
      		<div class="row" style="border: 1px solid orange; height: 100%;">

         		<div class="col-md-2" style="border: 1px solid green; height: 100%; background-color: lightgrey;">
            		<h2 style="text-align: center">재고 관리</h2>
            		<div class="form-group">
            			<div class="item_manage_memobox">왜 안나올까
            			<table class="item_manage_memobox_table">
	            			<tr><th>번호</th></tr><br>
	            			<tr><th>제품명</th></tr><br>
	            			<tr class="item_manage_memobox_table"><td>재고</td></tr><br>
	            			<tr class="item_manage_memobox_table"><td>재고수량</tr><br>
	            			<tr class="item_manage_memobox_table"><td>메모<td></tr><br>
	            			<tr class="item_manage_memobox_table"><td>메모내용<td></tr><br>
            			</table>
            			</div>
            		</div>
            		<div style="border:3px solid pink; padding 10px;">이건 나오니?</div>
         		</div> <!-- 아래왼쪽섹션 -->
         	
         		<div class="col-md-10" style ="background-color:skyblue;">
         			<div>
         				<button type="button" class="btn text-white" style="background-color: #00AAFF;">품목 관리</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         				<button type="button" class="btn text-white" style="background-color: grey;">재고 관리</button><br>
         			</div>
         			<div class="item_manage_group">
	         			<select class="form-select" >
						  <option selected>대분류</option>
						  <option>약품을</option>
						  <option>요롷게</option>
						  <option>나누자</option>
						</select>
	         			<select class="form-select" >
						  <option selected>중분류</option>
						  <option>중분류는</option>
						  <option>이렇게</option>
						  <option>나눠보자</option>
						</select>
         				<input type="search"  placeholder="품명 검색">  <!-- 돋보기 아이콘도 넣기 -->
         			</div>
         			<div>
	        			<input type="checkbox"> 재고가 5개 이하인 품목만 표시
	        			<input type="checkbox"> 엥 왜안돼
        			</div>

					<div>
		        		<table border="2" width="1000"> <!-- tr th td border, solid, border-collapse: collapse; -->
							<tr>
								<th>번호</th>
								<th>품명</th>
								<th>품목코드</th>
								<th>사용량</th>
								<th>사용자</th>
								<th>재고</th>
								<th>비고</th>
							</tr>
							<tr>
								<td>1 </td>
								<td>2 </td>
								<td>3 </td>
								<td>4 </td>
								<td>5 </td>
								<td>6 </td>
								<td>7 </td>
							</tr>
							<tr>
								<td>1 </td>
								<td>2 </td>
								<td>3 </td>
								<td>4 </td>
								<td>5 </td>
								<td>6 </td>
								<td>7 </td>
							</tr>
		        		</table>
	        		</div>
	        		
        		</div> <!-- 오른쪽섹션 -->
        		
         
      		</div> <!-- row orange -->
  		</div> <!-- 아래 섹션 -->
	</div> <!-- 전체 container-fluid -->
	

</body>
</html>