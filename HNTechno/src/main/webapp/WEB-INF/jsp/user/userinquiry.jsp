<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  

<div class="page-title">
	<div class="grid-row">
		<h1>INQUIRY</h1>
		<nav class="bread-crumb">
			<a href="index.html">Home</a>
		</nav>
	</div>
</div>
	
<style>
.row {
    display: block;
    float: left;
    padding: 10px 20px 15px;
    width: 100%;
}
.column_label{width:20%;float:left;display:block;}
.column_input{width:80%;float:left;display:block;}
.column_input input[type="radio"] {
    float: left;
    margin-top: 5px;
    visibility: visible;
}
.column_input_radio{float:left;width:25%;}
input[type="text"], input[type="password"], select{width:80% !important;}
.column_label h5 {
    margin: 0;
    padding: 10px;
}
h2.page_title_enq {
    text-align: center;
}
.saprater{ width:20%;border-bottom: 1px solid gray;height:1px;margin:0 auto;margin-bottom:12px;}
.inquiry_button {
    background: #000 none repeat scroll 0 0;
    border: 1px solid gray;
    border-radius: 13px;
    color: #fff;
    font-size: 19px;
    font-weight: bold;
    padding: 8px;
    width: 10%;
}   
.left_inq{float:left;width:50%;border-right: 1px solid gray;}
.center_inq{float: left;  min-height: 320px;}
.right_inq{float:right;width:49%;}
.form_container{width: 100%; padding: 20px;}
</style>
<div>
	<h2 class="page_title_enq">Inquiry</h2>
	<div class="saprater"></div>
	<div class="email_server_responce">
		<div class="form_container">
			<form:form modelAttribute="m1" cssClass="contact-form" ata-parsley-validate="true" novalidate="">
				<div class="left_inq">
					<div class="row">
						<form:label cssClass="column_label" path="fname">First Name* :</form:label>
							<div class="column_input">
								<form:input cssClass="form-control" path="fname" id="fname" placeholder="Enter First Name" data-parsley-required="true"
									autocomplete="on" />
							</div>	
					</div>
					<div class="row">
						<form:label cssClass="column_label" path="fname">Middle Name* :</form:label>
							<div class="column_input">
								<form:input cssClass="form-control" path="mname" id="mname" placeholder="Enter Middle Name" data-parsley-required="true"
									autocomplete="on" />
							</div>	
					</div>
					<div class="row">
						<form:label cssClass="column_label" path="lname">Last Name* :</form:label>
							<div class="column_input">
								<form:input cssClass="form-control" path="lname" id="lname" placeholder="Enter Last Name" data-parsley-required="true"
									autocomplete="on" />
							</div>	
					</div>
				</div>
				<div class="right_inq">
    				<div class="row">
						<form:label  cssClass="column_label" path="email">Email Id * :</form:label>
							<div class="column_input">
								<form:input path="email" id="email" name="email_id" placeholder="Enter Email Id" data-parsley-required="true"
								     autocomplete="on" />
							</div>
					</div>
					 <div class="row">
						<form:label  cssClass="column_label" path="mob">Phone No * :</form:label>
							<div class="column_input">
								<form:input path="mob" id="mob" name="mob" placeholder="Enter Mobile No" data-parsley-required="true" autocomplete="on" />
							</div>
					</div>
					<div class="row">
						<form:label  cssClass="column_label" path="gender">Gender * :</form:label>
							<div class="column_input">
								<form:radiobutton path="gender" id="gender" name="gender" data-parsley-required="true" value="male"/><span style="margin:0 10px;">Male</span>
							</div>
							<div class="column_input" style="margin-left:132px">
								<form:radiobutton path="gender" id="gender" name="gender" data-parsley-required="true" value="female"/><span style="margin:0 10px;">Female</span>
							</div>
					</div>
				</div>				     		 
		    	 <div class="row">
		    	 <input type="submit" name="action" value="Add" class="inquiry_button"></div>
			</form:form>
		</div>
		</div>
		<div style="clear:both;"></div>
	</div>	
	<!-- / page content -->
	