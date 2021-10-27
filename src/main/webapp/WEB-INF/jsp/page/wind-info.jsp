<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<style>
		body {
			font-size: 15px;
		}

		.ep-table-set th, .ep-table-set2 th {
			font-size: 15px;
		}

		.ep-table-set td, .ep-table-set2 td {
			font-size: 15px;
		}
        
        
        /* ie hack */
        #ie-table-set {width:100px \0/IE8;/*IE8적용*/width:100% \0/IE9;/*IE9적용*/ height:50px  \0/IE8+9;/*IE8+9적용*/}
         
	</style>
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
			 			<h4><strong>${unitName}</strong></h4><h5>(FARM Key - ${user.farmKey} CMS Key - ${user.cmsKey})</h5> 
			 		</div>
			 	</div>
			 	</div>
			</div>
			<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body" id="wto-zone">
						<h4><strong>Wind Turbine Operation </strong></h4>
							<div class="wrapper d-flex justify-content-between">
								<div class="side-right">
								  <small class="text-muted text-success ">${turbine.dt.substring(0, 4)}.${turbine.dt.substring(4, 6)} 기준</small>
								</div>
							</div>
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left" style="">
									Wind Info
								</div>
								<div class="side-right" style="">
								   <strong><fmt:formatNumber value="${turbine.windSpeed}" maxFractionDigits="2" pattern=".00"/></strong> <small class=" text-success ">m/s</small>
								</div>
							</div>
							<hr />
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left" style="">
									Wind Direction 
								</div>
								<div class="side-right" style="">
								 <strong><fmt:formatNumber value="${turbine.windDirection}" maxFractionDigits="2" pattern=".00"/></strong> <small class=" text-success ">Deg</small>
								</div>
							</div>
							<hr />
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left" style="">
									Rotor Speed
								</div>
								<div class="side-right" style="">
								 <strong><fmt:formatNumber value="${turbine.rotorSpeed}" maxFractionDigits="2" pattern=".00"/></strong> <small class=" text-success ">rpm</small>
								</div>
							</div>
							<hr />
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left" style="">
									Active Power 
								</div>
								<div class="side-right" style="">
								 <strong><fmt:formatNumber value="${turbine.activePower}" maxFractionDigits="2" pattern=".00"/></strong> <small class=" text-success ">kW</small>
								</div>
							</div>
							<hr />
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left" style="">
									Turbine Status
								</div>
								<div class="side-right" style="">
									<c:choose>
										<c:when test="${turbine.status == 1}">
											<c:set var="turbineStatus" value="Running"/>
										</c:when>
										<c:when test="${turbine.status == 2}">
											<c:set var="turbineStatus" value="Stop"/>
										</c:when>
										<c:when test="${turbine.status == 3}">
											<c:set var="turbineStatus" value="Fault"/>
										</c:when>
										<c:when test="${turbine.status == 4}">
											<c:set var="turbineStatus" value="Service"/>
										</c:when>
										<c:otherwise>
											<c:set var="turbineStatus" value="No Comm"/>
										</c:otherwise>
									</c:choose>
								 <strong class="text-danger">${turbineStatus}</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 style="color:#65dbf8"><strong>SCADA Alarm List</strong></h4>
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left">
									<div class="table-responsive">
										<table class="ep-table-set">
                                            <!-- ie flex css 무효화 처리, table-row 처리 th, td 상속설정 -->
                                            <colgroup id="ie-table-set">
                                                <col width="">
                                                <col width="">
                                                <col width="">
                                                <col width="auto" > 
                                                
                                            </colgroup> 
											<thead>
												<tr>
												  <th>
													Alarm Time
												  </th>
												  <th>
													Level
												  </th>
												  <th>
													Description
												  </th>
												</tr>
											  </thead>
											<tbody id="wtg-zone">
												<c:forEach var="windTurbineGenerator" items="${windTurbineGeneratorList}">
													<tr>
														<td class="font-weight-medium">
															${windTurbineGenerator.dt}
														</td>
														<td class="text-danger">
															${windTurbineGenerator.alarmLevel}
														</td>
														<td>
															${windTurbineGenerator.alarmDesc}
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
			
			
	
			<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 style="color:#ff6d02"><strong>CMS Alarm List</strong></h4>
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left">
									<div class="table-responsive">
										<table class="ep-table-set2 ie-table-set">
                                            <!-- ie flex css 무효화 처리, table-row 처리 th, td 상속설정 -->
                                            <colgroup id="ie-table-set">
                                                <col width="">
                                                <col width="">
                                                <col width="">
                                                <col width="auto" > 
                                                
                                            </colgroup>        
											<thead>
                                                <!-- -ms- hack control css scss, map 설정 변경-->
												<tr>
												  <th>
													Alarm Time
												  </th>
												  <th>
													Level
												  </th>
												  <th>
													Bin
												  </th>
												  <th>
													Description
												  </th>
												</tr>
											  </thead>
											<tbody id="dtv-zone">
												<c:forEach var="driveTrainVibration" items="${driveTrainVibrationList}">
													<tr>
														<td class="font-weight-medium">
															${driveTrainVibration.dt}
														</td>
														<td class="">
															${driveTrainVibration.alarmLevel}
														</td>
														<td class="">
															${driveTrainVibration.binNo}
														</td>
														<td class="">
															${driveTrainVibration.alarmDesc}
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



			<div class="row">
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4><strong>O&amp;M History</strong></h4>
							<div class="wrapper d-flex justify-content-between">
								<div class="side-left">
									<div class="table-responsive">
    
										<table class="ep-table-set">
                                            <!-- ie flex css 무효화 처리, table-row 처리 th, td 상속설정 --> 
                                            <colgroup id="ie-table-set">
                                                <col width="">
                                                <col width="">
                                                <col width="">
                                                <col width="auto" > 
                                            </colgroup> 
											<thead>
											<tr>
												<th>
													Date
												</th>
												<th>
													Time
												</th>
												<th>
													Part
												</th>
												<th>
													Assessment
												</th>
											</tr>
											</thead>
											<tbody id="his-zone">
											<c:forEach var="report" items="${reportList}">
												<tr class="click-tr">
													<td class="font-weight-medium">
														<fmt:formatDate value="${report.registerDate}" pattern="yyyy.MM.dd"/>
													</td>
													<td>
														<fmt:formatDate value="${report.registerDate}" pattern="HH:mm:ss"/>
													</td>
													<td class="text-danger">
															${report.part}
													</td>
													<td>
															${report.assessment}
													</td>
												</tr>
												<tr class="target" data-id="${report.id}">
													<td colspan="4">
														<div class="a-tab">
															<div>
																<p><img style="width:100%; display:block; max-width:100%;" src="/assets/${report.imageTarget}" alt=""/></p>
															</div>
															<hr/>
															<div class="wrapper d-flex justify-content-between">
																<div class="side-left">
																	<strong>Recommend : </strong> <br>
																		${report.recommend}
																</div>
															</div>
														</div>
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
		</div>

	
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright © 2019 SMI All rights reserved.</span>
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
    $('.click-tr').click(function() {
      $('.click-tr').next(':visible').toggle('slow');
      if ($(this).next().hasClass('on')) {
        $('.click-tr').next().removeClass('on');
      } else {
        $('.click-tr').next().removeClass('on');
        $(this).next().toggle('slow');
        $(this).next().addClass('on');
      }
    });
      
      $( document ).ready(function() {
  		  setInterval(function(){loadData()}, 1000);
       });
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    Date.prototype.format = function(f) {
        if (!this.valueOf()) return " ";
     
        var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
        var d = this;
         
        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
            switch ($1) {
                case "yyyy": return d.getFullYear();
                case "yy": return (d.getFullYear() % 1000).zf(2);
                case "MM": return (d.getMonth() + 1).zf(2);
                case "dd": return d.getDate().zf(2);
                case "E": return weekName[d.getDay()];
                case "HH": return d.getHours().zf(2);
                case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                case "mm": return d.getMinutes().zf(2);
                case "ss": return d.getSeconds().zf(2);
                case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                default: return $1;
            }
        });
    };
     
    String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
    Number.prototype.zf = function(len){return this.toString().zf(len);};

      function loadData() {
  	  $.ajax({
  			url:"/api/windInfoLoadData",
  			type: "POST",
  	        success: function (data) {
              var showHisId = $('.click-tr').next('.on').data('id');
  	        	$('#wto-zone').empty();
  	        	$('#wtg-zone').empty();
  	        	$('#dtv-zone').empty();
  	        	$('#his-zone').empty();
  	        	var wto = data.wto;
  	        	var wtg = data.wtg;
  	        	var dtv = data.dtv;
  	        	var his = data.his;
  	       
  	        	var turbineStatus = 0;
  	        	if(wto.status == 1)
				{
  	        		turbineStatus = 'Running';
				}
				else if(wto.status == 2)
				{
					turbineStatus = 'Stop';
				}
				else if(wto.status == 3)
				{
					turbineStatus = 'Fault';
				}
				else if(wto.status == 4)
				{
					turbineStatus = 'Service';
				}
				else
				{
					turbineStatus = 'No Comm';
				}
  	        	
				if (wto.windSpeed) {
					wto.windSpeed = wto.windSpeed.toFixed(2);
				}
  	        	
				if (wto.windDirection) {
					wto.windDirection = wto.windDirection.toFixed(2);
				}
  	        	
				if (wto.rotorSpeed) {
					wto.rotorSpeed = wto.rotorSpeed.toFixed(2);
				}

				if (wto.activePower) {
					wto.activePower = wto.activePower.toFixed(2);
				}
  	        	$('#wto-zone').append(
  	        		"<h4><strong>Wind Turbine Operation </strong></h4>"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-right'>"+
  	  					  "<small class='text-muted text-success '>"+wto.dt.substring(0, 4)+"."+wto.dt.substring(4, 6)+" 기준</small>"+
  	  					"</div>"+
  	  				"</div>"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-left' style=''>"+
  	  						"Wind Info"+
  	  					"</div>"+
  	  					"<div class='side-right' style=''>"+
  	  					   "<strong>"+wto.windSpeed+"</strong> <small class=' text-success '>m/s</small>"+
  	  					"</div>"+
  	  				"</div>"+
  	  				"<hr />"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-left' style=''>"+
  	  						"Wind Direction "+
  	  					"</div>"+
  	  					"<div class='side-right' style=''>"+
  	  					 "<strong>"+wto.windDirection+"</strong> <small class=' text-success '>Deg</small>"+
  	  					"</div>"+
  	  				"</div>"+
  	  				"<hr />"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-left' style=''>"+
  	  						"Rotor Speed "+
  	  					"</div>"+
  	  					"<div class='side-right' style=''>"+
  	  					 "<strong>"+wto.rotorSpeed+"</strong> <small class=' text-success '>rpm</small>"+
  	  					"</div>"+
  	  				"</div>"+
  	  				"<hr />"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-left' style=''>"+
  	  						"Active Power"+
  	  					"</div>"+
  	  					"<div class='side-right' style=''>"+
  	  					 "<strong>"+wto.activePower+"</strong> <small class=' text-success '>kW</small>"+
  	  					"</div>"+
  	  				"</div>"+
  	  				"<hr />"+
  	  				"<div class='wrapper d-flex justify-content-between'>"+
  	  					"<div class='side-left' style=''>"+
  	  						"Turbine Status"+
  	  					"</div>"+
  	  					"<div class='side-right' style=''>"+
  	  					 "<strong class='text-danger'>"+turbineStatus+"</strong>"+
  	  					"</div>"+
  	  				"</div>"
  	        	);
  	        	
  	 		   $.each(wtg, function (index, windTurbineGenerator) { 
	  	 			$('#wtg-zone').append(
	  	 				"<tr>"+
							"<td class='font-weight-medium'>"+
								windTurbineGenerator.dt+
							"</td>"+
							"<td class='text-danger'>"+
								windTurbineGenerator.alarmLevel+
							"</td>"+
							"<td>"+
								windTurbineGenerator.alarmDesc+
							"</td>"+
						"</tr>"
	  	 			);
  	 		   });
  	 		   $.each(dtv, function (index, driveTrainVibration) { 
	  	 			$('#dtv-zone').append(
		  	 				"<tr>"+
								"<td class='font-weight-medium'>"+
									driveTrainVibration.dt+
								"</td>"+
								"<td class=''>"+
									driveTrainVibration.alarmLevel+
								"</td>"+
								"<td class=''>"+
									driveTrainVibration.binNo+
								"</td>"+
								"<td class=''>"+
									driveTrainVibration.alarmDesc+
								"</td>"+
							"</tr>"
		  	 			);
  	 		   });

  	 			$.each(his, function (index, item) {
  	 			  var style = 'display:none;';
  	 			  var addclass = '';
  	 			  if (showHisId === item.id) {
  	 			    style = 'display: table-row;';
                    addclass = 'on';
				  }
  	 				$('#his-zone').append(
	        			 "<tr class='click-tr'>"+
							"<td>"+
								new Date(item.registerDate).format("yyyy.MM.dd")+
							"</td>"+
							"<td>"+
								new Date(item.registerDate).format("HH:mm:ss")+
							"</td>"+
							"<td class='text-danger'>"+
								item.part+
							"</td>"+
							"<td>"+
								item.assessment+
							"</td>"+
						"</tr>"+
						"<tr class='target " + addclass + "' data-id='" + item.id + "' style='" + style + "'>"+
							"<td colspan='6'>"+
								"<div class='a-tab'>"+
									"<div>"+
										"<p><img style='width:100%; display:block; max-width:100%;' src='/assets/"+item.imageTarget+"' alt=''/></p>"+
									"</div>"+
									"<hr/>"+
									"<div class='wrapper d-flex justify-content-between'>"+
										"<div class='side-left'>"+
											"<strong>Recommend : </strong> <br>"+
											item.recommend+
										"</div>"+
									"</div>"+
								"</div>"+
							"</td>"+
						"</tr>"
	 			    );
  	 		   });
              $('.click-tr').click(function() {
                $('.click-tr').next(':visible').toggle('slow');
                if ($(this).next().hasClass('on')) {
                  $('.click-tr').next().removeClass('on');
                } else {
                  $('.click-tr').next().removeClass('on');
                  $(this).next().toggle('slow');
                  $(this).next().addClass('on');
                }
              });
  	        },
  	        error:function(request,status,error){
  	        	// alert(request.responseText);
  	        }
  		})
  	}
  </script>
</body>

</html>