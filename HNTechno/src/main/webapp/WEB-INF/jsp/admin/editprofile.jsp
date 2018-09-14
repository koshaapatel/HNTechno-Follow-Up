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
		<h4 class="panel-title">Edit Profile</h4>
	</div>
	<div class="panel-body panel-form">
		<form:form modelAttribute="l" class="form-horizontal form-bordered"
			data-parsley-validate="true" name="demo-form">
			<div class="panel-body">
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4"
						style="text-align: left;">Name * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="name" name="name" class="form-control"
							placeholder="Enter First Name" data-parsley-required="true" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" 
						style="text-align: left;">Email * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="email" name="email" class="form-control"
							placeholder="Enter Email Id" data-parsley-required="true" />
					</div>
				</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" style="text-align: left;">Username * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="username" name="username" class="form-control"
							placeholder="Enter Username" />
					</div>
				</div>
				<div class="form-group" style="float: left; width: 50%;">
					<label class="control-label col-md-4 col-sm-4" style="text-align: left;">Password * :</label>
					<div class="col-md-8 col-sm-6">
						<form:input path="password" name="password" class="form-control"
							placeholder="Enter Password" />
					</div>
				</div>
				<form:hidden path="uid" name="id"/>
				<form:hidden path="image" name="image"/>
				<form:hidden path="role" name="role"/>
				<div class="col-md-6 col-sm-6" style="margin: 10px 0px 10px 50%;">
					<button type="submit" class="btn btn-sm btn-success">Submit</button>
				</div>
		</form:form>
	</div>
</div>