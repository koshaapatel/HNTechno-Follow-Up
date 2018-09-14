<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:if test="${m eq 1}">
<option value="0">Select Sub Language</option>
	<c:forEach items="${list}" var="v" >
		<c:forEach items="${v.s}" var="vv" >
			<option value="${vv.sdid}">${vv.sublang}</option>
		</c:forEach>
	</c:forEach>
</c:if>
<c:if test="${m eq 2}">
<option value="0">Select State</option>
	<c:forEach items="${list}" var="v" >
		<c:forEach items="${v.sd}" var="vv" >
			<option value="${vv.statedid}">${vv.statename}</option>
		</c:forEach>
	</c:forEach>
</c:if>
<c:if test="${m eq 3}">
<option value="0">Select City</option>
	<c:forEach items="${list}" var="v" >
		<c:forEach items="${v.cd}" var="vv" >
			<option value="${vv.citydid}">${vv.cityname}</option>
		</c:forEach>
	</c:forEach>
</c:if>
<c:if test="${m eq 4}">
<option value="0">Select College</option>
	<c:forEach items="${list}" var="v" >
		<c:forEach items="${v.clgd}" var="vv" >
			<option value="${vv.clgdid}">${vv.clgname}</option>
		</c:forEach>
	</c:forEach>
</c:if>
<c:if test="${m eq 5}">
<c:forEach items="${list}" var="v" >
	<c:forEach items="${v.ld}" var="vv" >
			<span>${vv.file}</span><a  href='<c:url value="download1.net?p=${vv.file}"/>'>Download</a>
	                     
		</c:forEach>
	</c:forEach>
</c:if>