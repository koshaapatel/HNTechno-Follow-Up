<script>
function getData(id){
	$.ajax({
		type:"POST",
		url:"getsublang.net",
		data:{id:id},
		success:function(html){
			$("#sub").html(html);
		}
	});
}
function getDa(id){
	$.ajax({
		type:"POST",
		url:"getmaterial.net",
		data:{id:id},
		success:function(html){
			$("#mm").html(html);
		}
	});
}
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-title">
		<div class="grid-row">
				<h1>MATERIAL</h1>
				<nav class="bread-crumb">
					<a href="index.html">Home</a>
				</nav>
		</div>
</div>
					
	<div class="page-content woocommerce">
		<div class="container clear-fix">
			<div class="grid-col-row">
				<div class="grid-col grid-col-9">
					<h2>Materials</h2>
					<div class="form-group">
	                        <label class="col-md-3 control-label">Language :</label><br/>
    	                      	 <div class="col-md-9">
        	                         <select onchange="getData(this.value)" class="form-control">
            	                         <option value="0">Select Language</option>
											<c:forEach items="${list8}" var="v">
												<option value="${v.lid}">${v.lang}</option>
											</c:forEach>
									</select>
                    	          </div>
                        </div><br/>
                        <div class="form-group">
            	            <label class="col-md-3 control-label">Sub Language *</label><br/>
                            	<div class="col-md-9">
                        	        <select onchange="getDa(this.value)" id="sub" class="form-control">
                    	                <option value="0">Select Sub Language</option>
									</select>
                                 </div>
	                     </div><br/>
	                      <div class="form-group">
            	            <label class="col-md-3 control-label">Material *</label><br/>
                            	<div class="col-md-9">
                        	        <span id="mm"></span>
                                 </div>
                           </div>
					<ul class="products">
						
					</ul>
					<!--Shop -->
																			
				</div>
				<div class="grid-col grid-col-3">
					<!-- widget search -->
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="page-content container clear-fix">
	<nav class="main-nav">	
  </nav>

	<div id="Container-gallery">	
	<nav class="main-nav">					
						<ul class="clearfix">
							<c:forEach items="${material}" var="v" varStatus="count">
				
					     	<li class="mix IOS">	
							    <div class="gallery-item">
									<div class="gallery-item-thumb">
										<span class="overlay"></span>
											<div class="image">
							    		            <%-- <image width="360" height="240" controls>
													<img style="height: 288px;width:370px;" src='<c:url value="file1/${v.images}" />'></img>
										            </image>  --%>
											</div>
									</div>
										<div class="gallery-item-info">
										<p>     
											<h1>${v.sd.sm.l.lang}</h1>
											<h3>${v.sd.sublang}</h3>
											<c:forEach items="${v.ld}" var="z" varStatus="count">
											<a href="#.">${z.file}</a>
											<a  href='<c:url value="download1.net?p=${z.file}"/>'>Download</a>
											<!-- <a href="http://localhost/project/downloadpdf.php?pdf=contact-us.php">Download</a></span> -->
									    	</c:forEach>
									    </p>
										</div>
						    	</div>			
						    </li>
						    </c:forEach>
						</ul>	
						</nav>
						</section>
				</div>				
				
			
			</div>
				
				