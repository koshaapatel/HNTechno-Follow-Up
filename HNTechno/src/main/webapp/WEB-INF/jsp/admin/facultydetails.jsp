<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script>
function remove(id) {
	document.getElementById("fid").value=id;
}
function retrieve(id) {
	document.getElementById("ffid").value=id;
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
              <h4 class="panel-title">Faculty Details</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                   		<th>NAME</th>
                   		<th>USER NAME</th>
                   		<th>ROLE</th>
                  		<th>EMAIL & MOBILE</th>
                  		<th>SUB LANGUAGE</th>
                  		<th>JOIN DATE</th>
                  		<th>IMAGE</th>
                  		<th>ACTION</th>
                     </tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                 	 <c:if test="${v.active_flag eq 0}">
                     	<tr class="odd gradeX">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.facultyname}
                             </td>
                              <td>
                             	${v.username}
                             </td>
                             <td>
                             	${v.role}
                             </td>
                             <td>
                            	 ${v.emailid}<br/>${v.mob}
                             </td>
                             <td>
                             	${v.sd.sublang}
                             </td>
                            <td>
                             	${v.joindate}
                             </td>
                             <td>
                             	<img src='<c:url value="/files/${v.facultyimage}"/>' style="width: 30px;height: 30px;">
                             </td>
                             <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-remove" onclick="remove(${v.facultyid})" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td>
                         </tr>
                         </c:if>
                         <c:if test="${v.active_flag eq 1}">
                     	<tr class="odd gradeX danger">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.facultyname}
                             </td>
                              <td>
                             	${v.username}
                             </td>
                             <td>
                             	${v.role}
                             </td>
                             <td>
                            	 ${v.emailid}<br/>${v.mob}
                             </td>
                             <td>
                             	${v.sd.sublang}
                             </td>
                            <td>
                             	${v.joindate}
                             </td>
                             <td>
                             	<img src='<c:url value="/files/${v.facultyimage}"/>'>
                             </td>
                             <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-retrieve" onclick="retrieve(${v.facultyid})" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td>
                         </tr>
                         </c:if>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="addfacultydetails.net" class="btn btn-sm btn-success" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
                  	<button type="button" class="btn btn-success active"><i class="fa fa-edit"></i></button></a>
           </div>
       </div>
    </div>
<!-- #modal-alert for remove -->
	<div class="modal fade" id="modal-alert-remove">
		<form action="removefaculty.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want Remove?</p>
					</div>
				</div>
				<input type="hidden" name="id" id="fid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- #modal-alert for retrieve -->
	<div class="modal fade" id="modal-alert-retrieve">
		<form action="retrievefaculty.net" method="POST">
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
				<input type="hidden" name="id" id="ffid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
 </body>