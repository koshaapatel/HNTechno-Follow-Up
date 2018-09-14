                 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-title">
			<div class="grid-row">
				<h1>LANGUGES</h1>
				<nav class="bread-crumb">
					<a href="index.html">Home</a>
					
				</nav>
			</div>
		</div>
<div class="page-content woocommerce">
	<div class="container clear-fix">
		<div class="grid-col-row">
			<div class="grid-col grid-col-12">
					<h2>LANGUAGE COURSES</h2>
					
				<div class="grid-col-row">
				<c:forEach items="${list8}" var="v" varStatus="count">
					<div class="grid-col grid-col-4">
						<!-- course item -->
						<div class="course-item" style="padding: 0px !important;">	
							<div class="course-hover">
							<%-- <img style="height: 288px;width:370px;" src='<c:url value="file/${v.images}" />'></img> --%>
							<div class="hover-bg bg-color-2"></div>
							<a href="">Learn More</a>
							</div>
					
							<div class="course-name clear-fix" style="background: gray none repeat scroll 0% 0%;">
								<h3><a href="">${v.lang}</a></h3>
							</div>
											
						</div>
						<!-- / course item -->
					</div>
					</c:forEach>
				</div>																												
			</div>
		</div>
	</div>
</div>



	
		