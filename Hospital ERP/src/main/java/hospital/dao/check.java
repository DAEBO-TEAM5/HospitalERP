%@ page language=java contentType=texthtml; charset=UTF-8 pageEncoding=UTF-8% %@ taglib prefix=c
uri=httpjava.sun.comjspjstlcore%
!DOCTYPE html
html
head
    meta charset=UTF-8 
    meta name=viewport content=width=device-width, initial-scale=1 
    script src=httpsajax.googleapis.comajaxlibsjquery3.5.1jquery.min.jsscript
    !-- Jquery --
    link href=httpscdn.jsdelivr.netnpmbootstrap@5.2.3distcssbootstrap.min.css rel=stylesheet 
    !-- 부트스트랩 --
    script src=httpscdn.jsdelivr.netnpmbootstrap@5.2.3distjsbootstrap.bundle.min.jsscript
    !-- 부트스트랩 --
    link href=${pageContext.request.contextPath }resourcesitem.cssafter rel=stylesheet 
    !-- 사용자css --
    script src=httpskit.fontawesome.comd7766e5822.js crossorigin=anonymousscript
    !-- fontawesome  --
    title재고 관리title
head
body
    div class=container-fluid
        div class=container-fluid info
            cimport url=..includeheader.jspcimport
            div class=row
                div class=col-md-2 style=border 1px solid green; height 100%; background-color lightgrey
                    h2 style=text-align center재고 관리h2
                    div class=form-group
                        div class=item_manage_memobox
                            왜 안나올까
                            table class=item_manage_memobox_table
                                tr
                                    th번호th
                                tr
                                tr
                                    th제품명th
                                tr
                                tr
                                    td재고td
                                tr
                                tr
                                    td재고수량td
                                tr
                                tr
                                    td메모td
                                tr
                                tr
                                    td메모내용td
                                tr
                            table
                        div
                    div
                    div style=border3px solid pink; padding 10px;이건 나오니div
                div
                !-- 아래왼쪽섹션 --

                div class=col-md-10 style=background-color white
                    div
                        button type=button id=item_maintable class=btn btn-primary item_btn_click
                        	품목 관리
                        button&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        button type=button id=item_release class=btn btn-secondary item_btn_nonclick
                            출고 관리
                        buttonbr 
                    div
                    div class=input-itemsort
                        select class=form-select
                            option selected대분류option
                            option약품을option
                            option요롷게option
                            option나누자option
                        select
                        select class=form-select
                            option selected중분류option
                            option중분류는option
                            option이렇게option
                            option나눠보자option
                        select

                        div class=input-itemsearch
                            i class=fa-solid fa-magnifying-glassi
                            input
                                class=input-searchfilter
                                type=text
                                placeholder=검색어 입력 (이름품목코드)
                            
                        div
                    div

                    div class=main_page
                        !--품목관리--
                        div class=item_checkbox
                            input type=checkbox id=StockFiveCheck onchange=filterItems()  재고가 5개 이하인
                            품목만 표시
                        div
                        div
                            table id=mainTable class=item_table_main
                                tr
                                    td테이블을 불러오고 있습니다...td
                                tr
                            table
                        div

                            
                            !-- 모달 (아이템 입고 추가) 시작  --
                            div  class=modal fade  id=staticBackdrop  data-bs-backdrop=static  data-bs-keyboard=false  tabindex=-1  aria-labelledby=staticBackdropLabel
                                aria-hidden=true  
                                div class=modal-dialog modal-xl modal-dialog-scrollable
                                    div class=modal-content
                                        div class=modal-header
                                            h5 class=modal-title id=staticBackdropLabelModal titleh5
                                            button
                                                type=button
                                                class=btn-close
                                                data-bs-dismiss=modal
                                                aria-label=Close
                                            button
                                        div
                                        div class=modal-body
                                            table class=table tablemodal page=main_ins_modal
                                                tbody
                                                    div class=insert_div
                                                        tr class=nodelete
                                                            td품목코드td
                                                            tdinput type=text placeholder=품목코드 td
                                                            td단위td
                                                            tdinput type=text placeholder=단위 td
                                                            td재고량td
                                                            tdinput type=text placeholder=재고량 td
                                                        tr
                                                        tr class=nodelete
                                                            td유통기한td
                                                            tdinput type=text placeholder=유통기한 td
                                                            td물품단가td
                                                            tdinput type=text placeholder=물품단가 td
                                                            td비고td
                                                            tdinput type=text placeholder=비고 td
                                                            td colspan=2
                                                                button
                                                                    class=btn btn-danger
                                                                    onClick=item_modalDelBtnHandler(event)
                                                                
                                                                    X
                                                                button
                                                            td
                                                        tr
                                                    div
                                                tbody
                                            table

                                            button
                                                type=button
                                                class=btn btn-secondary
                                                id=modal_addItem
                                                onClick=tableAddBtnHandler()
                                            
                                                항목추가
                                            button
                                        div
                                        div class=modal-footer
                                            button type=button class=btn btn-secondary data-bs-dismiss=modal
                                                Close
                                            button
                                            button type=submit class=btn btn-primary id=insert_submit
                                                등록
                                            button
                                        div
                                    div
                                div
                            div !-- 모달 (아이템 입고 추가) 끝  --
                            
                            
                            
                            !-- 모달(아이템 입고 수정)시작 --
            	div class=modal fade id=itemModifyModal tabindex=-1 data-bs-backdrop=static aria-labelledby=itemModifyModalLabel aria-hidden=true
					div class=modal-dialog  modal-lg  modal-dialog-centered  modal-dialog-scrollable 
						div class=modal-content
							div class=modal-header
								h5 class=modal-title id=itemModifyModalLabel재고 수정h5
								button type=button class=close data-bs-dismiss=modal aria-label=Close
									span aria-hidden=true&times;span
								button
							div
							div class=modal-body
								form role=form id=itemModifyForm
									
									table class =table tablemodal
										tr
											td
												label for=InputNum입고번호label
												input type=text class=form-control id=InputNum disabled=disabled 
											td
											td							
												label for=InputName품명label 
												input type=text class=form-control id=InputtName disabled=disabled 
											td
										tr
										tr
											td
												label for=InputCode품목코드label 
												input type=text class=form-control id=InputCode disabled=disabled 
											td
											td										
												label for=InputCategory카테고리label 
												input type=text class=form-control id=InputCategory readonly
											td
										tr
										tr
											td										
												label for=InputUnit단위label
												input type=text class=form-control id=InputUnit
											td
											td
												label for=InputStock재고량label
												input type=text class=form-control id=InputStock
											td
										tr
										tr
											td
												label for=InputExpire유통기한label
												input type=text class=form-control id=InputExpire
											td
											td
												label for=InputPrice물품단가label
												input type=text class=form-control id=InputPrice
											td
										tr
										tr
											td
												label for=InputRemark비고label
												input type=text class=form-control id=InputRemark
											td
										tr
									table
									br

							div class=modal-footer
								button type=button class=btn btn-secondary data-bs-dismiss=modal닫기button
								button type=submit id= class=btn btn-primary접수button
							div
							
							form

							div
							
						div
					div
				div!-- 모달(아이템 입고 수정)끝 --
                            
                            
                      div
                           button type=button class=btn btn-primary data-bs-toggle=modal data-bs-target=#staticBackdrop
                                추우가아버어트은
                            button
                            button type=button id=item_DeleteButton class=btn btn-secondary 
                                삭222222222222222222222제
                            button
                            button type=button id=item_ModifyButton class=btn btn-secondary data-bs-target=#itemModifyModal
                            	수2222정
                            button
                            button type=button id=select_cancel class=btn btn-secondary 
                            	선택 전체해제
                            button
                            br
                       div
                       
    			   div !--품목관리 (메인)end--

                    div class=rel_page style=display none
                        !-- 출고관리 --
                        div class=RelreaseCheck item_checkbox
                            input type=checkbox class=use_Check checked  사용 내역
                            input type=checkbox class=dis_Check checked  폐기 내역
                        div
                        div
                            table id=RelTable class=item_table_main
                                tr
                                    td테이블을 불러오고 있습니다...td
                                tr
                            table
                        div
                    div !-- 출고관리 end --
                    
                    
                    
                    
                div!-- 오른쪽섹션 --
            div!-- row--
        div !-- container-fluid info --
    div!-- 전체 container-fluid --


script type=textjavascript

$(document).ready(function () {
    $(#item_maintable).click(function () {
        $(.main_page).show();
        $(.rel_page).hide();
        $(.input-searchfilter).val();
        filterTableBySearch();
        $(#StockFiveCheck).prop(checked, false);
        filterItems();
        removeClickActive(); 
    });
    var str = ;
    $.ajax({
        url .itemMainTable.do,
        type post,
        success function (data) {
            var obj = JSON.parse(data);
            str +=
                trthindexthth입고번호thth품명thth품목코드thth카테고리thth단위thth재고량thth유통기한thth물품단가thth비고thtr;
            for (var i = 0; i  obj.item.length; i++) {
                str += tr;
                str += td main-column='index' + (i + 1) + td;
                str += td main-column='inum' + obj.item[i].i_num + td;
                str += td main-column='name' + obj.item[i].i_name + td;
                str += td main-column='code' + obj.item[i].i_code + td;
                str += td main-column='category' + obj.item[i].i_category + td;
                str += td main-column='unit' + obj.item[i].i_unit + td;
                str += td main-column='stock' + obj.item[i].i_stock + td;
                str += td main-column='expire' + obj.item[i].i_expire + td;
                str += td main-column='price' + obj.item[i].i_price + td;
                str += td main-column='remark' + obj.item[i].i_remark + td;
                str += tr;
            }
            $(#mainTable).html(str);
            filterItems();
        },
        error function () {
            alert(검색할 수 없습니다.);
        },
    });
});


5개이하 재고품목 확인 체크박스 실시간
$(#StockFiveCheck).change(function () {
    filterItems();
});


품목관리, 출고관리별 검색필터 다르게
$(.input-searchfilter).on(input, function () {
    if ($(.main_page).is(visible)) {
        filterItems();
    } else if ($(.rel_page).is(visible)) {
        filterTableBySearch();
    }
});


5개이하 재고품목 확인
function filterItems() {
    var checkbox = $(#StockFiveCheck);
    var search_input = $(.input-searchfilter).val();
    var main_table = $(#mainTable tr);
    var count = 1;

    main_table.each(function (index) {
        if (index  0) {
            var stock = parseInt($(this).find('td[main-column=stock]').text());
            var name = $(this).find('td[main-column=name]').text();
            var code = $(this).find('td[main-column=code]').text();
            var main_index = $(this).find('td[main-column=index]');

            if ((checkbox.is(checked) && stock = 5)  !checkbox.is(checked)) {
                if (name.includes(search_input)  code.includes(search_input)  search_input === ) {
                    main_index.text(count++);
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


function filterTableBySearch() {
    var search_input = $(.input-searchfilter).val();
    var main_search = $(#mainTable tr);
    var rel_search = $(#RelTable tr);

     품목 관리 검색
    main_search.each(function (index) {
        if (index  0) {
            var main_name = $(this).find('td[main-column=name]').text();
            var main_code = $(this).find('td[main-column=code]').text();
            var main_index = $(this).find('td[main-column=index]');

            if (
                main_name.includes(search_input) 
                main_code.includes(search_input) 
                search_input === 
            ) {
                main_index.text(index);
                $(this).show();
            } else {
                $(this).hide();
            }
        }
    });

     출고 관리 검색
    rel_search.each(function (index) {
        if (index  0) {
            var rel_name = $(this).find('td[rel-column=name]').text();
            var rel_code = $(this).find('td[rel-column=code]').text();

            if (rel_name.includes(search_input)  rel_code.includes(search_input)  search_input === ) {
                $(this).show();
            } else {
                $(this).hide();
            }
        }
    });
}


출고 관리 load
$(function () {
    $(#item_release).click(function () {
        $(.main_page).hide();
        $(.rel_page).show();
        $(.input-searchfilter).val();
        filterTableBySearch();
        $(.use_Check).prop(checked, true);
        $(.dis_Check).prop(checked, true);
        filterRelrease();
        removeClickActive();
        
        var str = ;
        $.ajax({
            url .itemRelTable.do,
            type post,
            success function (data) {
                var obj = JSON.parse(data);
                str +=
                    trth사용 날짜thth사용 시간thth품명thth품목코드thth카테고리thth사용량thth잔여량thth사용자thth비고(폐기 여부)thtr');
                for (var i = 0; i  obj.item.length; i++) {
                    str += tr;
                    str += td + obj.item[i].rel_date + td;
                    str += td + obj.item[i].rel_time + td;
                    str += td rel-column='name' + obj.item[i].i_name + td;
                    str += td rel-column='code' + obj.item[i].rel_i_code + td;
                    str += td + obj.item[i].i_category + td;
                    str += td + obj.item[i].rel_amount + td;
                    str += td + obj.item[i].i_stock + td;
                    str += td + obj.item[i].rel_user + td;
                    str += td rel-column='remark' + obj.item[i].rel_remark + td;
                    str += tr;
                }
                $(#RelTable).html(str);
                filterRelrease();
            },
            error function () {
                alert(검색할 수 없습니다.);
            },
        });
    });
});


$(.RelreaseCheck).change(function () {
    $(.input-searchfilter).val();
    filterRelrease();
});


function filterRelrease() {
    var useCheck = $(.use_Check);
    var disCheck = $(.dis_Check);
    var rel_table = $(#RelTable tr);
    var rel_table_header = $(#RelTable trfirst-child);

    if (useCheck.is(checked) && disCheck.is(checked)) {
        rel_table.show();
    } else if (!useCheck.is(checked) && disCheck.is(checked)) {
        rel_table.each(function (index) {
            if (index === 0  $(this).find('td[rel-column=remark]').text().includes(폐기)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    } else if (useCheck.is(checked) && !disCheck.is(checked)) {
        rel_table.each(function (index) {
            if (index === 0  !$(this).find('td[rel-column=remark]').text().includes(폐기)) {
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


function clearModalText() {
    $('table[page=main_ins_modal] input[type=text]').val();
    $(table[page='main_ins_modal'] tbody  tr).not(.nodelete).remove();
    $('table[page=main_ins_modal]').not('first').remove();
}


 모달 닫기 이벤트 처리
$(#staticBackdrop).on(hidden.bs.modal, function () {
    clearModalText();  모달 내의 텍스트 초기화
});


 item 추가 모달 내 항목추가된것 삭제
function item_modalDelBtnHandler(event) {
    const select_row = $(event.target).closest(tr);
    const front_row = select_row.prev(tr);
    select_row.add(front_row).remove();
}


function tableAddBtnHandler() {
    const [tr1, tr2] = itemTableElement();
    document.querySelector(table[page='main_ins_modal']  tbody).appendChild(tr1);
    document.querySelector(table[page='main_ins_modal']  tbody).appendChild(tr2);
}


insert 모달 항목추가
function itemTableElement() {
    const tr1 = document.createElement(tr);
    tr1.innerHTML = `
		td품목코드td
		tdinput type=text placeholder=품목코드td
		td단위td
		tdinput type=text placeholder=단위td
		td재고량td
		tdinput type=text placeholder=재고량 td
`	;
               const tr2 = document.createElement(tr);
               tr2.innerHTML = `
		td유통기한td
		tdinput type=text placeholder=유통기한 td
		td물품단가td
		tdinput type=text placeholder=물품단가td
		td비고td
		tdinput type=text placeholder=비고 td
		td colspan=2
			button class=btn btn-danger onClick=item_modalDelBtnHandler(event)
	    	 X
	   		button
		td
	`;
               return [tr1, tr2];
           }
           모달내의 등록제출시 sql insert
           
           
$(#insert_submit).click(function () {
    var items = [];  항목들을 담을 배열
    const trs = document.querySelectorAll(table[page='main_ins_modal'] tr);
    for (let i = 0; i  trs.length; i += 2) {
        let tr1 = trs[i];
        let tr2 = trs[i + 1];
        let item = {
            itemCode tr1.querySelector('input[placeholder=품목코드]').value,
            itemUnit tr1.querySelector('input[placeholder=단위]').value,
            itemStock tr1.querySelector('input[placeholder=재고량]').value,
            itemExpire tr2.querySelector('input[placeholder=유통기한]').value,
            itemPrice tr2.querySelector('input[placeholder=물품단가]').value,
            itemRemark tr2.querySelector('input[placeholder=비고]').value,
        };
        items.push(item);
	}

	var data = {
        itemList items,  리스트 형태로 데이터 전달
	};

     서버로 데이터 전송하는 Ajax 요청
    $.ajax({
        url .itemInsert.do,
        type post,
        data JSON.stringify(items),  데이터 전달 (수정된 부분)
        contentType applicationjson,  데이터 형식 지정
        success function (response) {
            alert(데이터베이스에 항목들이 삽입되었습니다.);
            $(#staticBackdrop).modal(hide);  모달 닫기
            reload();
        },
        error function () {
            alert(
                데이터베이스 삽입 중 오류가 발생했습니다. nn※사용하지 않는 칸은 제거해주세요. n※재고량과 물품단가는 숫자로 입력해주세요.
            );
        },
    });
});
           
           
function reload() {
    페이지 새로고침
    (location  window.location  document.location).reload();
}


$(.item_table_main).on(click, trnot(first-child), function () {
    $(this).toggleClass(click_active);
});

function removeClickActive() {
	  $(.item_table_main trnot(first-child)).removeClass(click_active);
}

$(#select_cancel).on(click, function () {
	 removeClickActive();
});

	
$(#item_DeleteButton).click(function () {
    var itemDels = [];
    var active_rows = $(.item_table_main tr.click_active);  var 
    if (active_rows.length === 0) {
        alert(삭제할 항목을 선택한 후 눌러주세요.);
        return;
    } else {
        active_rows.each(function () {
            var active_row = $(this);
            var itemId = active_row.find('td[main-column=inum]').text();
            var itemDel = {
                iNum itemId,
            };

            itemDels.push(itemDel);
        });
    }
    var data = {
        itemDelList itemDels,  리스트 형태로 데이터 전달
    };
    console.log(data);
     서버로 삭제 요청 보내기
    $.ajax({
        url .itemDelete.do,
        type post,
        data JSON.stringify(itemDels),  데이터 전달 (수정된 부분)
        contentType applicationjson,  데이터 형식 지정
        success function (response) {
             삭제 작업 성공 시 클라이언트에서 UI 갱신 또는 메시지 표시 등의 작업 수행
            alert(항목이 성공적으로 삭제되었습니다.);
            reload();
        },
        error function (error) {
            alert(항목 삭제 중 오류가 발생했습니다.);
        },
    });
});

 
 $(document).on('click', '#item_ModifyButton', function() {
    var select_rows = $(.item_table_main tr.click_active);
    if (selectedRows.length === 0) {
    	removeClickActive();
        alert(수정할 항목을 선택한 후 눌러주세요.);
        return;
    } else if (select_rows.length === 1) {
        var selectedRow = select_rows.first();
        var inum = select_row.find('td[main-column=inum]').text();
        var name = select_row.find('td[main-column=name]').text();
        var code = select_row.find('td[main-column=code]').text();
        var category = select_row.find('td[main-column=category]').text();
        var unit = select_row.find('td[main-column=unit]').text();
        var stock = select_row.find('td[main-column=stock]').text();
        var expire = select_row.find('td[main-column=expire]').text();
        var price = select_row.find('td[main-column=price]').text();
        var remark = select_row.find('td[main-column=remark]').text();

        $('#InputNum').val(inum);
        $('#InputtName').val(name);
        $('#InputCode').val(code);
        $('#InputCategory').val(category);
        $('#InputUnit').val(unit);
        $('#InputStock').val(stock);
        $('#InputExpire').val(expire);
        $('#InputPrice').val(price);
        $('#InputRemark').val(remark);

        $('#itemModifyModal').modal('show');
        
    }else{
    	removeClickActive();
        alert(수정은 한 항목만 가능합니다.);
        return;
    }
    
}); 

 $(document).ready(function(){
	$('#itemModifyForm').submit(function(event){
		modify_submit();
		return false;
	});
});

function modify_submit(){
	var inum = document.getElementById('#InputNum').value;
	var name = document.getElementById('#InputName').value;
	var code = document.getElementById('InputCode').value;
	var category = document.getElementById('InputCategory').value;
	var unit = document.getElementById('InputUnit').value;
	var stock = document.getElementById('InputStock').value;
	var expire = document.getElementById('InputExpire').value;
	var price = document.getElementById('InputPrice').value;
	var remark = document.getElementById('InputRemark').value;
	
	
	$.ajax({
		type'POST',
		url .itemUpdate.do,
		data {inuminum, namename, codecode, categorycategory, unitunit, stockstock,
				expireexpire, priceprice, remarkremark },
		success function(response){
			alert('변경이 완료되었습니다');
			$(#patientModal).modal('hide');
			
		},
		error function(msg, error) {
			alert(error);
		}
	});
} 





        script
    body
html
