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
              <h4 class="panel-title">Batch Details</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                   		<th>BATCH NAME</th>
                   		<th>LANGUAGE</th>
                   		<th>SUB LANGUAGE</th>
                   		<th>FACULTY NAME</th>
                   		<th>START DATE & END DATE</th>
                   		<th>START TIME & END TIME</th>
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
                                ${v.batchname}
                             </td>
                              <td>
                             	${v.sd.sm.l.lang}
                             </td>
                             <td>
                             	${v.sd.sublang}
                             </td>
                             <td>
                             	${v.f.facultyname}
                             </td>
                             <td>
                             	${v.sdate}<br/>to
                             	${v.edate}
                             </td>
                             <td>
                             	${v.stime}<br/>to
                             	${v.etime}
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
                  <a href="#modal-dialog-insert" data-toggle="modal" class="btn btn-sm btn-success" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
                  	<button type="button" class="btn btn-success active"><i class="fa fa-edit"></i></button></a>
           </div>
       </div>
    </div>
    <div class="modal fade" id="modal-dialog-insert">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="panel-body panel-form">
					<form:form modelAttribute="m2" class="form-horizontal form-bordered">
						<div class="form-group">
	                        <label class="col-md-3 control-label">Language *</label>
    	                      	 <div class="col-md-9">
        	                         <select onchange="getData(this.value)" class="form-control">
            	                         <option value="0">Select Language</option>
											<c:forEach items="${list1}" var="v">
												<option value="${v.lid}">${v.lang}</option>
											</c:forEach>
									</select>
                    	          </div>
                        </div>
						<div class="form-group">
            	            <label class="col-md-3 control-label">Sub Language *</label>
                            	<div class="col-md-9">
                        	        <form:select path="sd.sdid" id="sub" class="form-control">
                    	                <form:option value="0">Select Sub Language</form:option>
											
									</form:select>
                                 </div>
	                     </div>
	                     <div class="form-group">
							<label class="control-label col-md-3">Batch Name * :</label>
								<div class="col-md-9">
									<form:input path="batchname" onblur = "space()" autocomplete="off" class="form-control" id="lang" placeholder="Enter Batch Name" required="required" />
								</div>
						</div>
						<div class="form-group">
	                        <label class="col-md-3 control-label">Faculty *</label>
    	                      	 <div class="col-md-9">
        	                         <form:select path="f.facultyid" class="form-control">
            	                         <form:option value="0">Select Faculty</form:option>
											<c:forEach items="${list2}" var="v">
												<form:option value="${v.facultyid}">${v.facultyname}</form:option>
											</c:forEach>
									</form:select>
                    	          </div>
                        </div>
                        <div class="form-group">
            	  		  <label class="control-label col-md-3">Start Date * :</label>
            	           <div class="col-md-9">
            		           <div class="input-group date" id="datepicker-disabled-past" data-date-format="dd/mm/yyyy" data-date-start-date="Date.default">                        
            	   	            <input type="text" name="sdate" class="form-control" required="required" placeholder="dd-mm-yyyy" />
                    	           <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                       		    </div>
                     	  </div>
               			</div>
               			<div class="form-group">
            	  		  <label class="control-label col-md-3">End Date * :</label>
            	           <div class="col-md-9">
            		           <div class="input-group date" id="datepicker-disabled-past" data-date-format="dd/mm/yyyy" data-date-start-date="Date.default">                        
            	   	            <input type="text" name="edate" class="form-control" required="required" placeholder="dd-mm-yyyy" />
                    	           <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                       		    </div>
                     	  </div>
               			</div>
               			<div class="form-group">
							<label class="control-label col-md-3">Start Time * :</label>
								<div class="col-md-9">
							        <div class="input-group date" id="datetimepicker2">
                                       <form:input path="stime" class="form-control"/>
                                          <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-time"></span>
                                          </span>
                                      </div>
                                 </div>
                         </div>
                         <div class="form-group">
							<label class="control-label col-md-3">End Time * :</label>
								<div class="col-md-9">
							        <div class="input-group date" id="datetimepicker2">
                                       <form:input path="etime" class="form-control"/>
                                          <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-time"></span>
                                          </span>
                                      </div>
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

<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
 </body>