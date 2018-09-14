<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body><!-- HEADER-->

<!-- WRAPPER-->
<div id="wrapper-content"><!-- PAGE WRAPPER-->
    <div id="page-wrapper"><!-- MAIN CONTENT-->
        <div class="main-content"><!-- CONTENT-->
            <div class="content">
                <div class="section background-opacity page-title set-height-top">
                    <div class="container">
                        <div class="page-title-wrapper"><!--.page-title-content--><span class="captions">LANGUAGES</span>
                            <ol class="breadcrumb">
                                <li><a href="home.net">Home</a></li>
                                <li><a href="#">Java</a></li>
                                </ol>
                        </div>
                    </div>
                </div>
               
	<div class="page-content woocommerce">
		<div class="container clear-fix">
			<div class="grid-col-row">
				<div class="grid-col grid-col-9">
					<h2>Some category</h2>
					<!-- Shop -->
					<div id="page-meta" class="group">
						<p class="woocommerce-result-count">About ${li.l.lang}</p>
						<div id="list-or-grid">
							<div class="grid-view active" title="Switch to grid view">
								<i class="fa fa-th-large"></i>
							</div>
							<div class="list-view" title="Switch to list view">
								<i class="fa fa-th-list"></i>
							</div>
						</div>
					</div>
				
					<div style="text-align: justify;">
					<ul class="products grid-view">	
						<!-- product -->
						<li class="product" style="width: 100%; padding-right: 14px;">
							<div class="picture">
								<div class="ribbon ribbon-blue">
									<div class="banner">
										<div class="text">New</div>
									</div>
								</div>
								<%-- <img alt="" data-at2x="pic/shop/270x200-img-3@2x.jpg"><img style="height: 288px;width:370px;" src='<c:url value="file1/${li.l.images}" />'></img> --%>
								<span class="hover-effect"></span>
								<div class="link-cont">
									<a href="pic/shop/270x200-img-3@2x.jpg" class="cws-right fancy cws-slide-left "><i class="fa fa-search"></i></a></div>
								</div>
						</li>
					</ul>
   </div>
					<!--Shop -->
																			
			    </div>
			  
				<div class="grid-col grid-col-3">
					<!-- <aside class="widget-categories"> -->
						<h2>Categories</h2>
						<hr class="divider-big" />
						<ul>
							<li><a href="#">${li.l.lang}</a>
							<ul style="margin-left:55px">
							<c:forEach items="${li.s}" varStatus="count" var="f">
							<li>${f.sublang}</li>
							</c:forEach>
							</ul>
						   </li>
						 </ul>
					<!-- </aside> -->
					<!-- widget categories -->
					
				</div>
			</div>
		</div>
	</div>
 </div>
        </div>
    </div>
    <!-- BUTTON BACK TO TOP-->
   </div>
</body>

