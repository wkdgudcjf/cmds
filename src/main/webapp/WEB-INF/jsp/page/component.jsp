<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
			 			<h4><strong>${unitName}</strong></h4><h5>(FARM Key - ${user.farmKey} CMS Key - ${user.cmsKey})</h5> 
			 		</div>
			 	</div>
			 	</div>
			</div>

                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4><strong>Component Inspection Report</strong></h4>
                                <div class="wrapper d-flex justify-content-between">
                                    <form:form cssClass="forms-sample" action="/page/report" method="post" modelAttribute="report" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-12">
                                            	<input type="hidden" value="${user.farmKey}" name="farmKey">
                                            	<input type="hidden" value="${user.cmsKey}" name="cmsKey">
                                                <div class="form-group row">
                                                    <label class="col-12 col-form-label">Part</label>
                                                    <div class="col-12">
                                                        <form:select path="part" cssClass="form-control">
                                                            <form:option value="">Select</form:option>
                                                            <form:option value="Main Brg">Main Brg</form:option>
                                                            <form:option value="GearBox">GearBox</form:option>
                                                            <form:option value="Generator">Generator</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-form-label">Assessment </label>
                                                    <div class="col-12">
                                                        <form:select path="assessment" cssClass="form-control">
                                                            <form:option value="">Select</form:option>
                                                            <form:option value="No Access">No Access</form:option>
                                                            <form:option value="Limited Access">Limited Access</form:option>
                                                            <form:option value="Acceptable">Acceptable</form:option>
                                                            <form:option value="Wear & Tear">Wear & Tear</form:option>
                                                            <form:option value="Shortened">Shortened</form:option>
                                                            <form:option value="Service Life">Service Life</form:option>
                                                            <form:option value="Failed">Failed</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="recommend">Recommend</label>
                                                    <form:textarea path="recommend" cssClass="form-control p-input" id="recommend" rows="5" placeholder="Recommend Text"></form:textarea>
                                                </div>


                                                <!--
                                                <div class="form-group ">
                                                    <div class="text-center row">
                                                        <div class=" i-con  col-2 offset-1">
                                                         <input class="mdi mdi-camera" value="">
                                                        </div>
                                                        <div class=" i-con  col-2"><i class="mdi mdi-delete"></i></div>
                                                        <div class=" i-con  col-2"><i class="mdi mdi-pencil"></i></div>
                                                        <div class=" i-con  col-2"><i class="mdi mdi-format-text"></i></div>
                                                        <div class=" i-con  col-2"><i class="mdi mdi-camera-burst"></i></div>
                                                    </div>
                                                </div>
                                                 -->

                                                <div class="form-group ">
                                                    <input name="imageFile" type="file" class="form-control-file" id="imageFile" accept="image/*">
                                                    <div class="text-center row">
                                                        <div class="filebox bs3-primary preview-image">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr/>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success mr-2">Submit</button>
                                            </div>
                                        </div>

                                    </form:form>
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
    <spring:hasBindErrors name="report">
    alert('${errors.allErrors[0].defaultMessage}');
    </spring:hasBindErrors>

    $(document).ready(function () {
        //preview image
        var imgTarget = $('input[type=file]');

        imgTarget.on('change', function () {
            var parent = $(this).parent();
            parent.children('.upload-display').remove();

            if (window.FileReader) {
                //image 파일만
                if (!$(this)[0].files[0].type.match(/image\//)) return;

                var reader = new FileReader();
                reader.onload = function (e) {
                    var src = e.target.result;
                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img style="width:100%" src="' + src + '" class="upload-thumb"></div></div>');
                };
                reader.readAsDataURL($(this)[0].files[0]);
            }

            else {
                $(this)[0].select();
                $(this)[0].blur();
                var imgSrc = document.selection.createRange().text;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img style="width:100%" class="upload-thumb"></div></div>');

                var img = $(this).siblings('.upload-display').find('img');
                img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
            }
        });
    });

    $('.click-tr').click(function () {
        $('.target').toggle('slow');
    });

    $('form').on('submit', function(e) {
        if (!$('select[name=part] option:selected').val()) {
            alert('part를 입력해주세요.');
            return false;
        }

        if (!$('select[name=assessment] option:selected').val()) {
            alert('assessment를 입력해주세요.');
            return false;
        }

        if (!$('textarea[name=recommend]').val()) {
            alert('recommend를 입력해주세요.');
            return false;
        }

        if (!$('input[name=imageFile]').val()) {
            alert('이미지 파일을 업로드해주세요.');
            return false;
        }
    });
</script>
</body>

</html>