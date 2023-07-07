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
         				<button type="button" id ="item_maintable" onclick ="checkbox_on" class="btn btn-primary item_btn_click" >품목 관리</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         				<button type="button" id ="item_release" class="btn btn-secondary item_btn_nonclick" >재고 관리</button><br>
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
  
         			
         			<div id="checkbox_switch1" class="item_checkbox">
	        			<input type="checkbox" id="StockFiveCheck" onchange="filterItems()"> 재고가 5개 이하인 품목만 표시
        			</div>

					<div>
		        		 <table id="mainTable" class="item_table_main">
		        		 	<tr><td>TD확인</td></tr>
		        		</table>
	        		</div>
	        		
        			<div id="checkbox_switch2" class="item_checkbox" style="display: none;">
	        			<input type="checkbox" class="use_Check" checked> 사용 내역
	        			<input type="checkbox" class="dis_Check" checked> 재고 내역
        			</div>
	        		
	        		<div>
		        		 <table id="RelTable" class="item_table_main" style="display: none;">
		        		 	<tr><td>TD확인</td></tr>
		        		</table>
	        		</div>
	        	
	        		
	        		
	        		
	        		
	        		
        		</div> <!-- 오른쪽섹션 -->
        		
         
      		</div> <!-- row orange -->
  		</div> <!-- 아래 섹션 -->
	</div> <!-- 전체 container-fluid -->
	
<script type="text/javascript">

$(document).ready(function() {
	$('#item_maintable').click(function(){
		  	$('#mainTable').show();
		    $('#checkbox_switch1').show();
		    $('#RelTable').hide();
		    $('#checkbox_switch2').hide();
	});

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
					str += "<td data-column='stock'>" +obj.item[i].i_stock + "</td>"
					str += "<td>" +obj.item[i].i_expire + "</td>"
					str += "<td>" +obj.item[i].i_price + "</td>"
					str += "<td>" +obj.item[i].i_remark + "</td>"
					str += "</tr>";
				}
 				$('#mainTable').html(str); 
 				 filterItems(); 
			},
			error: function(){
				alert('검색할 수 없습니다.')
			}
		});
	
	});

$('#StockFiveCheck').change(function() {
	  filterItems();
	});
function filterItems() {
	  var checkbox = $('#StockFiveCheck');
	  var tableRows = $('#mainTable tr');
	  
	  if (checkbox.is(':checked')) {
	    tableRows.each(function(index) {
	      if (index > 0) { 
	        var stock = parseInt($(this).find('td[data-column="stock"]').text());
	        if (stock > 5) {
	          $(this).hide();
	        } else {
	          $(this).show();
	        }
	      }
	    });
	  } else {
	    tableRows.show();
	  }
	}

$(function () {
	$('#item_release').click(function(){
		var str = "";
			$('#mainTable').hide();
			$('#checkbox_switch1').hide();
		    $('#RelTable').show();
			$('#checkbox_switch2').show();
		$.ajax({	
			url: "./itemRelTable.do",
			type: "post",
			success: function(data){
				var obj = JSON.parse(data);
				str += "<tr><th>사용 날짜</th><th>사용 시간</th><th>품명</th><th>품목코드</th><th>카테고리</th><th>사용량</th><th>잔여량</th><th>사용자</th><th>비고(폐기 여부)</th></tr>"
				for(var i =0; i < obj.item.length; i++){
					str += "<tr>";
					str += "<td>" +obj.item[i].rel_date + "</td>"
					str += "<td>" +obj.item[i].rel_time + "</td>"
					str += "<td>" +obj.item[i].i_name + "</td>"
					str += "<td>" +obj.item[i].rel_i_code + "</td>"
					str += "<td>" +obj.item[i].i_category + "</td>"
					str += "<td>" +obj.item[i].rel_amount + "</td>"
					str += "<td>" +obj.item[i].i_stock + "</td>"
					str += "<td>" +obj.item[i].rel_user + "</td>"
					str += "<td data-column='remark'>" +obj.item[i].rel_remark + "</td>"
					str += "</tr>";
				}
 				$('#RelTable').html(str); 
 				filterRelrease(); 
			},
			error: function(){
				alert('검색할 수 없습니다.')
			}
		});

	});
});	 

$('#RelreaseCheck').change(function() {
	filterRelrease();
	});
function filterItems() {
	  var useCheck= $('.use_Check');
	  var disCheck= $('.dis_Check');
	  var tableRows = $('#RelTable tr');
	  
	  if (!useCheck.is(':checked') && disCheck.is(':checked')) {
	    tableRows.each(function(index) {
	      if (index > 0) { 
	        var remark = $(this).find('td[data-column="remark"]').text();
	        if (remark.indexOf("폐기") !== -1) {
	          $(this).hide();
	        } else {
	          $(this).show();
	        }
	      } 
	    });
	    
	    
	  } else {
	    tableRows.show();
	  }
	} 
	


</script>
</body>
</html>