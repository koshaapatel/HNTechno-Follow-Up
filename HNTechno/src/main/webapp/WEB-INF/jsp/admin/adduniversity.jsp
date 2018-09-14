<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<script>
function space()
{
	var a=document.getElementById("uname");	
	var ab=a.value;
	a.value=ab.trim();
}
function update(id,u) {
	document.getElementById("u"+id).style.display="none";
	 document.getElementById("button"+id).style.display="none";
	  
    	var l1=document.getElementById("tdu"+id);
    	l1.style="autocomplete:off";
     	var u1 = document.createElement("input");
     	u1.type = "text";
     	u1.name = "uu";
     	u1.id = "uu"
     	u1.value = u;
     	u1.className = "form-control";
     	u1.onblur = function(){space()};
     	
     	l1.appendChild(u1);
		
		var a= document.getElementById("tdbutton"+id);
	 	var element1 = document.createElement('input');
		element1.type = "submit";
		element1.value = "Update";
		element1.className = "btn btn-success active";
		element1.style="margin-right:3px";
		a.appendChild(element1);
		
  		var element2 = document.createElement("input");	
		element2.type = "button";
		element2.value = "cancel";
		element2.className = "btn btn-default active";
		element2.onclick=function restore()
		{
			window.location.href="xyz.net"; 
		};
		a.appendChild(element2);
		  
		var element3 = document.createElement("input");
			element3.type = "hidden";
			element3.name = "id";
			element3.value = id;
			document.getElementById("tdu"+id).appendChild(element3);
}
function deleted(id) {
	document.getElementById("did").value = id;
}
function remove(id) {
	document.getElementById("rid").value = id;
}
function retrieve(id) {
	document.getElementById("reid").value = id;

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
              <h4 class="panel-title">University</h4>
            </div>
        	<div class="panel-body">
        	<form action="updateuniversity.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                  		<th>UNIVERSITY</th>
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
                            <td id="tdu${v.umid}">
                            	<span id="u${v.umid}">${v.uname}</span>
                             </td>
                       			
                             <td id="tdbutton${v.umid}">
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown" id="button${v.umid}"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted(${v.umid})" data-toggle="modal">Delete</a></li>
				                        	<li onclick="update(${v.umid},'${v.uname}')"><a href="#">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove(${v.umid})" data-toggle="modal">Remove</a></li>
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
                            <td id="tdu${v.umid}">
                            	<span id="u${v.umid}">${v.uname}</span>
                             </td>
                       			
                             <td id="tdbutton${v.umid}">
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown" id="button${v.umid}"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted(${v.umid})" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-alert-retrieve" onclick="retrieve(${v.umid})" data-toggle="modal">Retrieve</a></li>
				                         </ul>
				                 </div>
                             </td>
                         </tr>
                         </c:if>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="#modal-dialog-insert" class="btn btn-sm btn-success" data-toggle="modal" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
                  	<button type="button" class="btn btn-success active"><i class="fa fa-edit"></i></button></a>
           </div>
       </div>
    </div>
    <!-- model dialoge for insert -->
    <div class="modal fade" id="modal-dialog-insert">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<form:form modelAttribute="m1" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" enctype="multipart/form-data">
				<div class="panel-body panel-form">
					<div class="form-group">
						<label class="control-label col-md-4 col-sm-4" for="fullname">University * :</label>
							<div class="col-md-6 col-sm-6">
								<form:input path="uname" onblur = "space()" autocomplete="off" class="form-control" id="lang" placeholder="Required" data-parsley-required="true" />
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" data-dismiss="modal" class="btn btn-sm btn-white">Close</a>
						</div>
				</div>
					</form:form>
                  </div>
			</div>
		</div>
		<!-- #modal-alert for delete -->
	<div class="modal fade" id="modal-alert-delete">
		<form action="deleteuniversity.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want To Delete?</p>
					</div>
				</div>
				<input type="hidden" name="id" id="did">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- #modal-alert for remove -->
	<div class="modal fade" id="modal-alert-remove">
		<form action="removeuniversity.net" method="POST">
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
				<input type="hidden" name="id" id="rid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- #modal-alert for retrieve -->
	<div class="modal fade" id="modal-alert-retrieve">
		<form action="retrieveuniversity.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want To Retrieve?</p>
					</div>
				</div>
				<input type="hidden" name="id" id="reid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>