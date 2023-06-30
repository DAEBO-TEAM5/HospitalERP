<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/style.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
<title>진료기록</title>


</head>
<body>
	<div class="container-fluid">
	
		<div class="d-flex" id="title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user fa-lg"></i>&nbsp;ㅇㅇ병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="#" class="title-a">진료</a></div>
			<div class="p-2"><a href="#" class="title-a">재고</a></div>
			<div class="p-2"><a href="#" class="title-a">진료기록</a></div>
			  
		</div>
		<div class="container-fluid">
      		<div class="row" style="height: 100%;">

         		<div class="col-md-2" style=" height: 100%; background-color: lightgrey;">
            		<p>
            		<h3 style="text-align: center">진료내역</h3>
            		
            		<form role="form">
	            		<div class="form-group">
	            			<input type="text" id = "search" placeholder="이름/전화번호" class="form-control">
	            		</div>
	            		<div class="form-group">
	            			<button type="submit" class="btn btn-primary" style="width: 100%">검색</button>
	            		</div>
	            		
            		</form>
            		</p>
            		<div class="result" style="background-color: #00AAFF">
	            		양승윤<br>
	            		950522, 남<br>
	            		감기<br>
            		</div>
         		</div>


         		<div class="col-md-4"  style="border-right: 1px solid black;">
            		<form role="form">
               			<div class="form-group">

                  			<label for="exampleInputEmail1"> Email address </label> <input type="email" class="form-control" id="exampleInputEmail1" />
               			</div>
               			<div class="form-group">

                  			<label for="exampleInputPassword1"> Password </label> <input type="password" class="form-control" id="exampleInputPassword1" />
              			</div>
               			<div class="form-group">

                  			<label for="exampleInputFile"> File input </label> <input type="file" class="form-control-file" id="exampleInputFile" />
                 			<p class="help-block">Example block-level help text here.</p>
               			</div>
               			<div class="checkbox">

                  			<label> <input type="checkbox" /> Check me out</label>
               			</div>
               				<button type="submit" class="btn btn-primary">Submit</button>
            		</form>
            
         		</div>


         		<div class="col-md-4" style="border-right: 1px solid black;">
            		<p>
		                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing
		                elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac
		                habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum
		                velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor.
		                Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales
		                nisi id sodales. Proin consectetur, nisi id commodo imperdiet,
		                metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin
		                massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam
		                mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod
		                ultrices massa, et feugiat ipsum consequat eu.</small>
            		</p>
         		</div>

         		<div class="col-md-2">
         
        		</div>
         
         
         
      		</div>
  		</div>
	</div>
	

</body>
</html>