<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/item.css?after" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
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
	            			<tr><th>번호</th></tr>
	            			<tr><th>제품명</th></tr>
	            			<tr><td>재고</td></tr>
	            			<tr><td>재고수량</td></tr>
	            			<tr><td>메모</td></tr>
	            			<tr><td>메모내용</td></tr>
            			</table>
            			</div>
            		</div>
            		<div style="border:3px solid pink; padding 10px;">이건 나오니?</div>
         		</div> <!-- 아래왼쪽섹션 -->
         	
         		<div class="col-md-10" style ="background-color:white;">
         			<div>
         				<button type="button" id ="item_maintable" class="btn text-white item_btn_click" >품목 관리</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         				<button type="button" class="btn text-white item_btn_nonclick" >재고 관리</button><br>
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
						
							<div class="search-input">
							  <i class="fa-solid fa-magnifying-glass"></i>
							  <input class="search-input_bar"type="text" placeholder="검색어 입력">
							</div>
         			</div>
         			
         			<div class="search-mode">
					    <input type="text" >
					
					    <div class="icon">
					      <div class="search">
					        <i class="fas fa-search"></i>
					      </div>
					
					      <div class="plus-option">
					        <i class="fas fa-keyboard"></i>
					        <i class="fas fa-microphone"></i>
					      </div>
					    </div>
					
					    </div>
				    </div>
         			
         			
         			<div class="item_checkbox">
	        			<input type="checkbox"> 재고가 5개 이하인 품목만 표시
        			</div>

					<div class="item_result">

		        		 <table id="mainTable" class="item_table_main">
		        		</table>
	        		</div>
	        		
        		</div> <!-- 오른쪽섹션 -->
        		
         
      		</div> <!-- row orange -->
  		</div> <!-- 아래 섹션 -->
	</div> <!-- 전체 container-fluid -->
	
<script type="text/javascript">
$(function() {
	$('#item_maintable').click(function(){
		var str = "";
		$.ajax({	
			url: "./itemMainTable.do",
			type: "post",
			success: function(data){
				var obj = JSON.parse(data);
				str += "<tr><th>번호</th><th>품명</th><th>품목코드</th><th>카테고리</th><th>단위</th><th>재고량</th><th>유통기한</th><th>물품단가</th><th>비고</th></tr>"
				for(var i =0; i < obj.item.length; i++){
					str += "<tr>";
					str += "<td>" +obj.item[i].i_num + "</td>"
					str += "<td>" +obj.item[i].i_name + "</td>"
					str += "<td>" +obj.item[i].i_code + "</td>"
					str += "<td>" +obj.item[i].i_category + "</td>"
					str += "<td>" +obj.item[i].i_unit + "</td>"
					str += "<td>" +obj.item[i].i_stock + "</td>"
					str += "<td>" +obj.item[i].i_expire + "</td>"
					str += "<td>" +obj.item[i].i_price + "</td>"
					str += "<td>" +obj.item[i].i_remark + "</td>"
					str += "</tr>";
				}
 				$('#mainTable').html(str);
			},
			error: function(){
				alert('안됐다.')
			}
		});

	});
});	
</script>
</body>
</html>