<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Jquery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- 부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 부트스트랩 -->
    <link href="${pageContext.request.contextPath }/resources/item.css?after" rel="stylesheet" />
    <!-- 사용자css -->
    <link href="${pageContext.request.contextPath }/resources/include.css?after" rel="stylesheet" />
    <!-- 사용자css -->
    <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script>
    <!-- fontawesome  -->
    <link rel="icon" href="${pageContext.request.contextPath }/image/hp.png" /> <!-- //파비콘임 -->
    <title>재고</title>
</head>
<body>
    <div class="container-fluid">
        <div class="container-fluid info">
            <c:import url="../include/header.jsp"></c:import>
            <div class="row">
                <div class="col-md-2 leftinfo" >
                    <p>
                    <h2 style="text-align: center"><b>재고 관리</b></h2>
                    <div class="">
                        <div class="">
                            
                            <table id="memoTable" class="item_manage_memobox_table">
                         		<tr>
								  	<td colspan="2">
								      <h4 style="text-align: center;">품목 메모</h4>
								    </td>
								</tr>
                                <tr>
                         			<th> 제품코드 </th>
                         			<th> 제품명 </th>
                         		</tr>
                         		<tr>
                         			<td id="memoTable_code">&nbsp; </td>
                         			<td id="memoTable_name">&nbsp; </td>                         		
                         		</tr>
                         		<tr>
                         			<th> 재고량 </th>
                         			<th> 단위 </th>
                         		</tr>
                         		<tr>
                         			<td id="memoTable_stock">&nbsp; </td>                         		
                         			<td id="memoTable_unit">&nbsp; </td>                         		
                         		</tr><br/>	
                         		
                         		<tr>
                         			<th colspan="2"> 메모 </th>
                         		</tr>	
                         		<tr>
                         			<td colspan="2"> 
                         				<textarea rows="7" cols="28" id="memoTable_memo" class="item_manage_memobox_memotext">&nbsp;
                         				</textarea> 
                         			</td>                         		
                         		</tr>
                         		<tr>
                         			<td>
   			                            <button type="button" class="btn btn-secondary item_manage_memobox_button" onclick="clearMemoTable()">
				                           칸 비우기
				                        </button>
                         			</td>
                         			<td>
   			                            <button type="button" class="btn btn-primary item_manage_memobox_button" onclick="updateMemoTable()">
                                			저장
                            			</button>
                         			</td>
                         		</tr>                         		                         		
                            </table>


                        </div>
                    </div>
                </div>
                <!-- 아래왼쪽섹션 -->
				<!-- 아래 오른쪽섹션 시작 -->
			
                <div class="col-md-10 info">
                    <div class="item_page_btn">
                        <button type="button" id="item_maintable" class="btn item_btn_itempage">
                        	재고 조회
                        </button>
                        <button type="button" id="item_release" class="btn item_btn_relpage">
                            출고 관리
                        </button><br />
                    </div>
                    <div class="input-itemsort">
                        <div>
                	        <select id="CategorySearch" class="form-select">
              		
                        	</select>
						</div>

						<div class="input-itemsearch">
							<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						    <input class="input-searchfilter" type="text" placeholder="검색어 입력 (이름/품목코드)" />
						</div>
                    </div>

                    <div class="main_page">
                    	
                        <!--품목관리  PAGE  시작-->
                        <div class="item_checkbox">
                            <input type="checkbox" id="StockFiveCheck" onchange="filterItems()" /> 재고가 5개 이하인
                            품목만 표시
                        </div>
                        
                        <div class="table_scroll">
                            <table id="mainTable" class="item_table item_page_tablesize" style="height:auto;"> <!-- class="item_table_main" -->
                                <tr>
                                    <td>테이블을 불러오고 있습니다...</td>
                                </tr>
                            </table>
                        </div>

                            
                        <!-- 모달 (아이템 입고 추가) 시작  -->
                        <div  class="modal fade"  id="staticBackdrop"  data-bs-backdrop="static"  data-bs-keyboard="false"  tabindex="-1"  aria-labelledby="staticBackdropLabel"
                            aria-hidden="true"  >
                            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">품목 추가</h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"
                                        ></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table" page="main_ins_modal">
                                            <tbody>
                                                <div class="insert_div">
                                                    <tr class="nodelete">
                                                        <td>품목코드</td>
                                                        <td><input type="text" placeholder="품목코드" /></td>
                                                        <td>단위</td>
                                                        <td><input type="text" placeholder="단위" /></td>
                                                        <td>재고량</td>
                                                        <td><input type="text" placeholder="재고량" /></td>
                                                    </tr>
                                                    <tr class="nodelete">
                                                        <td>유통기한(YYYY-MM-DD)</td>
                                                        <td><input type="text" placeholder="유통기한" /></td>
                                                        <td>물품단가</td>
                                                        <td><input type="text" placeholder="물품단가" /></td>
                                                        <td>비고</td>
                                                        <td><input type="text" placeholder="비고" /></td>
                                                        <td colspan="2">
                                                            <button
                                                                class="btn btn-danger"
                                                                onClick="item_modalDelBtnHandler(event)">
                                                                X
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </div>
                                            </tbody>
                                        </table>

                                        <button
                                            type="button"
                                            class="btn btn-secondary"
                                            id="modal_addItem"
                                            onClick="tableAddBtnHandler()">
                                            항목추가
                                        </button>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            닫기
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="insert_submit">
                                            등록
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- 모달 (아이템 입고 추가) 끝  -->
                            
                            
                            
                            <!-- 모달(아이템 입고 수정)시작 -->
            	<div class="modal fade" id="itemModifyModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="itemModifyModalLabel" aria-hidden="true">
					<div class="modal-dialog  modal-lg  modal-dialog-centered  modal-dialog-scrollable"> 
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="itemModifyModalLabel">품목 수정</h5>
								     <button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
									
									<table class ="table ">
										<tr>
											<td>
												<label for="InputName">품명</label> 
												<input type="text" class="form-control" id="InputName" disabled="disabled" />
											</td>
											<td>							
												<label for="InputCode">품목코드</label> 
												<input type="text" class="form-control" id="InputCode" disabled="disabled" />
											</td>
										</tr>
										<tr>
											<td>
												<label for="InputCategory">카테고리</label> 
												<input type="text" class="form-control" id="InputCategory" disabled="disabled" />
											</td>
											<td>										
												<label for="InputUnit">단위</label>
												<input type="text" class="form-control" id="InputUnit">
											</td>
										</tr>
										<tr>
											<td>										
												<label for="InputStock">재고량</label>
												<input type="text" class="form-control" id="InputStock">
											</td>
											<td>
												<label for="InputExpire">유통기한 (YYYY-MM-DD)</label>
												<input type="text" class="form-control" id="InputExpire">
											</td>
										</tr>
										<tr>
											<td>
												<label for="InputPrice">물품단가</label>
												<input type="text" class="form-control" id="InputPrice">
											</td>
											<td>
												<label for="InputRemark">비고</label>
												<input type="text" class="form-control" id="InputRemark">
											</td>
										</tr>
									</table>
									<br/>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="submit" id="item_UpdateSubmit" class="btn btn-primary">수정</button>
							</div>
							

							</div>
							
						</div>
					</div>
				</div><!-- 모달(아이템 입고 수정)끝 -->
                            
                      <div class ="item_page_footer">
                           <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                품목 추가
                            </button>
                            <button type="button" id="item_DeleteButton" class="btn btn-secondary" >
                                품목 삭제
                            </button>
                            <button type="button" id="item_ModifyButton" class="btn btn-secondary" data-bs-target="#itemModifyModal">
                            	품목 수정
                            </button>
                            <button type="button" id="select_cancel" class="btn btn-secondary" >
                            	선택 전체해제
                            </button>
                            <br/>
                       </div>
                       
    			   </div> <!--품목관리  PAGE  (메인)end--> <!-- ----------------------------------------------------------------------------------------------- -->



                    	 <!-- 출고관리  PAGE  start--> <!-- -------------------------------------------------------------------------------------------------- -->
                    <div class="rel_page" style="display: none">
                        <div class="ReleaseCheck item_checkbox">
                            <input type="checkbox" class="use_Check" checked /> 사용 내역
                            <input type="checkbox" class="dis_Check" checked /> 폐기 내역
                        </div>
                        <div class="table_scroll">
                            <table id="RelTable" class="item_table rel_page_tablesize"> <!-- class="item_table_main" -->
                                <tr>
                                    <td>테이블을 불러오고 있습니다...</td>
                                </tr>
                            </table>
                        </div>
                
                     <!-- 모달(출고 관리 - 사용 내역 추가)시작 -->
	                 <div class="modal fade" id="itemRelModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="itemRelModalLabel" aria-hidden="true">
						<div class="modal-dialog  modal-lg  modal-dialog-centered  modal-dialog-scrollable"> 
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="itemRelModalLabel">사용 내역 추가</h5>
									<button type="button" class="btn-close"" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
								<div class="modal-body">
										<table class = "table">
										<tr>
											<td>
												<label for="rel_InputCodeNum">품목코드</label>
												<input type="text" class="form-control" id="rel_InputCodeNum">
											</td>
											<td>										
												<label for="rel_InputDate">사용날짜 (YYYY-MM-DD)</label>
												<input type="text" class="form-control" id="rel_InputDate">
											</td>
										</tr>
										<tr>
											<td>
												<label for="rel_InputTime">사용시간 (HH:MM)</label>
												<input type="text" class="form-control" id="rel_InputTime">
											</td>
											<td>
												<label for="rel_InputAmount">사용량</label>
												<input type="text" class="form-control" id="rel_InputAmount" >
											</td>
										</tr>
										<tr>
											<td>
												<label for="rel_InputUser">사용자</label>
												<input type="text" class="form-control" id="rel_InputUser">
											</td>
											<td>
												<label for="rel_InputRemark">비고</label>
												<input type="text" class="form-control" id="rel_InputRemark">
											</td>
										</tr>
									</table>
									<br/><br/>
	
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="submit" id="item_RelSubmit" class="btn btn-primary">등록</button>
								</div>
								
	
								</div>
								
							</div>
						</div>
					</div><!-- (출고 관리 - 사용 내역 추가)끝 -->
					
					
                     <!-- 모달(출고 관리 - 폐기 내역 추가)시작 -->
	                 <div class="modal fade" id="itemDisModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="itemDisModalLabel" aria-hidden="true">
						<div class="modal-dialog  modal-lg  modal-dialog-centered  modal-dialog-scrollable"> 
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="itemDisModalLabel">폐기 내역 추가</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
								<div class="modal-body">
										<table class = "table">
										<tr>
											<td>
												<label for="dis_InputCodeNum">품목코드</label>
												<input type="text" class="form-control" id="dis_InputCodeNum">
											</td>
											<td>										
												<label for="dis_InputDate">폐기날짜 (YYYY-MM-DD)</label>
												<input type="text" class="form-control" id="dis_InputDate">
											</td>
										</tr>
										<tr>
											<td>
												<label for="dis_InputTime">폐기시간 (HH:MM)</label>
												<input type="text" class="form-control" id="dis_InputTime">
											</td>
											<td>
												<label for="dis_InputAmount">폐기량</label>
												<input type="text" class="form-control" id="dis_InputAmount" >
											</td>
										</tr>
										<tr>
											<td>
												<label for="dis_InputUser">폐기 처리자</label>
												<input type="text" class="form-control" id="dis_InputUser">
											</td>
											<td>
												<label for="dis_InputRemark">비고</label>
												<div style="display:flex width=375px">
												<input type="text" class="form-control" id="dis_InputRemark" value="폐기 사유: " >
												</div>
											</td>
										</tr>
									</table>
									<br/><br/>

								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="submit" id="item_DisSubmit" class="btn btn-primary">등록</button>
								</div>
								
	
								</div>
								
							</div>
						</div>
					</div><!-- 모달(출고 관리 - 폐기 내역 추가) 끝 -->                        
                        
                        
                        
                        <div class="item_page_footer">
                        	 <button type="button" id="" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#itemRelModal">
                            	사용 내역 추가 
                            </button>
                        	 <button type="button" id="dis_InsertButton" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#itemDisModal">
                            	폐기 내역 추가 
                            </button>
                        </div>
                    </div> <!-- 출고관리  PAGE  end -->
                    
                    
                    
                    
                </div><!-- 오른쪽섹션 -->
            </div><!-- row-->
        </div> <!-- container-fluid info -->
    </div><!-- 전체 container-fluid -->


<script type="text/javascript">

function mainPageOpen() {
    $(".main_page").show();
    $(".rel_page").hide();	
    pageChange();
	filterItems();
    loadMainTable();
    
    $('#item_maintable').removeClass('btn-secondary');
    $('#item_release').removeClass('btn-primary'); 
    $('#item_maintable').addClass('btn-primary');
    $('#item_release').addClass('btn-secondary');
    
}
function relPageOpen() {
    $(".main_page").hide();
    $(".rel_page").show();
    pageChange();
    filterRelease();
    loadItemRelTable();
    
	$('#item_maintable').removeClass('btn-primary');
	$('#item_release').removeClass('btn-secondary');
	$('#item_maintable').addClass('btn-secondary');
	$('#item_release').addClass('btn-primary');

}
function pageChange(){
    removeClickActive(); 
    $('#CategorySearch').prop('selectedIndex', 0);
 	$(".input-searchfilter").val("");
	$("#StockFiveCheck").prop("checked", false);
    $(".use_Check").prop("checked", true);
    $(".dis_Check").prop("checked", true);
    $(".table_scroll").scrollTop(0);
}

window.onload = function() {
	mainPageOpen();
	
};
	
function loadMainTable() {
    var str = "";
    $.ajax({
        url: "./itemMainTable.do",
        type: "post",
        success: function (data) {
            var obj = JSON.parse(data);
            
            str +=
                "<tr><th>index</th><th>품명</th><th>품목코드</th><th>카테고리</th><th>단위</th><th>재고량</th><th>유통기한</th><th>물품단가</th><th>비고</th></tr>";
            for (var i = 0; i < obj.item.length; i++) {
                str += "<tr>";
                str += "<td main-column='index'>" + (i + 1) + "</td>";
                str += "<td main-column='name'>" + obj.item[i].i_name + "</td>";
                str += "<td main-column='code'>" + obj.item[i].i_code + "</td>";
                str += "<td main-column='category'>" + obj.item[i].i_category + "</td>";
                str += "<td main-column='unit'>" + obj.item[i].i_unit + "</td>";
                str += "<td main-column='stock'>" + obj.item[i].i_stock + "</td>";
                str += "<td main-column='expire'>" + obj.item[i].i_expire + "</td>";
                str += "<td main-column='price'>" + obj.item[i].i_price + "</td>";
                str += "<td main-column='remark'>" + obj.item[i].i_remark + "</td>";
                str += "</tr>";
            }
            $("#mainTable").html(str);
            filterItems();

        },
        error: function () {
            alert("검색할 수 없습니다.");
        },
    });
}

//품목관리 (페이지) 버튼
$(document).ready(function () {
  	$("#item_maintable").click(function () {
   		 mainPageOpen();
  });
});

function reload() {
    //페이지 새로고침
    (location || window.location || document.location).reload();
}

$("#mainTable").on("click", "tr:not(:first-child)", function () {
    $(this).toggleClass("click_active");
    itemMemoCall($(this));
});

//테이블 메모 불러오기 클릭
$("#RelTable").on("click", "tr:not(:first-child)", function () {
    itemMemoCall($(this));
});

function removeClickActive() {
	  $("#mainTable tr:not(:first-child)").removeClass("click_active");
}


$("#select_cancel").on("click", function () {
	 removeClickActive();
});

// 테이블 메모 불러오기
function itemMemoCall(row) {
	var code;
	if ($(".main_page").is(":visible")) {
	   code = row.find('td[main-column="code"]').text();
	} else if ($(".rel_page").is(":visible")) {
	   code = row.find('td[rel-column="code"]').text();
	}
    $.ajax({
        type: 'POST',
        url: "./itemMemoCall.do",
        data: {
            "code": code
        },
        success: function (data) {
            var obj = JSON.parse(data);
            var code = "";  var name = "";  var stock = "";  var unit = "";  var memo = "";
            	code +=  obj.i_code ;
                name +=  obj.i_name ;
                stock += obj.i_stock ;
                unit +=  obj.i_unit ;
                memo +=  obj.i_i_memo ;
                
            $("#memoTable_code").html(code);
            $("#memoTable_name").html(name);
            $("#memoTable_stock").html(stock);
            $("#memoTable_unit").html(unit);
            $("#memoTable_memo").val(memo);
        },
        error: function (request, status, error) {
            alert('해당 품목은 삭제된 품목입니다.');
        }
    });
}

//왼쪽 메모장 초기화
function clearMemoTable() {
    $("#memoTable_memo").val("");
}
//메모 저장 (업데이트)
function updateMemoTable(){
	var code = $("td[id='memoTable_code']").text();
	var memo = $("#memoTable_memo").val();
   
	$.ajax({
        type: 'POST',
        url: "./itemMemoUpdate.do",
        data: {
        	 "code": code, "memo": memo
        },
        success: function (data) {
        	alert('메모 변경이 완료되었습니다');
        },
        error: function (request, status, error) {
            alert('메모 변경이 실패했습니다.');
        }
    });
	
}

//5개이하 재고품목 확인 체크박스 실시간
$("#StockFiveCheck").change(function () {
    filterItems();
    //$('#CategorySearch').prop('selectedIndex', 0);
    //filterItems();
});

//품목관리, 출고관리별 검색필터 다르게
$(".input-searchfilter").on("input", function () {
	//$('#CategorySearch').prop('selectedIndex', 0);
	if ($(".main_page").is(":visible")) {
    	filterItems();
    } else if ($(".rel_page").is(":visible")) {
        filterRelease();
    }
});

//카테고리 검색설정시
$("#CategorySearch").change(function () {
	if ($(".main_page").is(":visible")) {
    	filterItems();
    } else if ($(".rel_page").is(":visible")) {
        filterRelease();
    }
});

// 사용내역/ 폐기내역 클릭시
$(".ReleaseCheck").change(function () {
    filterRelease();
});

//메인(재고)페이지 검색+5개이하 재고품목 확인
function filterItems() {
    var checkbox = $("#StockFiveCheck");
    var search_input = $(".input-searchfilter").val();
    var main_table = $("#mainTable tr");
    var count = 1;
    var select_category = $("#CategorySearch").val(); 

    main_table.each(function (index) {
        if (index > 0) {
            var stock = parseInt($(this).find('td[main-column="stock"]').text());
            var name = $(this).find('td[main-column="name"]').text();
            var code = $(this).find('td[main-column="code"]').text();
            var category = $(this).find('td[main-column="category"]').text();
            var main_index = $(this).find('td[main-column="index"]');

            if ((checkbox.is(":checked") && stock <= 5) || !checkbox.is(":checked")) {
                if (name.includes(search_input) || code.includes(search_input) || search_input === "") {
                    if (select_category === "카테고리별 분류" || category === select_category) {
                        main_index.text(count++);
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                } else {
                    $(this).hide();
                }
            } else {
                $(this).hide();
            }
        }
    });
}
//출고페이지 checkbox 사용, 폐기내역 + 검색
function filterRelease() {
    var useCheck = $(".use_Check");
    var disCheck = $(".dis_Check");
    var rel_table = $("#RelTable tr");
    var search_input = $(".input-searchfilter").val();
    var select_category = $("#CategorySearch").val(); 
    
    rel_table.each(function (index) {
        if (index > 0) {
            var rel_name = $(this).find('td[rel-column="name"]').text();
            var rel_code = $(this).find('td[rel-column="code"]').text();
            var remark = $(this).find('td[rel-column="remark"]').text();
            var category = $(this).find('td[rel-column="category"]').text();

            var is_search_input_valid = rel_name.includes(search_input) || rel_code.includes(search_input) || search_input === "";
            var is_remark_dispose = remark.includes("폐기");
            var use_filter = useCheck.is(":checked") && (!is_remark_dispose || disCheck.is(":checked"));
            var dis_filter = disCheck.is(":checked") && (is_remark_dispose || useCheck.is(":checked"));

            if (is_search_input_valid && (use_filter || dis_filter)) {
            	if (select_category === "카테고리별 분류" || category === select_category){
                $(this).show();
            	} else {
            		$(this).hide();
            	}
            } else {
                $(this).hide();
            }
        }
    });
}

//출고 관리 load
function loadItemRelTable() {
  var str = "";
  $.ajax({
    url: "./itemRelTable.do",
    type: "post",
    success: function (data) {
      var obj = JSON.parse(data);
      str +=
        "<tr><th>사용 날짜</th><th>사용 시간</th><th>품명</th><th>품목코드</th><th>카테고리</th><th>사용량</th><th>잔여량</th><th>사용자</th><th>비고(폐기 여부)</th></tr>";
      for (var i = 0; i < obj.item.length; i++) {
        str += "<tr>";
        str += "<td>" + obj.item[i].rel_date + "</td>";
        str += "<td>" + obj.item[i].rel_time + "</td>";
        str += "<td rel-column='name'>" + obj.item[i].i_name + "</td>";
        str += "<td rel-column='code'>" + obj.item[i].rel_i_code + "</td>";
        str += "<td rel-column='category'>" + obj.item[i].i_category + "</td>";
        str += "<td>" + obj.item[i].rel_amount + "</td>";
        str += "<td>" + obj.item[i].rel_after + "</td>";
        str += "<td>" + obj.item[i].rel_user + "</td>";
        str += "<td rel-column='remark'>" + obj.item[i].rel_remark + "</td>";
        str += "</tr>";
      }
      $("#RelTable").html(str);
      filterRelease();
    },
    error: function () {
      alert("검색할 수 없습니다.");
    },
  });
}
//출고페이지 버튼으로 불러오기
$(function () {
  $("#item_release").click(function () {
    relPageOpen();
  });
});

//아이템 insert 모달 초기화
function clearModalText() {
    $('table[page="main_ins_modal"] input[type="text"]').val("");
    $("table[page='main_ins_modal'] tbody > tr").not(".nodelete").remove();
    $("table[page='main_ins_modal'] br").remove();
    //$('table[page="main_ins_modal"]').not(':first').remove();
}

// 모달 닫기 이벤트 처리
$("#staticBackdrop").on("hidden.bs.modal", function () {
    clearModalText(); 
});
$("#itemRelModal").on("hidden.bs.modal", function () {
	$(this).find("input").val("");
});
$("#itemDisModal").on("hidden.bs.modal", function () {
	$(this).find("input").not('#dis_InputRemark').val("");
});

 //item 추가 모달 내 "항목추가"된것 삭제
function item_modalDelBtnHandler(event) {
    const select_row = $(event.target).closest("tr");
    const front_row = select_row.prev("tr");
    const br = front_row.prev("br");
    
    select_row.add(front_row).add(br).not(".nodelete").remove();
}

 function tableAddBtnHandler() {
    const [tr1, tr2] = itemTableElement();
    const tbody = document.querySelector("table[page='main_ins_modal'] > tbody");
    
    tbody.appendChild(document.createElement('br')); // <br>태그 추가
    tbody.appendChild(tr1);
    tbody.appendChild(tr2);
}
//insert 모달 항목추가
function itemTableElement() {
    	const tr1 = document.createElement("tr");
    	
    	tr1.innerHTML = `
    	<td>품목코드</td>
		<td><input type="text" placeholder="품목코드"></td>
		<td>단위</td>
		<td><input type="text" placeholder="단위"></td>
		<td>재고량</td>
		<td><input type="text" placeholder="재고량" ></td>
	`;
        const tr2 = document.createElement("tr");
        
        tr2.innerHTML = `
		<td>유통기한(YYYY-MM-DD)</td>
		<td><input type="text" placeholder="유통기한" ></td>
		<td>물품단가</td>
		<td><input type="text" placeholder="물품단가"></td>
		<td>비고</td>
		<td><input type="text" placeholder="비고" ></td>
		<td colspan="2">
			<button class="btn btn-danger" onClick="item_modalDelBtnHandler(event)">
	    	 X
	   		</button>
		</td>
	`;
               return [tr1, tr2];
           }
           //모달내의 등록제출시 sql insert
           
           
$("#insert_submit").click(function () {
    var items = []; // 항목들을 담을 배열
    const trs = document.querySelectorAll("table[page='main_ins_modal'] tr");
    for (let i = 0; i < trs.length; i += 2) {
        let tr1 = trs[i];
        let tr2 = trs[i + 1];
        let item = {
            itemCode: tr1.querySelector('input[placeholder="품목코드"]').value,
            itemUnit: tr1.querySelector('input[placeholder="단위"]').value,
            itemStock: tr1.querySelector('input[placeholder="재고량"]').value,
            itemExpire: tr2.querySelector('input[placeholder="유통기한"]').value,
            itemPrice: tr2.querySelector('input[placeholder="물품단가"]').value,
            itemRemark: tr2.querySelector('input[placeholder="비고"]').value,
        };
        items.push(item);
	}

	var data = {
        itemList: items, // 리스트 형태로 데이터 전달
	};

    $.ajax({
        url: "./itemInsert.do",
        type: "post",
        data: JSON.stringify(items), 
        contentType: "application/json", //stringify와 같이 json 파싱
        success: function (response) {
            alert("데이터베이스에 항목들이 삽입되었습니다.");
            $("#staticBackdrop").modal("hide"); 
            loadMainTable();
        },
        error: function () {
            alert(
                "데이터베이스 삽입 중 오류가 발생했습니다. \n\n※사용하지 않는 칸은 제거해주세요. \n※재고량과 물품단가는 숫자로 입력해주세요."
            );
        },
    });
});
           

// 아이템 삭제버튼
$("#item_DeleteButton").click(function () {
    var itemDels = [];
    var active_rows = $("#mainTable tr.click_active"); /* var? */
    if (active_rows.length === 0) {
        alert("삭제할 항목을 선택한 후 눌러주세요.");
        return;
    } else {
        active_rows.each(function () {
            var active_row = $(this);
            var itemId = active_row.find('td[main-column="code"]').text();
            var itemDel = {
                iCode: itemId,
            };

            itemDels.push(itemDel);
        });
    }
    if (confirm("정말 삭제하시겠습니까?")) {
        var data = {
            itemDelList: itemDels,
        };

        $.ajax({
            url: "./itemDelete.do",
            type: "post",
            data: JSON.stringify(itemDels),
            contentType: "application/json", //stringify와 같이 json 파싱
            success: function (response) {
                alert("항목이 성공적으로 삭제되었습니다.");
                loadMainTable();
            },
            error: function (error) {
                alert("항목 삭제 중 오류가 발생했습니다.");
            },
        });
    }//if end
});


// 아이템 수정-> 모달 불러오기
$(document).on('click', '#item_ModifyButton', function() {
    var select_rows = $("#mainTable tr.click_active");
    if (select_rows.length === 0) {
        removeClickActive();
        alert("수정할 항목을 선택한 후 눌러주세요.");
        return;
    } else if (select_rows.length === 1) {
        var select_row = select_rows.first();
        var name = select_row.find('td[main-column="name"]').text();
        var code = select_row.find('td[main-column="code"]').text();
        var category = select_row.find('td[main-column="category"]').text();
        var unit = select_row.find('td[main-column="unit"]').text();
        var stock = select_row.find('td[main-column="stock"]').text();
        var expire = select_row.find('td[main-column="expire"]').text();
        var price = select_row.find('td[main-column="price"]').text();
        var remark = select_row.find('td[main-column="remark"]').text();

        $('#itemModifyModal').modal('show');
        
        $('#InputName').val(name);
        $('#InputCode').val(code);
        $('#InputCategory').val(category);
        $('#InputUnit').val(unit);
        $('#InputStock').val(stock);
        $('#InputExpire').val(expire);
        $('#InputPrice').val(price);
        $('#InputRemark').val(remark);

    } else {
        removeClickActive();
        alert("수정은 한 항목만 가능합니다.");
        return;
    }
});


// 아이템 수정-> 모달내 작성 후 전송 버튼
$("#item_UpdateSubmit").click(function () {
    var name = document.getElementById('InputName').value;
    var code = document.getElementById('InputCode').value;
    var category = document.getElementById('InputCategory').value;
    var unit = document.getElementById('InputUnit').value;
    var stock = document.getElementById('InputStock').value;
    var expire = document.getElementById('InputExpire').value;
    var price = document.getElementById('InputPrice').value;
    var remark = document.getElementById('InputRemark').value;

    $.ajax({
        type:'POST',
        url: "./itemUpdate.do",
        data: {
            "name": name, "code": code, "category": category,
            "unit": unit, "stock": stock, "expire": expire, "price": price, "remark": remark
        },
        success: function(response){
            alert('변경이 완료되었습니다');
            $("#itemModifyModal").modal('hide');
            loadMainTable();
        },
        error: function(msg, error) {
        	alert('변경이 실패하였습니다.\n\n※확인 후 다시 시도해주세요.');
        }
    });
});


// 사용 내역 추가 -> 모달 내 작성후 전송 버튼
$("#item_RelSubmit").click(function () {
	var rel_codenum = document.getElementById('rel_InputCodeNum').value;
    var rel_date = document.getElementById('rel_InputDate').value;
    var rel_time = document.getElementById('rel_InputTime').value;
    var rel_amount = document.getElementById('rel_InputAmount').value;
    var rel_user = document.getElementById('rel_InputUser').value;
    var rel_remark = document.getElementById('rel_InputRemark').value;

    $.ajax({
        type:'POST',
        url: "./itemRelInsert.do",
        data: {
            "rel_codenum": rel_codenum, "rel_date": rel_date, "rel_time": rel_time, "rel_amount": rel_amount, "rel_user": rel_user, "rel_remark": rel_remark
        },
        success: function(response){
            alert('사용 내역 추가가 성공하였습니다.');
            $("#itemRelModal").modal('hide');
            loadItemRelTable();
        },
        error: function(msg, error) {
            alert('사용 내역 추가가 실패하였습니다.\n\n※확인 후 다시 시도해주세요.');
            
        }
    });
});


//폐기 내역 추가 -> 모달 내 작성후 전송 버튼
$("#item_DisSubmit").click(function () {
	var dis_codenum = document.getElementById('dis_InputCodeNum').value;
    var dis_date = document.getElementById('dis_InputDate').value;
    var dis_time = document.getElementById('dis_InputTime').value;
    var dis_amount = document.getElementById('dis_InputAmount').value;
    var dis_user = document.getElementById('dis_InputUser').value;
    var dis_remark = document.getElementById('dis_InputRemark').value;
    if (!dis_remark.includes("폐기")) {
    	  alert('비고란에 폐기 사유 양식이 들어가야 합니다.\n\n※ 예시 양식 "폐기 사유: 유통기한 초과"');
    	  dis_remark 
    	  document.getElementById('dis_InputRemark').value = "폐기 사유: "
    	  return;
    }
    else{
	    $.ajax({
	        type:'POST',
	        url: "./itemDisInsert.do",
	        data: {
	            "dis_codenum": dis_codenum, "dis_date": dis_date, "dis_time": dis_time, "dis_amount": dis_amount, "dis_user": dis_user, "dis_remark": dis_remark
	        },
	        success: function(response){
	            alert('사용 내역 추가가 성공하였습니다.');
	            $("#itemDisModal").modal('hide');
	            loadItemRelTable();
	        },
	        error: function(msg, error) {
	            alert('사용 내역 추가가 실패하였습니다.\n\n※확인 후 다시 시도해주세요.');
	            
	        }
	    });
	}
});
//카테고리 종류 DB에서 따오기
(function() {
  var str = "";
  $.ajax({
    url: "./itemCategorySearch.do",
    type: "post",
    success: function(data) {
      var obj = JSON.parse(data);
      str += "<option selected>카테고리별 분류</option>";
      str += "<option disabled>------------------------------</option>";
      for (var i = 0; i < obj.item.length; i++) {
        str += "<option>" + obj.item[i].i_category + "</option>";
      }
      $("#CategorySearch").html(str);

    },
    error: function() {
      alert("검색할 수 없습니다.");
    },
  });
})();

mainPageOpen();


        </script>
    </body>
</html>
