<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<script>
function getData(id){
	$.ajax({
		type:"POST",
		url:"getstate.net",
		data:{id:id},
		success:function(html){
			$("#sub").html(html);
		}
	});
}
function addrawinsert(){
	
	var c = 1;
	
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
	element1.name = "city";
	element1.className = "form-control";
	element1.id = "city"+c;
	
	var element2 = document.createElement("a");
	var i = document.createElement("i");
	element2.style.margin = "0 25px";
	i.className = "fa fa-times";
	i.style.padding = "7px";
	element2.className = "btn btn-danger btn-icon btn-circle"
	element2.setAttribute("href","javascript:removeRow(\"n" + c + "\");");
	element2.appendChild(i);
	
	col1.appendChild(element1);
	col2.appendChild(element2);
	
	raw.appendChild(col1);
	raw.appendChild(col2);
	
	t.appendChild(raw);
	c++;
}
function removeRow(rowId) {
	var tBody = document.getElementById("tbody");
	tBody.removeChild(document.getElementById(rowId));
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
              <h4 class="panel-title">City</h4>
            </div>
        	<div class="panel-body">
        	<form action="update1.net" method="post">
            	<table id="data-table" class="table table-striped table-bordered">
               	 <thead>
                 	<tr>
                   		<th>NO</th>
                  		<th>COUNTRY</th>
                  		<th>STATE</th>
                  		<th>CITY</th>
                  		<!-- <th>ACTION</th>
                      --></tr>
                  </thead>
                  <tbody>
                 	 <c:forEach items="${list}" var="v" varStatus="count">
                     	<tr class="odd gradeX">
                        	<td>
                            	${count.count}
                            </td>
                            <td>
                                ${v.sd.sm.c.countryname}
                             </td>
                             <td>
                                ${v.sd.statename}
                             </td>
                             <td>
                            	 <table class="table table-striped table-bordered" >
                            	 	<c:forEach items="${v.cd}" var="z" varStatus="count">
                            	 	<tr class="odd gradeX" id="trsl${z.citydid}">
                        				<td id="tdsl${z.citydid}">
                            				<span id="sl${z.citydid}">${z.cityname}</span>
                           				 </td>
                           				<%--  <td id="tdbtn${z.citydid}">
                            				<div class="btn-group pull-right">
                                				<button type="button" id="btn${z.citydid}" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    				<ul class="dropdown-menu" role="menu">
				                       				 	<li><a href="#modal-alert-delete1" onclick="deletedata(${z.citydid})" data-toggle="modal">Delete</a></li>
				                        				<li onclick="update(${z.citydid},'${z.cityname}')"><a href="#">Edit</a></li>
				                        			</ul>
				                			 </div>
                            			 </td> --%>
                           			</tr>
                           			</c:forEach>
                            	 </table>
                             </td>
                       
                             <%-- <td>
                            	<div class="btn-group pull-right">
                                	<button type="button" class="btn btn-success active" data-toggle="dropdown"><i class="fa fa-pencil"></i></button>
                                    	<ul class="dropdown-menu" role="menu">
				                        	<li><a href="#modal-alert-delete" onclick="deleted(${v.citymid})" data-toggle="modal">Delete</a></li>
				                        	<li><a href="#modal-dialog${v.citymid}" data-toggle="modal">Edit</a></li>
				                        	<li><a href="#modal-alert-remove" onclick="remove(${v.citymid})" data-toggle="modal">Remove</a></li>
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
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<form:form modelAttribute="m2" class="form-horizontal form-bordered" data-parsley-validate="true" name="demo-form">
				<div class="panel-body panel-form">
					<div class="panel-body">
							<div class="form-group">
                                    <label class="col-md-3 control-label">Country *</label>
                                   	 <div class="col-md-9">
                                        <select onchange="getData(this.value)" class="form-control">
                                        	<option value="0">Select Country</option>
                                          	<c:forEach items="${list2}" var="v">
													<option value="${v.countryid}">${v.countryname}</option>
											</c:forEach>
										</select>
                                   </div>
                             </div>
							<div class="form-group">
                                    <label class="col-md-3 control-label">State *</label>
                                   	 <div class="col-md-9">
                                        <form:select path="sd.statedid" class="form-control" id="sub">
                                        	<form:option value="0">Select State</form:option>
										</form:select>
                                   </div>
                             </div>
								<table id="tbody" border="1" class="table table-striped table-bordered">
								<tr>
									<th>
										City
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