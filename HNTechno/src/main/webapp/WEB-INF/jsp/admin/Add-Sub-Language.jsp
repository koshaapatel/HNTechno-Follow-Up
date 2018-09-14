<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<body>
<script>
function space()
{
	var a=document.getElementById("sublang");	
	var ab=a.value;
	a.value=ab.trim();
}

var count = 1;

function addrawinsert(){
	
	var t = document.getElementById("tbody");
	var raw = document.createElement("tr");
	
	var col1 = document.createElement("td");
	var col2 = document.createElement("td");
	var col3 = document.createElement("td");
	var col4 = document.createElement("td");
	var col5 = document.createElement("td");
	
	raw.setAttribute("id","n"+count);
	
	var element1 = document.createElement("input");
	element1.type = "text";
	element1.style.width = "95%";
	element1.style.height = "33px";
	element1.style.margin = "auto";
	element1.name = "sublang";
	element1.id = "sublang";
	element1.className = "form-control";
	element1.id = "sublang"+count;
	
	var element2 = document.createElement("input");
	element2.type = "text";
	element2.style.width = "95%";
	element2.style.margin = "auto";
	element2.className = "form-control";
	element2.style.height = "33px";
	element2.name = "title";
	element2.id = "title"+count;
	
	var element3 = document.createElement("input");
	element3.type = "text";
	element3.style.width = "95%";
	element3.style.margin = "auto";
	element3.className = "form-control";
	element3.style.height = "33px";
	element3.name = "fees";
	element3.id = "fees"+count;
	
	var element4 = document.createElement("input");
	element4.type = "text";
	element4.style.width = "95%";
	element4.style.margin = "auto";
	element4.className = "form-control";
	element4.style.height = "33px";
	element4.name = "course";
	element4.id = "course"+count;
	
	var element5 = document.createElement("a");
	var i = document.createElement("i");
	i.className = "fa fa-times";
	element5.className = "btn btn-danger btn-icon btn-circle"
	element5.style.margin = "0 25px";
	i.className = "fa fa-times";
	i.style.padding = "7px";
	element5.setAttribute("href","javascript:removeRow(\"n" + count + "\");");
	element5.appendChild(i);
	
	col1.appendChild(element1);
	col2.appendChild(element2);
	col3.appendChild(element3);
	col4.appendChild(element4);
	col5.appendChild(element5);
	
	raw.appendChild(col1);
	raw.appendChild(col2);
	raw.appendChild(col3);
	raw.appendChild(col4);
	raw.appendChild(col5);
	
	t.appendChild(raw);
	count++;
}
function removeRow(rowId) {
	var tBody = document.getElementById("tbody");
	tBody.removeChild(document.getElementById(rowId));

}

/* function deletedata(id)
{
	document.getElementById('aid').value = id;
}
function retrieve(id)
{
	document.getElementById('aid').value = id;
}
function deleted(id) {
	document.getElementById('ids').value = id;
} */
/* function update(id,s) {
	document.getElementById("sl"+id).style.display="none";
    document.getElementById("btn"+id).style.display="none";
	  
    	var l1=document.getElementById("tdsl"+id);
    	l1.style="autocomplete:off";
     	var slang = document.createElement("input");
     	slang.type = "text";
     	slang.name = "slang";
     	slang.value = s;
     	slang.className = "form-control";
     	slang.onblur = function(){space()};
     	
		l1.appendChild(slang);
		
    	var a= document.getElementById("tdbtn"+id);
	 	var element1 = document.createElement("input");
		element1.type = "submit";
		element1.value = "Save";
		element1.className = "btn btn-success active";
		a.appendChild(element1);
		
  		var element2 = document.createElement("input");	
		element2.type = "button";
		element2.value = "Cancel";
		element2.className = "btn btn-default active";
		
		element2.onclick=function restore()
		{
			window.location.href="AddsubLang.net"; 
			
		};
		a.appendChild(element2);
		
		   var element3 = document.createElement("input");
			element3.type = "hidden";
			element3.name = "id";
			element3.value = id;
			document.getElementById("tdsl"+id).appendChild(element3);
} */
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
              <h4 class="panel-title">Sub Language</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                  		<th>LANGUAGE</th>
                  		<th>SUB LANGUAGE</th>
                  		<!-- <th>ACTION</th>
                     --> </tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                     	<tr class="odd gradeX">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.l.lang}
                             </td>
                             <td>
                            	 <table class="table table-striped table-bordered" >
                            	 	<c:forEach items="${v.s}" var="z" varStatus="count">
                            	 	<c:if test="${z.active_flag eq 0 }">
                            	 	<tr class="odd gradeX" id="trsl${z.sdid}">
                        				<td id="tdsl${z.sdid}">
                            				<span id="sl${z.sdid}">${z.sublang}</span>
                           				 </td>
                           				 <%-- <td id="tdbtn${z.sdid}">
                            				<div class="btn-group pull-right">
                                				<button type="button" id="btn${z.sdid}" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    				<ul class="dropdown-menu" role="menu">
				                       				 	<li><a href="#modal-alert-delete1" onclick="deletedata(${z.sdid})" data-toggle="modal">Delete</a></li>
				                        				<li onclick="update(${z.sdid},'${z.sublang}')"><a href="#">Edit</a></li>
				                        			</ul>
				                			 </div>
                            			 </td> --%>
                           			</tr>
                           			</c:if>
                           			<c:if test="${z.active_flag eq 1 }">
                            	 	<tr class="odd gradeX danger" id="trsl${z.sdid}"> 
                        				<td id="tdsl${z.sdid}">
                            				<span id="sl${z.sdid}">${z.sublang}</span>
                           				 </td>
                           				 <%-- <td id="tdbtn${z.sdid}">
                            				<div class="btn-group pull-right">
                                				<button type="button" id="btn${z.sdid}" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    				<ul class="dropdown-menu" role="menu">
				                       				 	<li><a href="#modal-alert-retrieve1" onclick="retrieve(${z.sdid})" data-toggle="modal">Retrieve</a></li>
				                        			</ul>
				                			 </div>
                            			 </td> --%>
                           			</tr>
                           			</c:if>
                           			</c:forEach>
                            	 </table>
                             </td>
                       
                            <%--  <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-dialog-update${v.smid}" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove(${v.smid})" data-toggle="modal">Remove</a></li>
				                         </ul>
				                 </div>
                             </td> --%>
                         </tr>
                       </c:forEach> 
                    </tbody>
                  </table>
                  </form>
                  <a href="#modal-dialog-insert" class="btn btn-sm btn-success" data-toggle="modal" style="margin: 0;padding: 0;position: fixed;bottom: 10px;right: 10px;">
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
				<form:form modelAttribute="m2" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form">
				<div class="panel-body panel-form">
					<div class="panel-body">
							<div class="form-group">
                                    <label class="col-md-3 control-label">Language *</label>
                                   	 <div class="col-md-9">
                                        <form:select path="l.lid" class="form-control">
                                        	<option value="0">Select Language</option>
                                          	<c:forEach items="${list1}" var="v">
													<option value="${v.lid}">${v.lang}</option>
											</c:forEach>
										</form:select>
                                   </div>
                             </div>
								
								<table id="tbody" border="1" class="table table-striped table-bordered">
								<tr>
									<th>
										Sub Language
									</th>
									<th>
										Title
									</th>
									<th>
										Fees
									</th>
									<th>
										Course Content
									</th>
									<th>
										Action
									</th>
									
								</tr>
								
								</table>
								</div>
								
								<label style="margin-left: 75%;"> 
						<button type="button" class="btn btn-sm btn-success" onclick="addrawinsert()">AddRaw</button>
						</label>
						</div>
						
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-success">Add</button>
						<a href="javascript:;" data-dismiss="modal" class="btn btn-sm btn-white">Close</a>
						</div>
					</form:form>
                  </div>
			</div>
		</div>
  <%-- 
	<!-- #modal-alert for delete1 -->
	<div class="modal fade" id="modal-alert-delete1">
		<form action="delete1.net" method="POST">
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
				<input type="hidden" name="id" id="aid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- #modal-alert for retrieve1 -->
	<div class="modal fade" id="modal-alert-retrieve1">
		<form action="retrieve1.net" method="POST">
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
				<input type="hidden" name="id" id="aid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div> --%>
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
</body>