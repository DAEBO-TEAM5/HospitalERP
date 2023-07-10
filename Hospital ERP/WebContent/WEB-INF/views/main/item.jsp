<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/item.css?after" rel="stylesheet"> <!-- 사용자css -->
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
         				<button type="button" id ="item_maintable" class="btn btn-primary item_btn_click" >품목 관리</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         				<button type="button" id ="item_release" class="btn btn-secondary item_btn_nonclick" >출고 관리</button><br>
         			</div>
         			<div class="input-itemsort">
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
						
							<div class="input-itemsearch">
							  <i class="fa-solid fa-magnifying-glass"></i>
							  <input class="input-searchfilter"type="text" placeholder="검색어 입력 (이름/품목코드)"> 
							</div>
         			</div>
  
         			<div class="main_page">
	         			<div class="item_checkbox">
		        			<input type="checkbox" id="StockFiveCheck" onchange="filterItems()"> 재고가 5개 이하인 품목만 표시
	        			</div>
						<div>
			        		 <table id="mainTable" class="item_table_main">
			        		 	<tr><td>TD확인</td></tr>
			        		</table>
		        		</div>
	        		</div>
	        		
	        		
	        		<div class="rel_page" style="display: none;">
	        			<div class="RelreaseCheck item_checkbox" >
		        			<input type="checkbox" class="use_Check" checked> 사용 내역
		        			<input type="checkbox" class="dis_Check" checked> 폐기 내역
	        			</div>
		        		<div>
			        		 <table id="RelTable" class=" item_table_main">
			        		 	<tr><td>TD확인</td></tr>
			        		</table>
		        		</div>
	        		</div>
	        		
	        		
	        		<div>
         				<button type="button" id ="" class="btn btn-primary item_btn_click" >추가</button>
         				<button type="button" id ="" class="btn btn-secondary item_btn_nonclick" >삭제</button>
         				<button type="button" id ="" class="btn btn-secondary item_btn_nonclick" >수정</button><br>
         			</div>	
	        		

	
        		</div> <!-- 오른쪽섹션 -->
        		
         
      		</div> <!-- row orange -->
  		</div> <!-- 아래 섹션 -->
	</div> <!-- 전체 container-fluid -->
	
<script type="text/javascript">

$(document).ready(function() {
	$('#item_maintable').click(function(){
		  	
			$('.main_page').show();
			$('.rel_page').hide();
			$('.input-searchfilter').val('');
			filterTableBySearch();
			$('#StockFiveCheck').prop('checked', false);
			filterItems();
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
					str += "<td main-column='number'>" + (i + 1) + "</td>";
					str += "<td main-column='name'>" +obj.item[i].i_name + "</td>"
					str += "<td main-column='code'>" +obj.item[i].i_code + "</td>"
					str += "<td>" +obj.item[i].i_category + "</td>"
					str += "<td>" +obj.item[i].i_unit + "</td>"
					str += "<td main-column='stock'>" +obj.item[i].i_stock + "</td>"
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
	  filterTableBySearch();
/* 	  if ($(this).is(':checked')) {
		    $('.input-searchfilter').val(''); // 검색어 초기화
		  }	 */
	});
function filterItems() {
	  var checkbox = $('#StockFiveCheck');
	  var main_table = $('#mainTable tr');
	  var count = 1; // 번호 변수를 초기화합니다
	  
	  if (checkbox.is(':checked')) {
	    main_table.each(function(index) {
	      if (index > 0) {
	        var stock = parseInt($(this).find('td[main-column="stock"]').text());
	        if (stock > 5) {
	          $(this).hide();
	        } else {
	          $(this).find('td[main-column="number"]').text(count++);
	          $(this).show();
	        }
	      }
	    });
	  } else {
	    main_table.each(function(index) {
	      if (index > 0) {
	        $(this).find('td[main-column="number"]').text(count++);
	        $(this).show();
	      }
	    });
	  }
	}   

/* 검색 기능: 품목, 출고 한번에 */
$('.input-searchfilter').on('input', function() {
	  search_input = $(this).val(); // 검색어 업데이트
  	  filterTableBySearch();
	});

	function filterTableBySearch() {
	  var search_input = $('.input-searchfilter').val();
	  var main_search = $('#mainTable tr');
	  var rel_search = $('#RelTable tr');
	  var count = 1;
	
	  //품목 관리 검색
	  main_search.each(function(index) { 
		    if (index > 0) {
		    var main_name = $(this).find('td[main-column="name"]').text()
		    var main_code = $(this).find('td[main-column="code"]').text(); 	
		    var main_number = $(this).find('td[main-column="number"]');
		    
		    if (main_name.includes(search_input) || main_code.includes(search_input)) {
		    	main_number.text(count++);
		    	$(this).show();
		      } else {
		        $(this).hide();
		      }
		    }
		  });
	  
	  //출고 관리 검색
	  rel_search.each(function(index) {
	   	 if (index > 0) {
	   		 var rel_name = $(this).find('td[rel-column="name"]').text()
		   	 var rel_code = $(this).find('td[rel-column="code"]').text(); 
		      if (rel_name.includes(search_input) || rel_code.includes(search_input)) {
		    	$(this).show();
		      } else {
		        $(this).hide();
		      }
		    }
		  });
		}

/* 여기서 부터 출고 관리 이하 기능들 */

$(function () {
	$('#item_release').click(function(){
			
		$('.main_page').hide();
		$('.rel_page').show();
		$('.input-searchfilter').val('');
		filterTableBySearch();
	    $('.use_Check').prop('checked', true);
	    $('.dis_Check').prop('checked', true);
	    filterRelrease();
		var str = "";
		$.ajax({	
			url: "./itemRelTable.do",
			type: "post",
			success: function(data){
				var obj = JSON.parse(data);
				str += "<tr><th>사용 날짜</th><th>사용 시간</th><th>품명</th><th>품목코드</th><th>카테고리</th><th>사용량</th><th>잔여량</th><th>사용자</th><th>비고(폐기 여부)</th></tr>')"
				for(var i =0; i < obj.item.length; i++){
					str += "<tr>";
					str += "<td>" +obj.item[i].rel_date + "</td>"
					str += "<td>" +obj.item[i].rel_time + "</td>"
					str += "<td rel-column='name'>" +obj.item[i].i_name + "</td>"
					str += "<td rel-column='code'>" +obj.item[i].rel_i_code + "</td>"
					str += "<td>" +obj.item[i].i_category + "</td>"
					str += "<td>" +obj.item[i].rel_amount + "</td>"
					str += "<td>" +obj.item[i].i_stock + "</td>"
					str += "<td>" +obj.item[i].rel_user + "</td>"
					str += "<td rel-column='remark'>" +obj.item[i].rel_remark + "</td>"
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

$('.RelreaseCheck').change(function() {
	filterRelrease();
	});
function filterRelrease() {
	  var useCheck= $('.use_Check');
	  var disCheck= $('.dis_Check');
	  var rel_table = $('#RelTable tr');
	  var rel_table_header = $('#RelTable tr:first-child');	
	  
	  	  if (useCheck.is(':checked') && disCheck.is(':checked')) {
		    rel_table.show();
		  } else if (!useCheck.is(':checked') && disCheck.is(':checked')) {
		    	rel_table.each(function(index) {
		      	if (index === 0 || $(this).find('td[rel-column="remark"]').text().includes('폐기')) {
		        	$(this).show();
		      	} else {
		        	$(this).hide();
		      	}
		   		 });
		  } else if (useCheck.is(':checked') && !disCheck.is(':checked')) {
			    rel_table.each(function(index) {
			      if (index === 0 || !$(this).find('td[rel-column="remark"]').text().includes('폐기')) {
			        $(this).show();
			      } else {
			        $(this).hide();
			      }
			    });
		  } else {
		    rel_table.hide();
		    rel_table_header.show();
		  }
		}
		
/* 클릭시 삭제
$(document).on('click', '#mainTable tr:not(:first-child)', function() {
    $(this).remove();
});
*/

</script>
</body>
</html>