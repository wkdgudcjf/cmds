<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
 		 <li class="nav-item nav-profile">
            <div class="nav-link">
              <div class="user-wrapper">
                <div class="text-wrapper">
                  <div>
                  	 <div style='display:inline-block;vertical-align:middle;'>
                  	  	<p class="profile-name">${user.email}</p>   
                  	 </div>
                     <div style='display:inline-block;vertical-align:middle;'>
	                      <a href="" data-toggle="modal" data-target="#modifyPasswordModal">
		              		<i class="menu-icon mdi mdi-settings"></i>
		            	  </a>
                     </div>
                  </div>
                  <div>
                    <small class="designation text-muted">${user.levelID} 레벨</small>
                    <span class="status-indicator online"></span>
                  </div>
                </div>
              </div>
              <button class="btn btn-success btn-block"  onclick="location.href='/logout'" >로그아웃
              </button>
            </div>
          </li>
          
        <c:choose>
		<c:when test="${user.levelID > 0}"> 
			 
			 <c:choose>
			<c:when test="${user.main == true}"> 
		     <li class="nav-item">
	            <a class="nav-link " href="/index.html">
	              <i class="menu-icon mdi mdi-circle-outline"></i>
	              <span class="menu-title">Main</span>
	              <i class="menu-arrow"></i>
	            </a>
	            <div class="collapse" id="main" style="">
	              <ul class="nav flex-column sub-menu">
	                <li class="nav-item">
	                  <a class="nav-link" href="/page/wind-info.html?farmKey=${user.farmKey}&cmsKey=${user.cmsKey}">
	                          <i class="menu-icon mdi mdi-content-copy"></i> 
	          		    <span class="menu-title">Wind Turbine Info</span>
	           		 </a>
	                </li>
	                <li class="nav-item">
			            <a class="nav-link"href="/page/turbine-info.html?farmKey=${user.farmKey}&cmsKey=${user.cmsKey}">
			              <i class="menu-icon mdi mdi-television"></i>
			              <span class="menu-title">Monitoring</span>
			            </a>
			        </li>
			        <li class="nav-item">
			           <a class="nav-link" href="/page/component.html?farmKey=${user.farmKey}&cmsKey=${user.cmsKey}" style="white-space: inherit;">
			             <i class="menu-icon mdi mdi-chart-line"></i>
			             <span class="menu-title">Component Inspection Report</span>
			           </a>
			        </li>
	              </ul>
	            </div>
	          </li>
	          </c:when> 
			 <c:otherwise> 
			      <li class="nav-item">
		           <a class="nav-link" href="/index">
		             <i class="menu-icon mdi mdi-circle-outline"></i>
		             <span class="menu-title">Main</span>
		           </a>
		         </li>
			 </c:otherwise> 
			 </c:choose>
		</c:when> 
		<c:otherwise> 
		</c:otherwise> 
		</c:choose>
		
        <c:choose>
		<c:when test="${user.levelID > 1}"> 
          <li class="nav-item">
            <a class="nav-link" href="/page/onh-history.html">
              <i class="menu-icon mdi mdi-backup-restore"></i>
              <span class="menu-title">O&amp;M History</span>
            </a>
          </li>
		            <li class="nav-item">
            <a class="nav-link" href="/page/onh-check.html">
              <i class="menu-icon mdi mdi-table"></i>
              <span class="menu-title">O&amp;M Check List</span>
            </a>
          </li>
        </c:when> 
		<c:otherwise> 
		</c:otherwise> 
		</c:choose>
		
		 <c:choose>
		<c:when test="${user.levelID > 2}"> 
		  <li class="nav-item">
            <a class="nav-link " data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="menu-icon mdi mdi-restart"></i>
              <span class="menu-title">Administrator</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth" style="">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                  <a class="nav-link" href="/admin/member.html"> Member </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/admin/group.html"> Group </a>
                </li>
              </ul>
            </div>
          </li>
         </c:when> 
		<c:otherwise> 
		</c:otherwise> 
		</c:choose>
        </ul>
 </nav>
  <!-- ModifyApp Modal -->
    <div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="modifyPasswordModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-body">
          	  <form id="modifyPasswordform">
	             <div class="form-group">
                  <div class="input-group">
                    <input id="password" type="password" class="form-control" placeholder="Password">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group">
                    <input id="passwordConfirm" type="password" class="form-control" placeholder="Confirm Password">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
	          </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="#" onclick="modifyPassword();">수정하기</a>
          </div>
        </div>
      </div>
    </div>
 <!-- Custom scripts for this template -->
	<script type="text/javascript">
		 function modifyPassword(){
			if ($('#password').val() !== $('#passwordConfirm').val()) {
	            alert('비밀번호 두 개가 다릅니다.');
	            return false;
	        }

	        if (!$('#password').val()) {
	            alert('비밀번호를 입력해주세요.');
	            return false;
	        }
			$.ajax({
				url:"/modifyPassword",
				type: "POST",
				data : {"password":$('#password').val()},
		        success: function (data) {
		        	alert(data);
		        	$('#modifyPasswordModal').modal('hide');
		        },
		        error:function(request,status,error){
		        	alert("실패하였습니다");
		        	$('#modifyPasswordModal').modal('hide');
		        }
			})
		}
    </script>