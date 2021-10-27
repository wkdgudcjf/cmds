<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="overflow-y: scroll;">

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
  <!-- endinject -->

<style type="text/css">
.panel {
  position: absolute;
  margin: 0;
  padding: 0;
  padding: 10px;
  margin-left: 10px;
  background: #2c3e50;
  color: white;
  z-index: 3;
}

.control {
  width: 300px;
}

button {
  display: inline-block;
  border: none;
  width: 100%;
  padding: 10px;
  background: #3498db;
  color: white;
  cursor: pointer;
  outline: none;
  border-bottom: 1px solid #2980b9;
  border-left: 3px solid #e67e22;
  font-family: monospace;
  transition: all ease 0.3s;
}

button:hover {
  background: #2980b9;
  border-left: 3px solid #e74c3c;
}

button:active {
  background: #3498db;
}

#log {
  margin-bottom: 12px;
}

.turbine_status_0 {
    color: rgb(170, 171, 171);
}

.turbine_status_1 {
    color: rgb(237, 86, 100);
}

.turbine_status_2 {
    color: rgb(79, 192, 232);
}

.turbine_status_3 {
    color: rgb(255, 206, 86);
}

.turbine_status_4 {
    color: rgb(196, 239, 246);
}

.turbine-title {
	height:20%;
	color:#fff;
	text-align: center;
	padding-top:8px;
}

.upper {
	width:100%;
	height:55%;
	position:absolute;
	top:0;
	text-align: center;
}

.lower {
	display: flex;
	align-items: center;
	justify-content: center;
	width:50%;
	height:40%;
	position: absolute;
	top:57.2%;
	left:25%;
	line-height:100%;
	text-align: center;
}

.lower-wrapper {
	width: 100%;
	display: block;
	vertical-align:middle;
}
/* desktop */
@media screen and (min-width: 992px) {
	.turbine-title {
		font-size: 1.3rem
	}
}

/* tablet */
@media screen and (max-width: 991px) and (min-width: 768px) {
	.turbine-title {
		font-size: 1.1rem
	}
}

/* mobile */
@media screen and (max-width: 767px) {
	.turbine-title {
		font-size: 0.9rem
	}

	.margin-xs-1 {
		margin-top: 0.1rem !important;
	}
}

.hidden {
	display: none !important;
}

.active-power {
	text-decoration: none;
	color: black;
}

.wind-speed {
	text-decoration: none;
	color: black;
}

@media screen and (max-width: 360px) {
  .brand-logo-mini img {
    width: 150px !important;
    height: 28px !important;
  }
  .brand-logo img {
    width: 247px !important;
    height: 50px !important;
  }

  .turbine-card {
    flex: 0 0 100% !important;
    max-width: 80% !important;
    min-width: 190px !important;
  }

  .row {
    justify-content: center;
  }
}

@media screen and (min-width: 361px) {
  .brand-logo img,
  .brand-logo-mini img {
    width: 247px !important;
    height: 50px !important;
  }
  .navbar-brand-wrapper {
    width: 247px !important;
  }
}


@media screen and (max-width: 250px) {
  .navbar {
    min-width: 225px !important;
  }
}

.main-d-flex {
	display: flex !important;
}

.main-justify-content-between {
	justify-content: space-between !important;
}
    
/* ie hack */
#ie-table-set {width:100px \0/IE8;/*IE8적용*/width:100% \0/IE9;/*IE9적용*/ height:50px  \0/IE8+9;/*IE8+9적용*/}
    
</style>
</head>
<body>
	<!-- Image preloading -->
	<img class="hidden" src="/static/images/TurbineUnit_NOCOMM.png"/>
	<img class="hidden" src="/static/images/TurbineUnit_RUN.png"/>
	<img class="hidden" src="/static/images/TurbineUnit_STOP.png"/>
	<img class="hidden" src="/static/images/TurbineUnit_FAULT.png"/>
	<img class="hidden" src="/static/images/TurbineUnit_SERVICE.png"/>
	<img class="hidden" src="/static/images/0.png"/>

  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top main-d-flex flex-row">
      <div class="text-center navbar-brand-wrapper main-d-flex align-items-top justify-content-center">
        <a class="navbar-brand brand-logo" href="/index.html">
			<img src="/static/sample.png" alt="">
        </a>
        <a class="navbar-brand brand-logo-mini" href="/index.html">
			<img src="/static/sample.png" alt="">
        </a>
      </div>


      <div class="navbar-menu-wrapper main-d-flex align-items-center">

    
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <div class="container-fluid page-body-wrapper">
    <!-- partial -->
    <jsp:include page="nav.jsp" flush="false"/>
    <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
				<div class="row" id="turbine-zone">
					<c:forEach var="turbine" items="${turbineList}">
            <div id="turbine-${turbine.farmKey}-${turbine.cmsKey}" class="col-xs-12 col-xl-4 col-lg-4 col-md-4 col-6 col-sm-4 grid-margin stretch-card turbine-card">
							<div class="card card-statistics " style="cursor: pointer;background:transparent;" onclick="goToWindInfo(${turbine.farmKey},${turbine.cmsKey})">
								<div style="position: relative;flex: 0 0 auto;">
								<c:choose>
											<c:when test="${turbine.status == 0}">
												<img class='status-image' src="/static/images/TurbineUnit_NOCOMM.png" style="width:100%;" alt="">
											</c:when>
											<c:when test="${turbine.status == 1}">
												<img class='status-image' src="/static/images/TurbineUnit_RUN.png" style="width:100%;" alt="">
											</c:when>
											<c:when test="${turbine.status == 2}">
												<img class='status-image' src="/static/images/TurbineUnit_STOP.png" style="width:100%;" alt="">
											</c:when>
											<c:when test="${turbine.status == 3}">
												<img class='status-image' src="/static/images/TurbineUnit_FAULT.png" style="width:100%;" alt="">
											</c:when>
											<c:when test="${turbine.status == 4}">
												<img class='status-image' src="/static/images/TurbineUnit_SERVICE.png" style="width:100%;" alt="">
											</c:when>
										</c:choose>
										
										
									<div class="clearfix">
                                        <c:choose>
                                            <c:when test="${1 <= turbine.status and turbine.status <= 4}">
                                                <c:set var="turbineStatus" value="${turbine.status}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="turbineStatus" value="0"/>
                                            </c:otherwise>
                                        </c:choose>
										
										
										<div class="upper">
											<h5 class="turbine-title unit-name">${turbine.unitName}</h5>
											<fmt:formatNumber var="roundWindDirection" value="${turbine.windDirection}" maxFractionDigits="2"/>
											<c:set var="divideWindDirection" value="${(roundWindDirection + 11.25)/22.5}"/>
											<c:set var="floorDivideWindDirection" value="${divideWindDirection - (divideWindDirection % 1)}"/>
											<c:set var="degree" value="${((floorDivideWindDirection % 16) * 22.5)}"/>
											<img class="propeller" src="/static/images/0.png" style="height:60%;transform:rotate(${degree}deg);"/>
										</div>

										<div class="lower">
											<div class="lower-wrapper">
												<div class="wrapper" style="text-align: center;">
		                                            <c:choose>
		                                                <c:when test="${turbine.windSpeed < 5}">
		                                                    <c:set var="windSpeedColor" value="rgb(0,0,0)"/>
		                                                </c:when>
		                                                <c:when test="${turbine.windSpeed < 10}">
		                                                    <c:set var="windSpeedColor" value="rgb(255,255,0)"/>
		                                                </c:when>
		                                                <c:otherwise>
		                                                    <c:set var="windSpeedColor" value="rgb(255,0,0)"/>
		                                                </c:otherwise>
		                                            </c:choose>
													<div class="main-d-flex main-justify-content-between">
														<p class="mb-1 wind-speed"><fmt:formatNumber value="${turbine.windSpeed}" maxFractionDigits="2" pattern=".00"/></p>
														<p class="mb-1">m/s</p>
													</div>
													<div class="progress">
														<div class="progress-bar progress-bar-striped progress-bar-animated wind-speed-progress"
															role="progressbar"
															style="width:${turbine.windSpeed/15*100}%;background-color:${windSpeedColor};"
															aria-valuenow="${turbine.windSpeed}"
															aria-valuemin="0"
															aria-valuemax="15"></div>
													</div>
												</div>
												<div class="wrapper margin-xs-1 mt-2" style="width:100%;text-align: center;">
		                                            <c:choose>
		                                                <c:when test="${turbine.activePower < 1700}">
		                                                    <c:set var="activePowerColor" value="rgb(0,0,0)"/>
		                                                </c:when>
		                                                <c:when test="${turbine.activePower < 3300}">
		                                                    <c:set var="activePowerColor" value="rgb(255,255,0)"/>
		                                                </c:when>
		                                                <c:otherwise>
		                                                    <c:set var="activePowerColor" value="rgb(255,0,0)"/>
		                                                </c:otherwise>
		                                            </c:choose>
													<div class="main-d-flex main-justify-content-between">
														<p class="mb-1 active-power"><fmt:formatNumber value="${turbine.activePower}" maxFractionDigits="2" pattern=".00"/></p>
														<p class="mb-1">kW</p>
													</div>
													<div class="progress">
														<div class="progress-bar progress-bar-striped progress-bar-animated active-power-progress"
															role="progressbar"
															style="width:${turbine.activePower/5000*100}%;background-color:${activePowerColor};"
															aria-valuenow="${turbine.activePower}"
															aria-valuemin="0"
															aria-valuemax="5000"></div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright © 2019I All rights reserved.</span>

          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="/static/vendors/js/vendor.bundle.base.js"></script>
  <script src="/static/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="/static/js/off-canvas.js"></script>
  <script src="/static/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="/static/js/dashboard.js"></script>
  <!-- End custom js for this page-->

	<script type="text/javascript">
	$(document).ready(function() {
		setInterval(loadData, 1000);
	});

	function loadData() {
		$.ajax({
			url:"/api/indexLoadData",
			type: "POST",
	        success: function (data) {
				var renderedTurbineMap = {};

				$.each(data, function (index, turbine) {
					var turbineStatus = 0;

					if (1 <= turbine.status&&turbine.status <= 4) {
						turbineStatus = turbine.status;
					} else {
						turbineStatus = 0;
					}

					var roundWindDirection = (turbine.windDirection).toFixed(1); //  소수점 1자리 (올림)
					var divideWindDirection = (parseFloat(roundWindDirection) + 11.25)/22.5;
					var floorDivideWindDirection = parseFloat(divideWindDirection) - (parseFloat(divideWindDirection) % 1);
					var degree = ((parseFloat(floorDivideWindDirection) % 16) * 22.5);
					var activePowerColor = 0;

					if (turbine.activePower < 1700) {
						activePowerColor = 'rgb(0,0,0)';
					} else if(turbine.activePower < 3300) {
						activePowerColor = 'rgb(255,255,0)';
					} else {
						activePowerColor = 'rgb(255,0,0)';
					}

					var activePowerProgress = turbine.activePower/5000*100;
					var windSpeedColor = 0;

					if (turbine.windSpeed < 5) {
						windSpeedColor = 'rgb(0,0,0)';
					} else if(turbine.windSpeed < 10) {
						windSpeedColor = 'rgb(255,255,0)';
					} else {
						windSpeedColor = 'rgb(255,0,0)';
					}

					var windSpeedTemp = (turbine.windSpeed).toFixed(2); // 소수점 2자리 (올림)
					var windSpeedProgress = turbine.windSpeed/15*100;
					var backgroundImageNames = [ 'NOCOMM', 'RUN', 'STOP', 'FAULT', 'SERVICE' ];
					var backgroundImage = '/static/images/TurbineUnit_' + backgroundImageNames[turbineStatus] + '.png';
					var id = 'turbine-' + turbine.farmKey + '-' + turbine.cmsKey;
					var elem = document.getElementById(id);

					renderedTurbineMap[id] = true;

					if (turbine.windSpeed) {
						turbine.windSpeed = turbine.windSpeed.toFixed(2);
					}

					if (turbine.activePower) {
						turbine.activePower = turbine.activePower.toFixed(2);
					}

					if (elem) {
						$('#' + id + ' .unit-name').html(turbine.unitName);
						$('#' + id + ' .propeller').css({
							'transform': 'rotate(' + degree + 'deg)'
						});

						$('#' + id + ' .status-image').attr('src', backgroundImage);
						$('#' + id + ' .active-power').html(turbine.activePower);
						$('#' + id + ' .active-power-progress').attr('aria-valuenow', turbine.activePower);
						$('#' + id + ' .active-power-progress').css({
							'width': activePowerProgress + '%',
							'background-color': activePowerColor
						});

						$('#' + id + ' .wind-speed').html(turbine.windSpeed);
						$('#' + id + ' .wind-speed-progress').attr('aria-valuenow', turbine.windSpeed);
						$('#' + id + ' .wind-speed-progress').css({
							'width': windSpeedProgress + '%',
							'background-color': windSpeedColor
						});
						return;
					}

	        		$('#turbine-zone').append(
	        				'<div id="turbine-' + turbine.farmKey + '-' + turbine.cmsKey + '" class="col-xl-4 col-lg-4 col-md-4 col-6 col-sm-4 grid-margin stretch-card">'+
	        				'    <div class="card card-statistics " style="cursor: pointer;background:transparent;" onclick="goToWindInfo(' + turbine.farmKey + ',' + turbine.cmsKey +')">'+
	        				'        <div style="position: relative;flex: 0 0 auto;">' +
	        				'            <img class="status-image" src="' + backgroundImage + '" style="width:100%;" alt="">' +
	        				'            <div class="clearfix">'+
	        				'                <div class="upper">'+
	        				'                    <h5 class="turbine-title unit-name">' + turbine.unitName + '</h5>'+
	        				'                    <img class="propeller" src="/static/images/0.png" style="height:60%;transform:rotate(' + degree + 'deg);"/>'+
	        				'                </div>'+
	        				'                <div class="lower">'+
	        				'                    <div class="lower-wrapper">'+
	        				'                        <div class="wrapper" style="text-align: center;">'+
	        				'                            <div class="main-d-flex main-justify-content-between">'+
	        				'                                <p class="mb-1 wind-speed">' + turbine.windSpeed + '</p>'+
	        				'                                <p class="mb-1">m/s</p>'+
	        				'                            </div>'+
	        				'                            <div class="progress">'+
	        				'                                <div class="progress-bar progress-bar-striped progress-bar-animated wind-speed-progress" role="progressbar" style="width:' + windSpeedProgress + '%; background-color:' + windSpeedColor + ';" aria-valuenow="' + turbine.windSpeed + '"'+
	        				'                                        aria-valuemin="0" aria-valuemax="15"></div>'+
	        				'                            </div>'+
	        				'                        </div>'+
	        				'                        <div class="wrapper margin-xs-1 mt-2" style="width:100%;text-align: center;">'+
	        				'                            <div class="main-d-flex main-justify-content-between">'+
	        				'                                <p class="mb-1 active-power">' + turbine.activePower + '</p>'+
	        				'                                <p class="mb-1">kW</p>'+
	        				'                            </div>'+
	        				'                            <div class="progress">'+
	        				'                                <div class="progress-bar progress-bar-striped progress-bar-animated active-power-progress" role="progressbar" style="width:' + activePowerProgress + '%; background-color:' + activePowerColor + ';" aria-valuenow="' + turbine.activePower + '"'+
	        				'                                        aria-valuemin="0" aria-valuemax="5000"></div>'+
	        				'                            </div>'+
	        				'                        </div>'+
	        				'                    </div>'+
	        				'                </div>'+
	        				'            </div>'+
	        				'        </div>'+
	        				'    </div>'+
	        				'</div>'
					);
				});

				var turbines = document.getElementById('turbine-zone').children;
				var turbineIds = [];

				$.each(turbines, function (index, turbine) {
					turbineIds.push(turbine.id);
				});

				$.each(turbineIds, function (index, turbineId) {
					if (!renderedTurbineMap[turbineId]) {
						$('#' + turbineId).remove();
						return;
					}
				});
	        },
	        error:function(request,status,error){
	        	// alert(request.responseText);
	        }
		})
	}
	  function goToWindInfo(farm,cms)
	  {
		  location.href = "/page/wind-info.html?farmKey="+farm+"&cmsKey="+cms;
	  }
	  
  </script>
</body>

</html>