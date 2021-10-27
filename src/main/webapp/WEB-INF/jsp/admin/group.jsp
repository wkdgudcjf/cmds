<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			<div class="col-md-12 grid-margin stretch-card">
            <div class="card">
            <div class="card-body">
				<h4><strong>Group Setting</strong></h4>
				<hr/>
                 	<div class="wrapper">
		                 	<div class="col-12 d-flex">
								<div class="col-8">
									<input type="text" class="form-control" placeholder="Group Name" id="groupName">
								</div>
								<div class="col-4">
									<Button type="button" class="btn btn-success" onClick="addGroup();">추가</Button>
								</div>
							</div>
							<hr/>
							<div class="col-12">
								<strong>Group List</strong>
								<br/>
								<div class="table-responsive">
									<table class="ep-table-set4">
										<thead>
												<tr>
												  <th style="width:60%">
													Group Name
												  </th>
												  <th style="width:20%">
													Select
												  </th>
												  <th style="width:20%">
													Delete
												  </th>
												</tr>
									    </thead>
										<tbody>
										<c:forEach var="group" items="${groupList}">
											<tr>								
											    <td class="font-weight-medium">
												     ${group.groupName}
											   </td>
	                                           <td class="text-danger">
	                                               <button type="button" class="btn btn-outline-primary" onClick="selectGroup(${group.groupID},'${group.groupName}')">선택</button>
	                                           </td>
											   <td class="text-danger">
	                                               <button type="button" class="btn btn-outline-danger" onClick="deleteGroup(${group.groupID})">삭제</button>
	                                           </td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					</div>
					</div>
					</div>
					<div class="row" id="groupSection">
					<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
		            <div class="card-body">
						<strong id="selectGroupName"></strong>
						<hr/>
		                 	<div class="wrapper">
				                 	<div class="col-12 d-flex">
				                 	    <input type="hidden" id="hiddenID">
										<div class="col-4">
											<select id="FARMKeyAdd" class="form-control">
												<option value="-1" selected> FRAM_KEY </option> 
												<c:forEach var="farmKey" items="${farmList}">
													  <option value="${farmKey}">${farmKey}</option>
												</c:forEach>
	                                         </select>
										</div>
										<div class="col-4">
											<select id="CMSKeyAdd" class="form-control">
											    <option value="-1" selected> CMS_KEY </option>
	                                         </select>
										</div>
										<div class="col-4">
											<Button type="button" class="btn btn-success" onClick="addGroupInfo();">추가</Button>
										</div>
									</div>
									<hr/>
									<div class="col-12">
										<div class="table-responsive">
											<table class="ep-table-set4" style="width:100%;">
												<thead>
														<tr>
														  <th style="width:40%">
															Farm Key
														  </th>
														  <th style="width:40%">
															CMS Key
														  </th>
														  <th style="width:20%">
															Delete
														  </th>
														</tr>
											    </thead>
												<tbody id="groupInfoList">
												
												</tbody>
											</table>
									   </div>
								   </div>
							</div>
				    </div>
					</div>
					</div>
					</div>
                </div> 
	        <!-- partial -->
	      </div>
	      <!-- main-panel ends -->
	  </div>
      <!-- content-wrapper ends -->
      </div>
      <!-- partial:partials/_footer.html -->
      <footer class="footer">
        <div class="container-fluid clearfix">
          <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright © 2019
          SMI All rights reserved.</span>
        </div>
      </footer>
  <!-- container-scroller -->
  <script src="/static/vendors/js/vendor.bundle.base.js"></script>
  <script src="/static/vendors/js/vendor.bundle.addons.js"></script>
  <script src="/static/js/off-canvas.js"></script>
  <script src="/static/js/misc.js"></script>
  <script src="/static/js/dashboard.js"></script>
  <script type="text/javascript">
  
  $( document ).ready(function() {
        $('#groupSection').hide();
     });
  
  $('.click-tr').click(function() {
    $('.target').toggle('slow');
	});

  $('#FARMKeyAdd').on('change', function() {
      $.ajax({
          url:"/admin/api/cmsKey",
          data : {"farmKey": $(this).val()},
          success: function (data) {
              $('#CMSKeyAdd').empty();
              $('#CMSKeyAdd').append('<option value="-1" selected> CMS_KEY </option>');
              
              $.each(data , function(idx, val) {
            	  $('#CMSKeyAdd').append('<option value="' + val + '">' + val + '</option>');
              });
          },
          error:function(request,status,error){
              alert(request.responseText);
          }
      })
  });

   function addGroup(){
      if (!$('#groupName').val()) {
          alert('그룹명을 입력해주세요.');
          return false;
      }
		$.ajax({
			url:"/admin/addGroup",
			type: "POST",
			data : {"groupName":$('#groupName').val()},
	        success: function (data) {
	        	location.reload();
	        },
	        error:function(request,status,error){
	        	alert(request.responseText);
	        }
		})
	}
    function deleteGroup(id){
			$.ajax({
				url:"/admin/deleteGroup",
				type: "POST",
				data : {"groupID":id},
		        success: function (data) {
		        	location.reload();
		        },
		        error:function(request,status,error){
		        	alert(request.responseText);
		        }
			})
		}
  
    function addGroupInfo(){
    	 if ($('#FARMKeyAdd').val() == -1) {
             alert('FARM_KEY를 선택하세요.');
             return false;
         }
    	 if ($('#CMSKeyAdd').val() == -1) {
             alert('CMS_KEY를 선택하세요.');
             return false;
         }
   		$.ajax({
			url:"/admin/addGroupInfo",
			type: "POST",
			data : {"groupID":$('#hiddenID').val(),
				"farmKey":$('#FARMKeyAdd').val(),
				"cmsKey":$('#CMSKeyAdd').val()},
	        success: function (data) {
                selectGroup(selectedGroupId, selectedGroupName);
	        },
	        error:function(request,status,error){
	        	alert(request.responseText);
	        }
		})
	}
	var selectedGroupId;
   	var selectedGroupName;
     function selectGroup(id,name) {
         selectedGroupId = id;
         selectedGroupName = name;

    	 $.ajax({
				url:"/admin/selectGroup",
				type: "POST",
				data : {"groupID":id},
		        success: function (data) {
		        	
		        	$('#groupInfoList').empty();
		        	$.each(data, function (index, item) { 
		        		$('#groupInfoList').append(
		 					   "<tr id=tr_"+item.groupInfoID+">" +
		 					       "<td>" +
		 			        	     item.farm_KEY+
		 				      	   "</td>"+
		 				      	   "<td>" +
	 			        	 	     item.cms_KEY+
	 				      	  	   "</td>"+
		 				      	   "<td class='text-danger'>"+
		                             "<button type='button' class='btn btn-outline-danger' onClick='deleteGroupInfo("+
		                             item.groupInfoID+
		                            ")'>삭제</button>"+
		                           "</td>"+
		 			  		   "</tr>"
		 			    );
		 		   })
		        	
		        	$('#hiddenID').val(id);
		        	$('#selectGroupName').text(name);
		        	$('#groupSection').show();
		        },
		        error:function(request,status,error){
		        	alert(request.responseText);
		        }
			})
		}
     function deleteGroupInfo(id){
   		$.ajax({
			url:"/admin/deleteGroupInfo",
			type: "POST",
			data : {"groupInfoID":id},
	        success: function (data) {
	        	$("#tr_"+id.toString()).remove();
	        },
	        error:function(request,status,error){
	        	alert(request.responseText);
	        }
		})
 	}
  </script>
</body>

</html>