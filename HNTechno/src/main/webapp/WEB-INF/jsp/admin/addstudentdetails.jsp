<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script>

function getsublang(id){
	$.ajax({
		type:"POST",
		url:"getsublang.net",
		data:{id:id},
		success:function(html){
			$("#sub").html(html);
		}
	});
}
function getstate(id){
	$.ajax({
		type:"POST",
		url:"getstate.net",
		data:{id:id},
		success:function(html){
			$("#state").html(html);
		}
	});
}
function getcity(id){
	$.ajax({
		type:"POST",
		url:"getcity.net",
		data:{id:id},
		success:function(html){
			$("#city").html(html);
		}
	});
}
function getclg(id){
	$.ajax({
		type:"POST",
		url:"getclg.net",
		data:{id:id},
		success:function(html){
			$("#clg").html(html);
		}
	});
}
</script>
<div class="row">
   <div class="col-md-12">
       <div class="panel panel-inverse">
            <div class="panel-heading">
            	<div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                </div>
                <h4 class="panel-title">Student Profile</h4>
      		 </div>
             <div class="panel-body">
                 <form:form modelAttribute="im" method="POST" data-parsley-validate="true" name="form-wizard">
					<div id="wizard">
						<ol>
							<li>
							    Student Information 
							</li>
							<li>
							    Course Details
							</li>
							<li>
								Authentication
							</li>
							<li>
								College Information
							</li>
							<li>
								Project Information
							</li>
						</ol>
						<!-- begin wizard step-1 -->
						<div class="wizard-step-1">
                            <fieldset>
								<legend class="pull-left width-full">Student Basic Information</legend>
								<!-- begin row -->
                                   <div class="row">
                                      <!-- begin col-4 -->
                                       <div class="col-md-4">
											<div class="form-group block1">
												<label>First Name</label>
													<form:input path="fname" class="form-control" data-parsley-group="wizard-step-1" required="required"/>
											</div>
                                       </div>
                                        <!-- end col-4 -->
                                      <!-- begin col-4 -->
                                        <div class="col-md-4">
											<div class="form-group">
												<label>Middle Name</label>
													<form:input path="mname" class="form-control" data-parsley-group="wizard-step-1" required="required" />
											</div>
                                        </div>
                                         <!-- end col-4 -->
                                          <!-- begin col-4 -->
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Last Name</label>
													<form:input path="lname" class="form-control" data-parsley-group="wizard-step-1" required="required" />
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Mobile Number</label>
													<form:input path="mob" class="form-control" data-parsley-group="wizard-step-1" required="required" />
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Email Id</label>
													<form:input path="email" class="form-control" data-parsley-group="wizard-step-1" required="required" />
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Country</label>
													<select name="Country" onchange="getstate(this.value)" class="form-control" data-style="btn-success">
														<option value="0">Select Country</option>
														<c:forEach items="${list1}" var="v">
															<option value="${v.countryid}">${v.countryname}</option>
														</c:forEach>
													</select>
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>State</label>
													<select name="state" id="state" onchange="getcity(this.value)" class="form-control" data-style="btn-success">
														<option value="0">Select State</option>
													</select>
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>City</label>
													<form:select path="si.cityd.citydid" class="form-control"
														data-size="10" id="city" data-live-search="true" data-style="btn-success">
														<form:option value="0">Select City</form:option>
													</form:select>
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Address</label>
													<form:textarea path="si.address" class="form-control" data-parsley-group="wizard-step-1"/>
											</div>
                                         </div>
                                         <div class="col-md-4">
											<div class="form-group">
												<label>Gender</label>
													<form:radiobutton path="gender" value="male"/><span style="margin:0 10px;">Male</span>
													<form:radiobutton path="gender" value="female"/><span style="margin-left:10px;">Female</span>
											</div>
                                         </div>
                                          <!-- end col-4 -->
                                       </div>
                                            <!-- end row -->
								</fieldset>
							</div>
									<!-- end wizard step-1 -->
						<!-- begin wizard step-2 -->
							<div class="wizard-step-2">
								<fieldset>
									<legend class="pull-left width-full">Course Concept Information</legend>
                                      <!-- begin row -->
                                         <div class="row">
                                             <!-- begin col-6 -->
                                             <div class="col-md-6">
												<div class="form-group">
													<div class="control">
													<label>Language</label>
														<select class="form-control" onclick="getsublang(this.value)" data-style="btn-success">
														<option value="0">Select Language</option>
														<c:forEach items="${list8}" var="v">
															<option value="${v.lid}">${v.lang}</option>
														</c:forEach>
													</select>
													</div>
												</div>
                                              </div>
                                             <div class="col-md-6">
												<div class="form-group">
													<div class="control">
													<label>Sub Language</label>
														<select class="form-control" id="sub" name="sublang"
														data-size="10" data-live-search="true" data-style="btn-success" multiple="multiple">
														<option value="0">Select Sub Language</option>
														</select>
													</div>
												</div>
                                              </div>
                                            	<!-- end col-6 -->
                                                <!-- begin col-6 -->
                                                <div class="col-md-6">
													<div class="form-group">
														<label>Duration</label>
														<form:input path="scm.duration" class="form-control" required="required" />
													</div>
                                                </div>
                                                 <div class="col-md-6">
													<div class="form-group">
														<label>Total Fees</label>
														<form:input path="scm.fees" class="form-control" required="required" />
													</div>
                                                </div>
                                                <!-- end col-6 -->
                                            </div>
                                            <!-- end row -->
										</fieldset>
									</div>
									<!-- end wizard step-2 -->
									<!-- begin wizard step-3 -->
									<div class="wizard-step-3">
										<fieldset>
											<legend class="pull-left width-full">Authentication Details</legend>
                                            <!-- begin row -->
                                            <div class="row">
                                                <!-- begin col-4 -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <div class="controls">
                                                            <form:input path="sa.username" class="form-control" data-parsley-group="wizard-step-3" required="required" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                                <!-- begin col-4 -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Password</label>
                                                        <div class="controls">
                                                            <form:input path="sa.password" class="form-control" data-parsley-group="wizard-step-3" required="required" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                                <!-- end col-6 -->
                                            </div>
                                            <!-- end row -->
                                        </fieldset>
									</div>
									<!-- end wizard step-3 -->
									<!-- begin wizard step-4 -->
									<div>
									    <fieldset>
											<legend class="pull-left width-full">College Information</legend>
                                            <!-- begin row -->
                                            <div class="row">
                                                <!-- begin col-4 -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Field</label>
                                                        <div class="controls">
                                                            <form:select path="sc.f.fieldid" class="form-control"
															data-size="10" data-live-search="true" data-style="btn-success">
															<form:option value="0">Select Field</form:option>
															<c:forEach items="${list2}" var="v">
																<form:option value="${v.fieldid}">${v.fieldname}</form:option>
															</c:forEach>
															</form:select>
														</div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                                <!-- begin col-4 -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>University</label>
                                                        <div class="controls">
                                                            <select name="university" onchange="getclg(this.value)" class="form-control" data-style="btn-success">
															<option value="0">Select Field</option>
															<c:forEach items="${list9}" var="v">
																<option value="${v.umid}">${v.uname}</option>
															</c:forEach>
															</select>
														</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>College</label>
                                                        <div class="controls">
                                                           <form:select path="sc.cd.clgdid" class="form-control"
																id="clg" data-style="btn-success">
															<form:option value="0">Select College</form:option>
															</form:select>
														</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Semester</label>
                                                        <div class="controls">
                                                           <form:select path="sc.sem" class="form-control"
																id="clg" data-style="btn-success">
															<form:option value="0">Select Semester</form:option>
																<form:option value="1">1</form:option>
																<form:option value="2">2</form:option>
																<form:option value="3">3</form:option>
																<form:option value="4">4</form:option>
																<form:option value="5">5</form:option>
																<form:option value="6">6</form:option>
																<form:option value="7">7</form:option>
																<form:option value="8">8</form:option>
															</form:select>
														</div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                               <!-- end col-6 -->
                                            </div>
                                            <!-- end row -->
                                        </fieldset>
									</div>
									<!-- end wizard step-4 -->
									<div>
									    <fieldset>
											<legend class="pull-left width-full">Project Details</legend>
                                            <!-- begin row -->
                                            <div class="row">
                                                <!-- begin col-4 -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Project Definition</label>
                                                        <div class="controls">
                                                            <form:input path="sp.projectdefinition" class="form-control" required="required"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                                <!-- begin col-4 -->
                                               <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Title</label>
                                                        <div class="controls">
                                                           <form:input path="sp.title" class="form-control" required="required"/>
                                                       </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Batch</label>
                                                        <div class="controls">
                                                           <form:select path="sp.b.batchid" class="form-control"
																 data-style="btn-success">
															
															<form:option value="0">Select Batch</form:option>
															<c:forEach items="${batch}" var="v">
															<form:option value="${v.batchid}">${v.batchname}</form:option>
															</c:forEach>
															</form:select>
														</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Training Type</label>
                                                        <div class="controls">
                                                           <form:select path="sp.t.trainid" class="form-control"
																 data-style="btn-success">
															<form:option value="0">Select Training Type</form:option>
															<c:forEach items="${ttype}" var="v">
															<form:option value="${v.trainid}">${v.ttype}</form:option>
															</c:forEach>
															</form:select>
														</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Remark</label>
                                                        <div class="controls">
                                                           <form:input path="sp.remark" class="form-control" required="required"/>
                                                       </div>
                                                    </div>
                                                </div>
                                                <!-- end col-4 -->
                                               <!-- end col-6 -->
                                            </div>
                                            <!-- end row -->
                    <form:hidden path="scd.coursedid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sa.authenticationid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sc.clginfoid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="scm.coursemid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="sp.projectid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="imid"  class="form-control" placeholder="Remark"/>
					<form:hidden path="si.studentid"  class="form-control" placeholder="Remark"/>
                                        </fieldset>
									</div>
								</div>
								<p><input type="submit" class="btn btn-success btn-lg" value="proceed"></p>
							</form:form>
                        </div>
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-12 -->
            </div>