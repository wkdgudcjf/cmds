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
            <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright ?? 2019
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
  var brg = [{title : "?????? ????????? ??? ????????? ??????" , id : "0"}, {title : "?????? ????????? ??? ???????????? ????????? ?????? ??????" , id : "1"}];
  var gear = [
	{title : "?????? ?????? ??? ?????? ?????? ??????" , id : "2"},
	{title : "?????? ????????? ???????????? ??? ?????? ?????? ??????" , id : "3"},
	{title : "??????????????? ?????? ?????????(Armfork)??? ?????? ?????? ??????" , id : "4"},
	{title : "??????????????? ?????? ?????? ????????? ??????????????? ?????? ??? ?????? ????????? ?????? ??? ??????" , id : "5"},
	{title : "?????? ?????? ????????????" , id : "6"},
	{title : "???????????????(???Seal, Output Shaft Seal, ?????? ??? Seal)??? ????????????" , id : "7"},
	{title : "???????????? ?????????????????? ???????????? ??? ???????????? ?????? ??????" , id : "8"},
	{title : "?????????(?????? ???)??? ?????? ?????? ??????" , id : "9"},
	{title : "???????????????????????????????????? ????????????" , id : "10"},
	{title : "???????????? ?????? ??????" , id : "11"},
	{title : "?????? ?????? ??????" , id : "12"},
	{title : "???????????? ?????? ????????????" , id : "13"},
	{title : "?????? ??? ????????????" , id : "14"},
	{title : "???????????????????????????" , id : "15"},
	{title : "????????????????????????" , id : "16"},
	{title : "???????????? ???????????? ?????? ?????? 1 ?????? ?????? ??????" , id : "17"},
	{title : "???????????? ?????? ?????? (Elec. ?????? ??????) ?????? ?????? 1 ?????? ?????? ??????" , id : "18"},
	{title : "???????????? ?????? ??????(Elec. ?????? ??????) ?????? ?????? 2 ?????? ?????? ??????" , id : "19"},
	{title : "???????????? 1??? ????????? ?????? ?????? ?????? ?????? ??????" , id : "20"},
	{title : "???????????? 3???1??? ????????? ?????? ?????? ?????? ?????? ??????" , id : "21"},
	{title : "???????????? 3???2??? ????????? ?????? ?????? ?????? ?????? ??????" , id : "22"},
	{title : "???????????? Elec. ?????? ?????? ?????? ?????? ?????? 1 ?????? ?????? ??????" , id : "23"},
	{title : "???????????? Elec. ?????? ?????? ?????? ?????? ?????? 2 ?????? ?????? ??????" , id : "24"},
	{title : "???????????? ?????? Level ????????? ?????? ?????? ??????" , id : "25"},
	{title : "???????????? ?????? Level ?????? ?????? ?????? ??????" , id : "26"},
	{title : "???????????? ?????? ?????? ??? ?????? ?????? ?????? ?????? ??????" , id : "27"},
	{title : "???????????? ?????? ?????? ??? ?????? ?????? ?????? ?????? ??????" , id : "28"},
	{title : "???????????? Elec. ?????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "29"},
	{title : "???????????? Elec. ?????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "30"},
	{title : "???????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "31"},
	{title : "?????? ?????? ??? ?????? ?????? ?????? - (?????? ??????)" , id : "32"},
	{title : "?????????????????? ????????????", id : "33"}
	];
  var gen = [
	{title : "????????? ???????????? ?????????(???????????? Shaft)??? ???????????? ??????" , id : "34"},
	{title : "?????????(Output Shaft)??? ???????????????(Alignment) ??????" , id : "35"},
	{title : "???????????? ?????? ??? ?????? ?????? ??????" , id : "36"},
	{title : "????????? ?????? ????????? ???????????? ?????? ??????" , id : "37"},
	{title : "?????? ?????? ????????? ???????????? ?????? ??????" , id : "38"},
	{title : "???????????? ???????????? ??????" , id : "39"},
	{title : "?????? ??? ?????? ?????? ??????" , id : "40"},
	{title : "?????? ????????? ??????" , id : "41"},
	{title : "?????? ?????? ????????? ???????????? ?????? ??????" , id : "42"},
	{title : "????????? ???????????? ?????????(???????????? Shaft)??? ???????????? ??????" , id : "43"},
	{title : "????????? (Output Shaft)??? ???????????????(Alignment) ??????" , id : "44"},
	{title : "???????????? ?????? ?????? ??????" , id : "45"},
	{title : "???????????? ?????? ?????? ?????? ??????" , id : "46"},
	{title : "???????????? ???????????? ??????" , id : "47"},
	{title : "?????? ?????? ????????? ???????????? ?????? ??????" , id : "48"},
	{title : "?????? ??? ?????? ??????" , id : "49"},
	{title : "?????? ??? ?????? ?????? ??????" , id : "50"},
	{title : "????????? ??????(trap) ??????" , id : "51"},
	{title : "????????? ?????? ?????? ??????(????????? rubber damping feet)??? ????????? ????????????(Cantilever) ??? ?????? ?????? ??????" , id : "52"},
	{title : "?????? ????????? ?????? ??? Grease ?????? ??? ?????????" , id : "53"},
	{title : "Grounding ????????? Warning ?????? ?????? ??? ?????? ??? ??????" , id : "54"},
	{title : "?????????????????? ?????? ??? ?????? ?????? ?????? ??????" , id : "55"},
	{title : "????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "56"},
	{title : "????????? Encoder ?????? Shield??? ?????? ?????? ?????? ??????" , id : "57"},
	{title : "????????? ????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "58"},
	{title : "????????? ?????? ?????? ?????? ????????? ?????? ?????? ??????" , id : "59"},
	{title : "????????? ????????? ?????? ?????? ?????? 1 ?????? ?????? ??????" , id : "60"},
	{title : "????????? ????????? ?????? ?????? ?????? 2 ?????? ?????? ??????" , id : "61"},
	{title : "????????? ???????????? ?????? (Coupling ??????) ?????? ?????? ?????? 1 ?????? ?????? ??????" , id : "62"},
	{title : "????????? ???????????? ?????? (Coupling ??????) ?????? ?????? ?????? 2 ?????? ?????? ??????" , id : "63"},
	{title : "????????? ???????????? ?????? (Coupling ??????) ?????? ?????? ?????? 3 ?????? ?????? ??????" , id : "64"},
	{title : "????????? ???????????? ?????? (Coupling ??????) ?????? ?????? ?????? 4 ?????? ?????? ??????" , id : "65"},
	{title : "????????? ???????????? ?????? ??????(Encoder ??????) ?????? ?????? ?????? 1 ?????? ?????? ??????" , id : "66"},
	{title : "????????? ???????????? ?????? ??????(Encoder ??????) ?????? ?????? ?????? 2 ?????? ?????? ??????" , id : "67"},
	{title : "????????? ???????????? ?????? (Coupling ??????) ????????? ?????? ?????? ?????? ?????? ??????" , id : "68"},
	{title : "????????? ???????????? ?????? ??????(Encoder ??????) ????????? ?????? ?????? ?????? ?????? ??????" , id : "69"},
	{title : "????????? ???????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "70"},
	{title : "????????? ???????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "71"},
	{title : "????????? ?????? ?????? 1 ?????? ?????? ?????? ??????" , id : "72"},
	{title : "????????? ?????? ?????? 2 ?????? ?????? ?????? ??????" , id : "73"},
	{title : "????????? ?????? ??? 1 ?????? ?????? ?????? ?????? ??????" , id : "74"},
	{title : "????????? ?????? ??? 1 ?????? ?????? ?????? ?????? ??????" , id : "75"},
	{title : "????????? ?????? ??? 2 ?????? ?????? ?????? ?????? ??????" , id : "76"},
	{title : "????????? ?????? ??? 2 ?????? ?????? ?????? ?????? ??????" , id : "77"},
	{title : "????????? ?????? ?????? ?????? ?????? ?????? ??????" , id : "78"},
	{title : "?????? ??? ?????? ?????? ??????" , id : "79"}
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
		 		   
		 		  //????????? ?????? ???????????? ?????? ?????? ??????.
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