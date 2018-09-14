<script>

function getData(id){
	$.ajax({
		type:"POST",
		url:"getstate.net",
		data:{id:id},
		success:function(html){
			$("#sub").html(html);
		}
	});
}
function getDataa(id){
	$.ajax({
		type:"POST",
		url:"getcity.net",
		data:{id:id},
		success:function(html){
			$("#subb").html(html);
		}
	});
}
function getcollege(id){
	$.ajax({
		type:"POST",
		url:"getclg.net",
		data:{id:id},
		success:function(html){
			$("#college").html(html);
		}
	});
}

</script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="panel panel-inverse" data-sortable-id="form-validation-1">
	<div class="panel-heading">
		<div class="panel-heading-btn">
			<a href="javascript:;"
				class="btn btn-xs btn-icon btn-circle btn-default"
				data-click="panel-expand"><i class="fa fa-expand"></i></a> <a
				href="javascript:;"
				class="btn btn-xs btn-icon btn-circle btn-success"
				data-click="panel-reload"><i class="fa fa-repeat"></i></a> <a
				href="javascript:;"
				class="btn btn-xs btn-icon btn-circle btn-warning"
				data-click="panel-collapse"><i class="fa fa-minus"></i></a> <a
				href="javascript:;"
				class="btn btn-xs btn-icon btn-circle btn-danger"
				data-click="panel-remove"><i class="fa fa-times"></i></a>
		</div>
		<h4 class="panel-title">Inquiry</h4>
	</div>
	<div class="panel-body panel-form">
		<form:form modelAttribute="m1" class="form-horizontal form-bordered"
			data-parsley-validate="true" name="demo-form">
			<div class="panel-body">
				
				<div class="form-group" style="width: 50%; float: left;">
					<label class="control-label col-md-4 col-sm-4"
						style="text-align: left;">First Name * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="fname" class="form-control"
							placeholder="Enter First Name" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="width: 50%; float: left;">
					<label class="control-label col-md-4 col-sm-4"
						style="text-align: left;">Middle Name * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="mname" class="form-control"
							placeholder="Enter Middle Name" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="width: 50%; float: left;">
					<label class="control-label col-md-4 col-sm-4" 
						style="text-align: left;">Last Name * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="lname" class="form-control"
							placeholder="Enter Last Name" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" 
						style="text-align: left;">Email * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="email" class="form-control"
							placeholder="Enter Email Id" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="message"
						style="text-align: left;">Mobile Number * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="mob" class="form-control"
							placeholder="Enter Your Mobile Number" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4"
						style="text-align: left;">Gender * :</label>
					<div class="col-md-8 col-sm-6">
						<form:radiobutton path="gender" value="male"/><span style="margin:0 10px;">Male</span>
						<form:radiobutton path="gender" value="female"/><span style="margin-left:10px;">Female</span>
					</div>
				</div>
				
					<form:hidden path="scd.coursedid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sa.authenticationid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sc.clginfoid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="scm.coursemid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sp.projectid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="si.studentid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="imid"  class="form-control" placeholder="Remark"/>
					
				<div class="col-md-6 col-sm-6" style="margin: 10px 0px 10px 50%;">
					<button type="submit" class="btn btn-sm btn-success">Submit</button>
				</div>
			</div>
		</form:form>
	</div>
</div>
<%-- 
<!-- #modal-alert for language -->
	 <div class="modal fade" id="language">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addlang.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Language * :</label>
								<div class="col-md-6 col-sm-6">
									<input type="text" onblur = "space()" autocomplete="off" class="form-control" id="lang" placeholder="Required" data-parsley-required="true" />
								</div>
							<label class="control-label col-md-4 col-sm-4" for="fullname">Title * :</label>
								<div class="col-md-6 col-sm-6">
									<input type="text" onblur = "space()" autocomplete="off" class="form-control" id="title" placeholder="Required" data-parsley-required="true" />
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
!-- #modal-alert for country -->
	 <div class="modal fade" id="country">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form action="addcountry.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Country * :</label>
								<div class="col-md-6 col-sm-6">
									<input type="text" onblur = "space()" autocomplete="off" class="form-control" placeholder="Required" data-parsley-required="true" />
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
	!-- #modal-alert for state -->
	 <div class="modal fade" id="state">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form:form modelAttribute="m2" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
						<div class="form-group">
                        	<label class="control-label col-md-4 col-sm-4">Country *</label>
                         	   	 <div class="col-md-6 col-sm-6">
                     	            <form:select path="c.countryid" class="form-control">
                  	                	<form:option value="0">Select Country</form:option>
                                          	<c:forEach items="${list6}" var="v">
			`									<form:option value="${v.countryid}">${v.countryname}</form:option>
											</c:forEach>
									</form:select>
        `                       </div>
                             </div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">State * :</label>
								<div class="col-md-6 col-sm-6">
									<input type="text" onblur = "space()" autocomplete="off" class="form-control" placeholder="Required" data-parsley-required="true" />
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
	</div> --%>