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
		<h4 class="panel-title">Add Faculty Details</h4>
	</div>
	<div class="panel-body panel-form">
		<form:form modelAttribute="m1" class="form-horizontal form-bordered"
			data-parsley-validate="true" name="demo-form" enctype="multipart/form-data">
			<div class="panel-body">
				<div class="form-group" style="width: 50%; float: left;">
					<label class="control-label col-md-4 col-sm-4" style="text-align: left;">Role :</label>
					<div class="col-md-8 col-sm-6">
						<form:select path="role" name="role" class="form-control">
						<form:option value="ROLE_ADMIN">ROLE_ADMIN</form:option>
						<form:option value="ROLE_EMPLOYEE">ROLE_EMPLOYEE</form:option>
						<form:option value="ROLE_STUDENT">ROLE_STUDENT</form:option>
						</form:select>
					</div>
				</div>
				<div class="form-group" style="width: 50%; float: left;">
					<label class="control-label col-md-4 col-sm-4" for="fname"
						style="text-align: left;">Name * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="facultyname" name="facultyname" class="form-control"
							placeholder="Enter Name" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="mobile"
						style="text-align: left;">Mobile Number * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="mob" class="form-control"
							placeholder="Enter Mobile Number" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="email"
						style="text-align: left;">Email * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="emailid" name="emailid" class="form-control"
							placeholder="Enter Email Id" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="uname"
						style="text-align: left;">Username * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="username" name="username" class="form-control"
							placeholder="Enter Username" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="email"
						style="text-align: left;">Password * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="password" name="password" class="form-control"
							placeholder="Enter Password" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
            	    <label class="control-label col-md-4 col-sm-4" style="text-align: left;">Join Date * :</label>
                       <div class="col-md-8 col-sm-6">
            	           <div class="input-group date" id="datepicker-disabled-past" data-date-format="dd/mm/yyyy" data-date-start-date="Date.default">                        
            	               <form:input path="joindate" class="form-control" placeholder="Select Date" />
                               <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                           </div>
                       </div>
               </div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4" style="text-align: left;">Language * :</label>
					<div class="col-md-8 col-sm-6">
						<select name="language" onchange="getData(this.value)" class="form-control"
							data-size="10" data-live-search="true" data-style="btn-success">
							<option value="0">Select Language</option>
							<c:forEach items="${list1}" var="v">
								<option value="${v.lid}">${v.lang}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4" style="text-align: left;">Sub Language * :</label>
					<div class="col-md-8 col-sm-6">
						<form:select path="sd.sdid" id="sub"  class="form-control" data-size="10" data-live-search="true" data-style="btn-success">
							<form:option value="0">Select Sub Language</form:option>
							
						</form:select>
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="salaryamout"
						style="text-align: left;">Salary * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="salaryamout" class="form-control" style="height:34px;"
							 />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="facultyimage"
						style="text-align: left;">Upload Image * :</label>
					<div class="col-md-8 col-sm-6">
						<input type="file" accept="image/*" name="facultyimage" class="form-control"/>
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" for="facultyfile"
						style="text-align: left;">Upload Document * :</label>
					<div class="col-md-8 col-sm-6">
						<input type="file" accept=".xlsx,.xls,.doc, .docx,.ppt, .pptx,.txt,.pdf"  name="facultyfile" class="form-control" style="height:34px;"
							 />
					</div>
				</div>
				<div class="col-md-6 col-sm-6" style="margin: 10px 0px 10px 50%;">
					<button type="submit" class="btn btn-sm btn-success">Submit</button>
				</div>
				</div>
				</form:form>
			</div>
		</div>