<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="home_tabs">
		<li class="active"><a href="dashboard">Home</a></li>
		<li><a href="my_college">my_colleges</a></li>
		<li><a href="common_app">common_app</a></li>
		<li><a href="college_search">college_search</a></li>
	</jsp:attribute>
</t:home_template>