<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="format-detection" content="telephone=no">
  <title>CMDS</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/static/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/static/css/style.css">
  <link rel="stylesheet" href="/static/css/ep-style.css">
  <!-- endinject -->
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
        <a class="navbar-brand brand-logo" href="/index.html">
			<img src="/static/sample.png" alt="">
        </a>
        <a class="navbar-brand brand-logo-mini" href="/index.html">
			<img src="/static/sample.png" alt="">
        </a>
      </div>


      <div class="navbar-menu-wrapper d-flex align-items-center">

    
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="../nav.jsp" flush="false"/>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
			

			<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4><strong>O&amp;M Check List</strong></h4>
							<div class="wrapper d-flex justify-content-between">
									<div class="row">
									  <div class="col-md-12">
										<div class="form-group row">
										  <label class="col-sm-3 col-form-label">Part</label>
										  <div class="col-sm-9">
											<select id="part-zone" class="form-control" onchange="OnSelectChange(this)">
											  
											</select>
										  </div>
										</div>
										<div id="check-zone">
										</div>										
										<hr />
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright © 2019
            SMI All rights reserved.</span>

          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <script src="/static/vendors/js/vendor.bundle.base.js"></script>
  <script src="/static/vendors/js/vendor.bundle.addons.js"></script>
  <script src="/static/js/off-canvas.js"></script>
  <script src="/static/js/misc.js"></script>
  <script src="/static/js/dashboard.js"></script>
  <script type="text/javascript">
  var brg = [{title : "메인 베어링 폐 그리스 제거" , id : "0"}, {title : "메인 베어링 씰 커버에서 그리스 누유 확인" , id : "1"}];
  var gear = [
	{title : "오일 레벨 및 오일 샘플 확인" , id : "2"},
	{title : "오일 펌프와 기어박스 간 볼트 마킹 확인" , id : "3"},
	{title : "기어박스와 토크 암포크(Armfork)간 볼트 마킹 확인" , id : "4"},
	{title : "기어박스와 오일 탱크 사이의 체결부분에 누유 및 다른 손상이 있는 지 확인" , id : "5"},
	{title : "윤활 배관 누유확인" , id : "6"},
	{title : "기어박스씰(주Seal, Output Shaft Seal, 슬립 링 Seal)부 누유확인" , id : "7"},
	{title : "기어박스 에어브리더의 조립상태 및 실리카겔 색상 확인" , id : "8"},
	{title : "슬립링(슬립 링)의 볼트 마킹 확인" , id : "9"},
	{title : "오일탱크의볼트체결부체결 상태확인" , id : "10"},
	{title : "오일탱크 누유 확인" , id : "11"},
	{title : "오일 레벨 확인" , id : "12"},
	{title : "기어박스 이상 소음확인" , id : "13"},
	{title : "균열 및 변형확인" , id : "14"},
	{title : "부식및도장손상확인" , id : "15"},
	{title : "기어오일필터교체" , id : "16"},
	{title : "기어박스 오일탱크 온도 센서 1 정상 여부 확인" , id : "17"},
	{title : "기어박스 오일 입구 (Elec. 펌프 출구) 온도 센서 1 정상 여부 확인" , id : "18"},
	{title : "기어박스 오일 입구(Elec. 펌프 출구) 온도 센서 2 정상 여부 확인" , id : "19"},
	{title : "기어박스 1단 베어링 온도 센서 정상 여부 확인" , id : "20"},
	{title : "기어박스 3단1번 베어링 온도 센서 정상 여부 확인" , id : "21"},
	{title : "기어박스 3단2번 베어링 온도 센서 정상 여부 확인" , id : "22"},
	{title : "기어박스 Elec. 펌프 오일 입구 압력 센서 1 정상 여부 확인" , id : "23"},
	{title : "기어박스 Elec. 펌프 오일 입구 압력 센서 2 정상 여부 확인" , id : "24"},
	{title : "기어박스 오일 Level 스위치 정상 여부 확인" , id : "25"},
	{title : "기어박스 오일 Level 센서 정상 여부 확인" , id : "26"},
	{title : "기어박스 오일 냉각 팬 저속 동작 정상 여부 확인" , id : "27"},
	{title : "기어박스 오일 냉각 팬 고속 동작 정상 여부 확인" , id : "28"},
	{title : "기어박스 Elec. 오일 펌프 저속 동작 정상 여부 확인" , id : "29"},
	{title : "기어박스 Elec. 오일 펌프 고속 동작 정상 여부 확인" , id : "30"},
	{title : "기어박스 오일 히터 동작 정상 여부 확인" , id : "31"},
	{title : "오일 레벨 및 오일 샘플 확인 - (오일 교체)" , id : "32"},
	{title : "폐오일받이통 오일제거", id : "33"}
	];
  var gen = [
	{title : "발전기 드라이브 샤프트(드라이브 Shaft)와 기어박스 출력" , id : "34"},
	{title : "샤프트(Output Shaft)의 얼라인먼트(Alignment) 확인" , id : "35"},
	{title : "발전기와 댐퍼 간 볼트 마킹 확인" , id : "36"},
	{title : "발전기 윤활 시스템 정상작동 여부 확인" , id : "37"},
	{title : "워터 쿨링 시스템 연결부위 누수 확인" , id : "38"},
	{title : "발전기의 이상소음 확인" , id : "39"},
	{title : "부식 및 도장 손상 확인" , id : "40"},
	{title : "윤활 시스템 확인" , id : "41"},
	{title : "워터 쿨링 시스템 연결부위 누수 확인" , id : "42"},
	{title : "발전기 드라이브 샤프트(드라이브 Shaft)와 기어박스 출력" , id : "43"},
	{title : "샤프트 (Output Shaft)의 얼라인먼트(Alignment) 확인" , id : "44"},
	{title : "발전기의 볼트 마킹 확인" , id : "45"},
	{title : "발전기의 댐퍼 부분 진동 확인" , id : "46"},
	{title : "발전기의 이상소음 확인" , id : "47"},
	{title : "워터 쿨링 시스템 연결부위 누수 확인" , id : "48"},
	{title : "균열 및 변형 확인" , id : "49"},
	{title : "부식 및 도장 손상 확인" , id : "50"},
	{title : "윤활유 받이(trap) 비움" , id : "51"},
	{title : "발전기 고무 댐퍼 피트(발전기 rubber damping feet)와 발전기 캔틸레버(Cantilever) 간 볼트 마킹 확인" , id : "52"},
	{title : "윤활 시스템 확인 및 Grease 부족 시 채우기" , id : "53"},
	{title : "Grounding 브러시 Warning 신호 확인 후 필요 시 교체" , id : "54"},
	{title : "발전기케이블 결선 및 절연 정상 여부 확인" , id : "55"},
	{title : "발전기 보조 기기 접점 정상 여부 확인" , id : "56"},
	{title : "발전기 Encoder 외함 Shield선 연결 정상 여부 확인" , id : "57"},
	{title : "발전기 냉각수 출구 온도 센서 정상 여부 확인" , id : "58"},
	{title : "발전기 냉각 장치 압력 스위치 정상 여부 확인" , id : "59"},
	{title : "발전기 냉각수 입구 온도 센서 1 정상 여부 확인" , id : "60"},
	{title : "발전기 냉각수 입구 온도 센서 2 정상 여부 확인" , id : "61"},
	{title : "발전기 드라이브 방향 (Coupling 부위) 권선 온도 센서 1 정상 여부 확인" , id : "62"},
	{title : "발전기 드라이브 방향 (Coupling 부위) 권선 온도 센서 2 정상 여부 확인" , id : "63"},
	{title : "발전기 드라이브 방향 (Coupling 부위) 권선 온도 센서 3 정상 여부 확인" , id : "64"},
	{title : "발전기 드라이브 방향 (Coupling 부위) 권선 온도 센서 4 정상 여부 확인" , id : "65"},
	{title : "발전기 드라이브 반대 방향(Encoder 부위) 권선 온도 센서 1 정상 여부 확인" , id : "66"},
	{title : "발전기 드라이브 반대 방향(Encoder 부위) 권선 온도 센서 2 정상 여부 확인" , id : "67"},
	{title : "발전기 드라이브 방향 (Coupling 부위) 베어링 온도 센서 정상 여부 확인" , id : "68"},
	{title : "발전기 드라이브 반대 방향(Encoder 부위) 베어링 온도 센서 정상 여부 확인" , id : "69"},
	{title : "발전기 공기냉각 입구 온도 센서 정상 여부 확인" , id : "70"},
	{title : "발전기 공기냉각 출구 온도 센서 정상 여부 확인" , id : "71"},
	{title : "발전기 냉각 펌프 1 동작 정상 여부 확인" , id : "72"},
	{title : "발전기 냉각 펌프 2 동작 정상 여부 확인" , id : "73"},
	{title : "발전기 냉각 팬 1 저속 동작 정상 여부 확인" , id : "74"},
	{title : "발전기 냉각 팬 1 고속 동작 정상 여부 확인" , id : "75"},
	{title : "발전기 냉각 팬 2 저속 동작 정상 여부 확인" , id : "76"},
	{title : "발전기 냉각 팬 2 고속 동작 정상 여부 확인" , id : "77"},
	{title : "발전기 권선 히터 동작 정상 여부 확인" , id : "78"},
	{title : "부식 및 도장 손상 확인" , id : "79"}
];
  var part = [{title : "Main Brg" ,val : "brg", id : "0"}, {title : "GearBox" ,val : "gear", id : "1"}, {title : "Generator" ,val : "gen", id : "2"}];
  
	  $('.click-tr').click(function() {
	    $('.target').toggle('slow');
		});
	  $(document).ready(function() {

		  var pz = $('#part-zone');
		  var tag = 0;
		  $.each(part, function (index, item) { 
			  pz.append(
					"<option id='part_"+item.id+"' value='"+item.val+"'>"+item.title+"</option>"
			    );
		   })
		   
		     $.ajax({
				url:"/page/getPart",
				type: "POST",
		        success: function (data) 
		        {
		        	tag = data;
		        	var list;
		 		   if(tag == 0) list = brg;
		 		   else if(tag == 1) list = gear;
		 		   else if(tag == 2) list = gen;
		 		   
		 		  $("#part_"+tag).prop("selected", true);
		 		   
		 		  //서버에 세션 불러와서 체크 여부 확인.
		 		   var cz = $('#check-zone');
		 		   cz.empty();
		 		   $.each(list, function (index, item) { 
		 			  cz.append(
		 					   "<div class='form-group'>" +
		 			         	  "<div class='form-radio form-radio-flat disabled'>"+
		 			        	     "<label class='form-check-label'>"+
		 			 		 		  "<input type='checkbox' class='form-check-input' name='onh-check' id='"+item.id+"' value='"+item.id+"'>"+item.title+
		 			   		   			"<i class='input-helper'></i>"+
		 					  		  "</label>"+
		 				      	   "</div>"+
		 			  		   "</div>"
		 			    );
		 		   })
		 		   
		 		   $.ajax({
		 				url:"/page/getCheckList",
		 				type: "POST",
		 		        success: function (data) 
		 		        {
		 		        	$.each(data, function (index, item) {
		 		        		$("#" + index).attr("checked", item);
		 		        		$("#" + index).change(function(){
		 		        	        if($("#" + index).is(":checked")){
		 		        	        	 $.ajax({
		 		        	 				url:"/page/checkItemTrue",
		 		        	 				type: "POST",
		 		        	 				data : {"check":index},
		 		        	 		        success: function (data) 
		 		        	 		        {
		 		        	 		        	
		 		        	 		        },
		 		        	 		        error:function(request,status,error){
		 		        	 		        	
		 		        	 		        }
		 		        	 			})
		 		        	        }else{
		 		        	        	$.ajax({
		 		        	 				url:"/page/checkItemFalse",
		 		        	 				type: "POST",
		 		        	 				data : {"check":index},
		 		        	 		        success: function (data) 
		 		        	 		        {
		 		        	 		        	
		 		        	 		        },
		 		        	 		        error:function(request,status,error){
		 		        	 		        	
		 		        	 		        }
		 		        	 			})
		 		        	        }
		 		        	    });
		 		        	})
		 		        },
		 		        error:function(request,status,error){
		 		        	
		 		        }
		 			})
		        },
		        error:function(request,status,error){
		        	
		        }
			})
		   
	       
		   
	  });
	
	  function OnSelectChange(select)
	  {
		    var selectValue = select.value;
		    var list;
		    var partNumber;
		   if(select.value == "brg") 
		   {
			   list = brg; 
			   partNumber = 0; 
		   }
		   else if(select.value == "gear")
		   {
			   list = gear;
			   partNumber = 1;
		   }
		   else if(select.value == "gen")
		   {
			   list = gen; 
			   partNumber = 2;
		   }
		   
		   $.ajax({
				url:"/page/setPart",
				type: "POST",
				data : {"part":partNumber},
		        success: function (data) 
		        {
		        	
		        },
		        error:function(request,status,error){
		        	
		        }
			})
			
		   var cz = $('#check-zone');
		   cz.empty();
		   
		   $.each(list, function (index, item) { 
			   cz.append(
					   "<div class='form-group'>" +
			         	  "<div class='form-radio form-radio-flat disabled'>"+
			        	     "<label class='form-check-label'>"+
			        	     "<input type='checkbox' class='form-check-input' name='onh-check' id='"+item.id+"' value='"+item.id+"'>"+item.title+
			   		   			"<i class='input-helper'></i>"+
					  		  "</label>"+
				      	   "</div>"+
			  		   "</div>"
			    );
		   })
		   $.ajax({
				url:"/page/getCheckList",
				type: "POST",
		        success: function (data) 
		        {
		        	$.each(data, function (index, item) {
		        		$("#" + index).attr("checked", item);
		        		$("#" + index).change(function(){
		        			if($("#" + index).is(":checked")){
		        	        	 $.ajax({
		        	 				url:"/page/checkItemTrue",
		        	 				type: "POST",
		        	 				data : {"check":index},
		        	 		        success: function (data) 
		        	 		        {
		        	 		        	
		        	 		        },
		        	 		        error:function(request,status,error){
		        	 		        	
		        	 		        }
		        	 			})
		        	        }else{
		        	        	$.ajax({
		        	 				url:"/page/checkItemFalse",
		        	 				type: "POST",
		        	 				data : {"check":index},
		        	 		        success: function (data) 
		        	 		        {
		        	 		        	
		        	 		        },
		        	 		        error:function(request,status,error){
		        	 		        	
		        	 		        }
		        	 			})
		        	        }
		        	    });
		        	})
		        },
		        error:function(request,status,error){
		        	
		        }
			})
		}
  </script>
</body>

</html>