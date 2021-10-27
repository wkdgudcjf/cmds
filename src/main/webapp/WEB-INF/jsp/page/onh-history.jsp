<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

		.ep-table-set  {width:100%; display: table; table-layout: fixed;}

		.ep-table-set th, td {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
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
						<h4><strong>O&amp;M History</strong></h4>
						<div class="wrapper d-flex justify-content-between">
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
											FARM
										</th>
										<th>
											CMS
										</th>
										<th>
											Part
										</th>
										<th>
											AM
										</th>
									</tr>
									</thead>
									<tbody id="reportBody">
									<c:forEach var="report" items="${reportList}">
										<tr class="click-tr">
											<td>
												<fmt:formatDate value="${report.registerDate}" pattern="yyyy.MM.dd"/>
											</td>
											<td>
												<fmt:formatDate value="${report.registerDate}" pattern="HH:mm:ss"/>
											</td>
											<td >
													${report.farmKey}
											</td>
											<td >
													${report.cmsKey}
											</td>
											<td class="text-danger">
													${report.part}
											</td>
											<td>
													${report.assessment}
											</td>
										</tr>
										<tr class="target">
											<td colspan="6">
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
									<c:choose>
										<c:when test="${fn:length(reportList) == 50}">
											<tr id="data-zone">
												<td colspan="6" style="text-align:center;" onClick="loadData(${lastID})">
													<h4 style="color:blue"><strong>+</strong></h4>
												</td>
											</tr>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

									</tbody>
								</table>
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
</div>
<script src="/static/vendors/js/vendor.bundle.base.js"></script>
<script src="/static/vendors/js/vendor.bundle.addons.js"></script>
<script src="/static/js/off-canvas.js"></script>
<script src="/static/js/misc.js"></script>
<script src="/static/js/dashboard.js"></script>
<script type="text/javascript">
  $('.click-tr').off('click');
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

function loadData(lastID)
{
	 $.ajax({
			url:"/page/loadData",
			type: "POST",
			data : {"lastID":lastID},
	        success: function (data) {
	        	
	        	$('#data-zone').remove();
	        	$.each(data, function (index, item) { 
	        		$('#reportBody').append(
	        			 "<tr class='click-tr'>"+
							"<td>"+
								new Date(item.registerDate).format("yyyy.MM.dd")+
							"</td>"+
							"<td>"+
								new Date(item.registerDate).format("HH:mm:ss")+
							"</td>"+
							"<td>"+
								item.farmKey+
							"</td>"+
							"<td>"+
								item.cmsKey+
							"</td>"+
							"<td class='text-danger'>"+
								item.part+
							"</td>"+
							"<td>"+
								item.assessment+
							"</td>"+
						"</tr>"+
						"<tr class='target'>"+
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
	        		
	        		if(index == 49)
	        		{
	        			$('#reportBody').append(
	        				"<tr id='data-zone'>"+
	        				"<td colspan='6' style='text-align:center;' onClick='loadData("+
	        					item.id+
								")'><h4 style='color:blue'><strong>+</strong></h4>"+
							"</td>"+
							"</tr>"
	        			);
	        		}
	 		   });
              $('.click-tr').off('click');
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