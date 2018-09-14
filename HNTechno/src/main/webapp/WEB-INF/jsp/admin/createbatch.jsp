<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
function space()
{
	var a=document.getElementById("lang");	
	var ab=a.value;
	a.value=ab.trim();
}
</script>
<body>
	<div class="col-md-12">
		 <div class="panel panel-inverse">
         	<div class="panel-heading">
          	  <div class="panel-heading-btn">
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
              </div>
              <h4 class="panel-title">Created Batch Details</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                   		<th>BATCH NAME</th>
                   		<th>SUB LANGUAGE</th>
                   		<th>FACULTY NAME</th>
                   		<th>STUDENTS NAME</th>
                   		<th>STARTING DATE</th>
                   		<th>ENDING DATE</th>
                   		<th>STUDENTS</th>
                  		<th>ACTION</th>
                     </tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                     	<tr class="odd gradeX">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.bd.batchname}
                             </td>
                             <td>
                             	${v.bd.sd.sublang}
                             </td>
                             <td>
                             	${v.f.facultyname}
                             </td>
                             <td>
                             <table class="table table-striped table-bordered" >
                            	 	<c:forEach items="${v.cd}" var="z" varStatus="count">
                            	 	<tr class="odd gradeX">
                        				<td>
                            				${z.sd.studentname}
                           				 </td>
                           				 <td>
                            				<div class="btn-group pull-right">
                                				<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    				<ul class="dropdown-menu" role="menu">
				                       				 	<li><a href="#modal-alert-delete1" data-toggle="modal">Delete</a></li>
				                        				<li><a href="#">Edit</a></li>
				                        			</ul>
				                			 </div>
                            			 </td>
                           			</tr>
                           			</c:forEach>
                            	 </table>
                             </td>
                               <td>
                             	${v.sdate}
                             </td>
                               <td>
                             	${v.edate}
                             </td>
                             <td>
                             	${v.students}
                             </td>
                             <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted()" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-dialog" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove()" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td>
                         </tr>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="#modal-dialog" data-toggle="modal" class="btn btn-sm btn-success" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
                  	<button type="button" class="btn btn-success active"><i class="fa fa-edit"></i></button></a>
           </div>
       </div>
    </div>
    <div class="modal fade" id="modal-dialog">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form:form modelAttribute="m2" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form">
						
						<div class="form-group">
	                        <label class="col-md-3 control-label">Language *</label>
    	                      	 <div class="col-md-9">
        	                         <select class="form-control">
            	                         <option value="0">Select Language</option>
											<c:forEach items="${list}" var="v">
												<option value="${v.bd.sd.sm.l.lid}">${v.bd.sd.sm.l.lang}</option>
											</c:forEach>
									</select>
                    	          </div>
                        </div>
						
						<div class="form-group">
	                        <label class="col-md-3 control-label">Sub Language *</label>
    	                      	 <div class="col-md-9">
        	                         <select class="form-control">
            	                         <option value="0">Select Sub Language</option>
											<c:forEach items="${list}" var="v">
												<option value="${v.bd.sd.sdid}">${v.bd.sd.sublang}</option>
											</c:forEach>
									</select>
                    	          </div>
                        </div>
						
	                     <div class="form-group">
							<label class="control-label col-md-3" for="fullname">Batch Name * :</label>
								<div class="col-md-9">
									<form:select path="bd.sdid" id="sub" class="form-control">
                    	                <form:option value="0">Select Batch</form:option>
                    	                <c:forEach items="${list}" var="v">
												<option value="${v.batchid}">${v.batchname}</option>
										</c:forEach>
									</form:select>
								</div>
						</div>
						
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
						</div>
					</form:form>
                  </div>
			</div>
		</div>
	</div>
 		

	<!-- #modal-alert for college -->
<%-- <!-- 	<div class="modal fade" id="college">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addclg.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">College * :</label>
								<div class="col-md-6 col-sm-6">
									<input onblur = "space()" autocomplete="off" class="form-control" type="text" name="clg" id="clg" placeholder="Required" data-parsley-required="true" />
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
	
	<!-- #modal-alert for ttype -->
	<div class="modal fade" id="ttype">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addtraining.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Training Type * :</label>
								<div class="col-md-6 col-sm-6">
									<input type="text" onblur = "space()" autocomplete="off" class="form-control" name="ttype" id="ttype" placeholder="Required" data-parsley-required="true" />
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
	
	<!-- #modal-alert for city -->
	<div class="modal fade" id="city">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addcity.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">City * :</label>
								<div class="col-md-6 col-sm-6">
									<input onblur = "space()" autocomplete="off" class="form-control" name="city" id="city" placeholder="Required" data-parsley-required="true" />
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
	
	<!-- #modal-alert for state -->
	<div class="modal fade" id="state">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addstate.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">State * :</label>
								<div class="col-md-6 col-sm-6">
									<input onblur = "space()" autocomplete="off" class="form-control" name="state" id="state" placeholder="Required" data-parsley-required="true" />
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
	</div> --%>
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
 </body>