<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="tab_script">
		<script>
			$(document).ready(function() {
				$('#left').puitabview({
					orientation: 'left'
				});
				
				$('#default').puiaccordion();  

		        $('#multiple').puiaccordion({multiple:true});
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="home_tabs">
		<li><a href="dashboard">Dashboard</a></li>
		<li><a href="#">My Colleges</a></li>
		<li class="active"><a href="my_app">My App</a></li>
		<li><a href="college_search">College Search</a></li>
	</jsp:attribute>
	<jsp:attribute name="tab_content">
		<div id="left">
			<ul>  
				<li><a href="#tab1">Profile</a></li>  
				<li><a href="#tab2">Family</a></li>
				<li><a href="#tab3">Education</a></li>
				<li><a href="#tab4">Testing</a></li>
				<li><a href="#tab5">Activities</a></li>
				<li><a href="#tab6">Writing</a></li>
			</ul>
			<div> 
				<div id="tab1">
					<div id="multiple">  
					    <h3>Personal Information</h3>  
				    	<t:profile />  

					    <h3>Address</h3>  
					    <div>  
					        Here is address. 
					    </div>  
					  
					    <h3>Contact Details</h3>  
					    <div>  
					        Here is the student's contact details.
					    </div>      
					</div>
				</div>
				<div id="tab2"></div>
				<div id="tab3"></div>
				<div id="tab4"></div>
				<div id="tab5"></div>
				<div id="tab6"></div>
			</div>
		</div>

	</jsp:attribute>
</t:home_template>