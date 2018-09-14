<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<security:authorize access="isAuthenticated()">
<security:authentication property="principal.username" var="a"/> 
</security:authorize>

<c:if test="${a ne null}">
<c:redirect url="index.net"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Login</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="assets/css/animate.min.css" rel="stylesheet" />
	<link href="assets/css/style.min.css" rel="stylesheet" />
	<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
	<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>
<body class="pace-top">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade">
	    <!-- begin login -->
        <div class="login bg-black animated fadeInDown">
            <!-- begin brand -->
            <div class="login-header">
                <div class="brand">
                    <span class="logo"></span>  HN Techno <small>The Hub of
						Knowledge.</small>
                </div>
                <div class="icon">
                    <i class="fa fa-sign-in"></i>
                </div>
            </div>
            <!-- end brand -->
            <div class="login-content">
				<form action='<c:url value="/login"/>' method="post"
					class="margin-bottom-0">
					<c:if test="${msg ne null}" >
					<span style="color:red;">${msg}</span>
					</c:if>
					
					<div class="form-group m-b-20">
						<input type="text" name="username"
							class="form-control input-lg inverse-mode no-border"
							placeholder="Username" autofocus="autofocus" required />
					</div>
					<div class="form-group m-b-20">
						<input type="password" name="password"
							class="form-control input-lg inverse-mode no-border"
							placeholder="Password" required />
					</div>
					
					<div class="login-buttons">
						<button type="submit" name="login" class="btn btn-success btn-block btn-lg">Login</button>
						<input type = "hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
					<a href="#forgot" data-toggle="modal" style="color:white;">Forgot Password or User Name?</a>
				</form>
			</div>
        <!-- end login -->
        </div>
      </div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
		});
	</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-53034621-1', 'auto');
  ga('send', 'pageview');

</script>

<div class="modal fade" id="forgot">
    <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="panel-body panel-form">
				<form action="forgot.net" method="post" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form">
					<div class="form-group">
						<label class="control-label col-md-4 col-sm-4" for="fullname">Email Id * :</label>							
							<div class="col-md-6 col-sm-6">
								<input type="text" autocomplete="off" name="email" class="form-control" placeholder="Enter Your Register Email Id" data-parsley-required="true" />
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					</div>
				</form>
             </div>
		</div>
	</div>
</div>

</body>

<!-- Mirrored from seantheme.com/color-admin-v2.1/admin/html/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 Jan 2017 07:03:25 GMT -->
</html>
