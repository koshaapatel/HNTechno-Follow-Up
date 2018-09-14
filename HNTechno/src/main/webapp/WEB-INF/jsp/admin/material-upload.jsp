<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
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

var c = 1;
function addrawinsert(){
	
	
	var t = document.getElementById("tbody");
	var raw = document.createElement("tr");
	
	
	var col1 = document.createElement("td");
	var col2 = document.createElement("td");
	var col3 = document.createElement("td");
	var col5 = document.createElement("td");
	
	raw.setAttribute("id","n"+c);
	
	var element1 = document.createElement("input");
	element1.type = "text";
	element1.style.width = "95%";
	element1.style.height = "33px";
	element1.style.margin = "auto";
	element1.name = "mname";
	element1.className = "form-control";
	element1.id = "mat_name"+c;
	
	var element2 = document.createElement("input");
	element2.type = "text";
	element2.style.width = "95%";
	element2.style.height = "33px";
	element2.style.margin = "auto";
	element2.name = "title";
	element2.className = "form-control";
	element2.id = "title"+c;
	
	var element3 = document.createElement("input");
	element3.type = "file";
	element3.style.margin = "auto";
	element3.name = "file";
	element3.id = "file"+c;
	element3.accept = ".xlsx,.xls,.doc, .docx,.ppt, .pptx,.txt,.pdf";
	
	var element5 = document.createElement("a");
	var i = document.createElement("i");
	element5.style.margin = "0 25px";
	i.className = "fa fa-times";
	i.style.padding = "7px";
	element5.className = "btn btn-danger btn-icon btn-circle"
	element5.setAttribute("href","javascript:removeRow(\"n" + c + "\");");
	element5.appendChild(i);
	
	col1.appendChild(element1);
	col2.appendChild(element2);
	col3.appendChild(element3);
	col5.appendChild(element5);
	
	raw.appendChild(col1);
	raw.appendChild(col2);
	raw.appendChild(col3);
	raw.appendChild(col5);
	
	t.appendChild(raw);
	c++;
}
function removeRow(rowId) {
	var tBody = document.getElementById("tbody");

	tBody.removeChild(document.getElementById(rowId));

}
deletedata(id){
	document.getElementById("mid").value=id
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
              <h4 class="panel-title">Material Upload</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                  		<th>LANGUAGE</th>
                  		<th>SUB LANGUAGE</th>
                  		<th>FILE</th>
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
                                ${v.sd.sm.l.lang}
                             </td>
                             <td>
                                ${v.sd.sublang}
                             </td>
                             <td>
                            	 <table class="table table-striped table-bordered" >
                            	 	<c:forEach items="${v.ld}" var="z" varStatus="count">
                            	 	<tr class="odd gradeX" id="trsl${z.mdid}">
                        				<td id="tdsl${z.mdid}">
                            				<span id="sl${z.mdid}">${z.file}</span>
                           				 </td>
                           				 <%-- <td id="tdbtn${z.mdid}">
                            				<div class="btn-group pull-right">
                                				<button type="button" id="btn${z.mdid}" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    				<ul class="dropdown-menu" role="menu">
				                       				 	<li><a href="#deletematerial" onclick="deletedata(${z.mdid})" data-toggle="modal">Delete</a></li>
				                        			</ul>
				                			 </div>
                            			 </td> --%>
                           			</tr>
                           			</c:forEach>
                            	 </table>
                             </td>
                     		  <td>
                     		  	<c:forEach items="${v.ld}" var="z" varStatus="count">
                     		  		<a  href='<c:url value="download.net?p=${z.file}"/>'>Download</a>
                     		 	</c:forEach>
                     		  </td>
                             <%-- <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted(${v.mmid})" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-dialog${v.mmid}" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove(${v.mmid})" data-toggle="modal">Remove</a></li>
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
    <!-- model dialoge for insert -->
    <div class="modal fade" id="modal-dialog-insert">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
					<h4 class="modal-title"></h4>
				</div>
				<form:form modelAttribute="m1" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form" enctype="multipart/form-data">
				<div class="panel-body panel-form">
					<div class="panel-body">
							<div class="panel-body">
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
								<table id="tbody" border="1" class="table table-striped table-bordered">
								<tr>
								<th>
									Material Name
								</th>
								<th>
									Title
								</th>
								<th>
									Upload File
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
						</div>
					</form:form>
                  </div>
			</div>
		</div>
	<%-- 	<!-- #modal-alert for delete -->
	<div class="modal fade" id="deletematerial">
		<form action="deletematerial.net" method="POST">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger m-b-0">
						
						<p>Do U Really Want To Delete?</p>
					</div>
				</div>
				<input type="hidden" name="id" id="mid">
				<div class="modal-footer">
					
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Confirm</button>
				</div>
			</div>
		</div>
		</form>
	</div> --%>