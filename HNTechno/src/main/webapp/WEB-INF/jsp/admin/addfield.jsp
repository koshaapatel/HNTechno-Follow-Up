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
function update(id,f) {
	document.getElementById("l"+id).style.display="none";
	 document.getElementById("button"+id).style.display="none";
	  
    	var l1=document.getElementById("tdl"+id);
    	l1.style="autocomplete:off";
     	var field = document.createElement('input');
     	field.type = "text";
     	field.name = "field";
     	field.id = "field"
     	field.value = f;
     	field.className = "form-control";
     	field.onblur = function(){space()};
     	
		l1.appendChild(field);
		
		var a= document.getElementById("tdbutton"+id);
	 	var element1 = document.createElement('input');
		element1.type = "submit";
		element1.value = "Update";
		element1.className = "btn btn-success active";
		
		element1.style="margin-right:3px";
		a.appendChild(element1);
		
  		var element2 = document.createElement('input');	
		element2.type = "button";
		element2.value = "cancel";
		element2.className = "btn btn-default active";
		
		element2.onclick=function restore()
		{
			window.location.href="addfield.net"; 
			
		};
		a.appendChild(element2);
		   var element3 = document.createElement('input');
			element3.type = "hidden";
			element3.name = "id";
			element3.value = id;
			document.getElementById("tdl"+id).appendChild(element3);
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
              <h4 class="panel-title">Field</h4>
            </div>
        	<div class="panel-body">
        	<form action="updatefield.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                  		<th>FIELD</th>
                  		<th>ACTION</th>
                     </tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                 	 <c:if test="${v.active_flag eq 0}">
                     	<tr class="odd gradeX" id="tr${v.fieldid}">
                        	<td id="tdc${v.fieldid}">
                            	<span id="c${v.fieldid}">	${count.count }</span>
                            </td>
                            <td id="tdl${v.fieldid}">
                                <span id="l${v.fieldid}"> ${v.fieldname}</span>
                             </td>
                             <td id="tdbutton${v.fieldid}">
                            	<div class="btn-group pull-right" style="position: relative;">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown" id="button${v.fieldid}"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete${v.fieldid}"  data-toggle="modal">Delete</a></li>
	                    					<li onclick="update(${v.fieldid},'${v.fieldname}')"><a href="#">Edit</a></li>
   		           						   	<li><a href="#modal-alert-remove${v.fieldid}"  data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td>
                         </tr>
                         </c:if>
                         <c:if test="${v.active_flag eq 1}">
                     	<tr class="danger" id="tr${v.fieldid}">
                        	<td id="tdc${v.fieldid}">
                            	<span id="c${v.fieldid}">${count.count }</span>
                            </td>
                            <td id="tdl${v.fieldid}">
                                <span id="l${v.fieldid}"> ${v.fieldname}</span>
                             </td>
                             <td id="tdbutton${v.fieldid}">
                            	<div class="btn-group pull-right" style="position: relative;">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown" id="button${v.fieldid}"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete${v.fieldid}"  data-toggle="modal">Delete</a></li>
	                    					<li><a href="#modal-alert-retrieve${v.fieldid}"  data-toggle="modal">Retrieve</a></li>
                						 </ul>
				                 </div>
                             </td>
                         </tr>
                         </c:if>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="#modal-dialog" class="btn btn-sm btn-success" data-toggle="modal" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
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
					<form:form modelAttribute="m1" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4" for="fullname">Field * :</label>
								<div class="col-md-6 col-sm-6">
									<form:input path="fieldname" onblur = "space()" autocomplete="off" class="form-control" type="text" id="lang" placeholder="Required" data-parsley-required="true" />
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
	<!-- #modal-alert for delete -->
	<c:forEach items="${list}" var="x" varStatus="count">
	<div class="modal fade" id="modal-alert-delete${x.fieldid}">
		<form action="deletefield.net" method="POST">
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
				<input type="hidden" name="id"  value="${x.fieldid}">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</c:forEach>
	<!-- #modal-alert for remove -->
	<c:forEach items="${list}" var="x" varStatus="count">
	<div class="modal fade" id="modal-alert-remove${x.fieldid}">
		<form action="removefield.net" method="POST">
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
				<input type="hidden" name="id"  value="${x.fieldid}">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</c:forEach>
	<!-- #modal-alert for retrieve -->
	<c:forEach items="${list}" var="x" varStatus="count">
	<div class="modal fade" id="modal-alert-retrieve${x.fieldid}">
		<form action="retrievefield.net" method="POST">
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
				<input type="hidden" name="id"  value="${x.fieldid}">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	</c:forEach>
	
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
</body>