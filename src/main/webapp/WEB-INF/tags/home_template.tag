<%-- <%@ page isELIgnored="false" %> --%>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ attribute name="dashboard_tab" fragment="true" %>
<%@ attribute name="my_colleges_tab" fragment="true" %>
<%@ attribute name="common_app_tab" fragment="true" %>
<%@ attribute name="college_search_tab" fragment="true" %>
<%@ attribute name="tab_content" fragment="true" %>
<%@ attribute name="college_search_scripts" fragment="true" %>

<t:basic_template>
	<jsp:attribute name="scripts">
		<jsp:invoke fragment="college_search_scripts" />
	</jsp:attribute>
	<jsp:body>
		<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 col-lg-2"></div>
				    <div class="col-md-8 col-lg-8">
					    <div class="bs-example">
							<ul class="nav nav-tabs">
								<jsp:invoke fragment="dashboard_tab" />
						        <jsp:invoke fragment="my_colleges_tab" />
						        <jsp:invoke fragment="common_app_tab" />
						        <jsp:invoke fragment="college_search_tab" />
							</ul>
							<jsp:invoke fragment="tab_content" />
						</div>
				    </div>
				    <div class="col-md-2 col-lg-2"></div>
				</div>
			</div>
	</jsp:body>
</t:basic_template>