<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<h4><strong>Member List</strong></h4>
				<hr/>
                 <div class="wrapper d-flex ">
						<div class="col-12">
							<div class="table-responsive">
								<table class="ep-table-set2">
								 <form:form action="/admin/modifyMember" method="post" modelAttribute="multiUser">
									<thead>
										<tr>
										  <th style="width:15%">
											Date
										  </th>
										  <th style="width:25%">
											E-mail
										  </th>
										  <th style="width:25%">
											Level
										  </th>
										  <th style="width:35%" >
											Group
										  </th>
										</tr>
									  </thead>
									 <tbody>
									   <c:forEach var="userItem" items="${userList}" varStatus="status">
											<tr>
												<td class="font-weight-medium">
											    	<fmt:formatDate value="${userItem.date}" pattern="yyyy.MM.dd"/>
												</td>
												<td>
													<input type="hidden" name="userList[${status.index}].userID" value="${userItem.userID}"/>
													${userItem.email}
												</td>
												<td>
												<form:select path="userList[${status.index}].levelID" cssClass="form-control">
													<c:forEach var="level" items="${levelList}">
													   <c:choose>
														<c:when test="${userItem.levelID==level.levelID}"> 
														    <form:option value="${level.levelID}" selected="true">${level.levelID}</form:option>
														</c:when> 
														<c:otherwise> 
														    <form:option value="${level.levelID}">${level.levelID}</form:option>
														</c:otherwise> 
														</c:choose>
													</c:forEach>
                                                </form:select>
												</td>
												<td>
												<form:select path="userList[${status.index}].GroupID" cssClass="form-control">
													<c:forEach var="group" items="${groupList}">
														<c:choose>
														<c:when test="${userItem.groupID==group.groupID}"> 
														    <form:option value="${group.groupID}" selected="true">${group.groupName}</form:option>
														</c:when> 
														<c:otherwise> 
														    <form:option value="${group.groupID}">${group.groupName}</form:option>
														</c:otherwise> 
														</c:choose>
													</c:forEach>
                                                </form:select>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="col-12" style="margin-top:20px;">
	                                  <button type="submit" class="btn btn-success mr-2">Submit</button>
		                         </div>
		                         </form:form>
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
  $('.click-tr').click(function() {
    $('.target').toggle('slow');
	});
  </script>
</body>

</html>