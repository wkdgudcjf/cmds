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
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper auth-page" >
      <div class="content-wrapper d-flex align-items-center   theme-one" style="background:#fff">
		<div class=" w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auto-form-wrapper">
				<div>
					<h2 class="text-center"><img style="width:80%; margin:0 auto; display:block" src="/static/sample.png" alt="" /></h2>
				</div>
              <form action="/signin" method="post">
                <div class="form-group">
                  <label class="label">User Email</label>
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="User Email" name="email">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="label">Password</label>
                  <div class="input-group">
                    <input type="password" class="form-control" placeholder="*********" name="password">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                    <p style="text-align: center;color: red;">${msg}</p>
                </div>
                
                <div class="form-group">
                  <button type="submit" class="btn btn-primary submit-btn btn-block">로그인</button>
                </div>
              </form>
            </div>
             <div class="form-group">
                  <button class="btn btn-block g-login" onClick="goToRegister()"> 회원가입</button>
                </div>
            
			<br><br>
            <p class="footer-text text-center">copyright © 2019 SMI. All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/static/vendors/js/vendor.bundle.base.js"></script>
  <script src="/static/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/static/js/off-canvas.js"></script>
  <script src="/static/js/misc.js"></script>
  <!-- endinject -->
  <script type="text/javascript">
		 function goToRegister(){
			location.href="/register";
		}
    </script>
</body>

</html>