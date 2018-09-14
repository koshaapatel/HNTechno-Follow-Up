<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<body>
 <script>
 function space()
{
	var a=document.getElementById("lang");	
	var ab=a.value;
	a.value=ab.trim();
}
 function poi(id)
 {
	 document.getElementById("inddd").value = id;
 }
 function viewa(id)
 {
	 document.getElementById("vid").value = id;
 }
 </script>
	<div class="col-md-12">
		 <div class="panel panel-inverse">
         	<div class="panel-heading">
          	  <div class="panel-heading-btn">
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
	              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
              </div>
              <h4 class="panel-title">Inquiry</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                   		<th>FIRST NAME</th>
                   		<th>MIDDLE NAME</th>
                   		<th>LAST NAME</th>
                   		<th>EMAIL</th>
                   		<th>MOBILE</th>
                  		<th>STATUS</th>
                  		<!-- <th>ACTION</th>
                      --></tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                 	 <c:if test="${v.active_flag eq 0}">
                     	<tr class="odd gradeX">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.fname}
                             </td>
                             <td>
                             	${v.mname}
                             </td>
                             <td>
                             	${v.lname}
                             </td>
                            <td>
                             	${v.email}
                             </td>
                              <td>
                             	 ${v.mob}
                             </td>
                            <td id="td${v.imid}">
                             	 <div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success btn-xs" data-toggle="dropdown">Follow Status<span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                   		 <li><a href="#inquiryfollow${v.imid}" data-toggle="modal">Insert</a></li>
                                  		  <li><a href="" data-target="#viewfollow${v.imid}" data-toggle="modal">View</a></li>
                                    </ul>
                            </div><br/><br/>
                            <div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success btn-xs" data-toggle="dropdown">Inquiry Status<span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                   		 <li class="active"><a href="#">Pending</a></li>
                                  		  <li><a href="studentregistration.net?id=${v.imid}">Confirm</a></li>
                                  		  <li><a href="" data-target="#cancelinquiry${v.imid}" data-toggle="modal">Cancel</a></li>
                                    </ul>
                            </div><br/><br/>
                             <div class="btn-group pull-right">
                                <button type="button" class="btn btn-success btn-xs" data-toggle="dropdown">Appointment Status<span class="caret"></span></button>
                                   <ul class="dropdown-menu" role="menu">
                                   	 <li><a href="#addappointment" onclick="poi(${v.imid})" data-toggle="modal">Insert</a></li>
                                  	<li><a href="#viewappointment${v.imid}" data-toggle="modal">View</a></li>
                                  </ul>
                            </div>
                           
                            </td>
                             <!-- <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted()" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-dialog" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove()" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td> -->
                         </tr>
                         </c:if>
                         <c:if test="${v.active_flag eq 1}">
                     	<tr class="odd gradeX danger">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.fname}
                             </td>
                             <td>
                             	${v.mname}
                             </td>
                             <td>
                             	${v.lname}
                             </td>
                            <td>
                         		${v.email}
                            </td>
                              <td>
                             	 ${v.mob}
                             </td>
                            <td>
                            
                           <div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success btn-xs" data-toggle="dropdown">Inquiry Status<span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                   		 <li><a href="" data-target="#retrieveinquiry${v.imid}" data-toggle="modal">Retrieve</a></li>
                                    </ul>
                            </div><br/><br/>
                            
		                     </td>
                            <!--  <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted()" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-dialog" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove()" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td> -->
                         </tr>
                         </c:if>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="addinquiry.net" class="btn btn-sm btn-success" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
                  	<button type="button" class="btn btn-success active"><i class="fa fa-edit"></i></button></a>
           </div>
       </div>
    </div>
     <!-- #modal-alert for inquiryfollow -->
     <c:forEach items="${list}" var="v">
     <div class="modal fade" id="inquiryfollow${v.imid}">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<form action="addfollowstatus.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
				<div class="panel-body panel-form">
					
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Summary * :</label>
								<div class="col-md-6 col-sm-6">
									<textarea rows="2" cols="3" onblur = "space()" class="form-control" name="follow" placeholder="Enter Summary" data-parsley-required="true"></textarea>
								</div>
						</div>
					
				</div>
				<input type="hidden" name="id"  value="${v.imid}">
				
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					</div>
					</form>
			</div>
		</div>
	</div>
	</c:forEach>
	
	 <!-- #modal-alert for viewfollow -->
 <c:forEach items="${list}" var="z">
	<div class="modal fade" id="viewfollow${z.imid}">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Summary Details:</label>
								<div class="col-md-6 col-sm-6">
									<c:forEach items="${list6}" var="a"> 
									<c:if test="${a.im.imid eq z.imid}">
										<input type="text" class="form-control" value="${a.followdetails}" class="form-control" readonly="readonly">
									</c:if>
									</c:forEach>
								</div>
						</div>
                  </div>
                  
			</div>
		</div>
	</div>
	</c:forEach>

<!-- #modal-alert for cancel -->
	<c:forEach items="${list}" var="x" varStatus="count">
	<div class="modal fade" id="cancelinquiry${x.imid}">
		<form action="cancelinquiry.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want Cancel?</p>
					</div>
				</div>
				<input type="hidden" name="id"  value="${x.imid}">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</c:forEach>
	
	<!-- #modal-alert for retrieveinquiry -->
	<c:forEach items="${list}" var="x" varStatus="count">
	<div class="modal fade" id="retrieveinquiry${x.imid}">
		<form action="retrieveinquiry.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want Retrieve?</p>
					</div>
				</div>
				<input type="hidden" name="id"  value="${x.imid}">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</c:forEach>
	<!-- #modal-alert for addappointment -->
     <div class="modal fade" id="addappointment">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<form action="addappointment.net" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" method="post">
				<div class="form-group">
                    <label class="col-md-3 control-label">Language *</label>
                    <div class="col-md-9">
					 <select name="language" class="form-control">
                       	<option value="0">Select Language</option>
               	        	<c:forEach items="${list8}" var="v">
								<option value="${v.lid}">${v.lang}</option>
							</c:forEach>
					</select>
					</div>
				</div>
				<div class="form-group">
                    <label class="col-md-3 control-label">Faculty *</label>
                    <div class="col-md-9">
					<select name="faculty" class="form-control">
                       	<option value="0">Select Faculty</option>
               	        	<c:forEach items="${list7}" var="v">
								<option value="${v.facultyid}">${v.facultyname}</option>
							</c:forEach>
					</select>
				</div>
				</div>
				 <div class="form-group">
                    <label class="col-md-3 control-label">Appointment Date *</label>
                    <div class="col-md-9">
            	           <div class="input-group date">                        
            	               <input type="text" name="date" class="form-control" placeholder="dd-mm-yyyy" />
                               <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                           </div>
                      </div>
               </div>
               <div class="form-group">
                    <label class="col-md-3 control-label">Remarks *</label>
                    <div class="col-md-9">
            	            <input type="text" name="remark" class="form-control" placeholder="Remark" />
                  	 </div>
               </div>
				<input type="hidden" name="id"  id="inddd">
				<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					</div>
					</form>
				</div>
			</div>
					
			</div>
 <!-- #modal-alert for viewappointment -->
 <c:forEach items="${list}" var="z">
	<div class="modal fade" id="viewappointment${z.imid}">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<c:forEach items="${list12}" var="v">
				<c:if test="${z.imid eq v.im.imid}">
				<div class="panel-body panel-form">
					<div class="form-group">
                    <label class="col-md-3 control-label">Language </label>
                    <div class="col-md-9">
					 <input type="text" value="${v.l.lang}" class="form-control" disabled="disabled"/>
					</div>
				</div>
				<div class="form-group">
                    <label class="col-md-3 control-label">Faculty </label>
                    <div class="col-md-9">
					<input type="text" value="${v.f.facultyname}" class="form-control" disabled="disabled"/>
				</div>
				</div>
				 <div class="form-group">
                    <label class="col-md-3 control-label">Appointment Date </label>
                    <div class="col-md-9">
            	               <input type="text" value="${v.date}" class="form-control" disabled="disabled"/>
                    </div>
               </div>
              
               <div class="form-group">
                    <label class="col-md-3 control-label">Remarks </label>
                    <div class="col-md-9">
            	           <input type="text" value="${v.remark}" class="form-control" disabled="disabled"/>
                  	 </div>
               </div>
                  </div>
                   </c:if>
               </c:forEach>
			</div>
		</div>
	</div>
	</c:forEach>
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
</body>