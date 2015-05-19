<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="tab_script">
		<script type="text/javascript">  
	    $(function() {  
	        $('#default').puiaccordion();  
	  
	        $('#multiple').puiaccordion({multiple:true});  
	    });  
		</script>  
	</jsp:attribute>
	
	<jsp:attribute name="home_tabs">
		<li class="active"><a href="dashboard">Dashboard</a></li>
		<li><a href="#">My Colleges</a></li>
		<li><a href="#">Common App</a></li>
		<li><a href="college_search">College Search</a></li>
	</jsp:attribute>
	
	<jsp:attribute name="tab_content">
		<div id="multiple">  
	    <h3>Ohio University</h3>  
	    <div>
	    	Here is the student's application status for Ohio University.
	    	Such as whether the application documents are complete, the application is under review <br>
	    	or any information related to the application. 
	    </div>  
	  
	    <h3>Akron School</h3>  
	    <div>  
	        Here is the student's application status for Akron School. 
	    </div>  
	  
	    <h3>Bowling Green University</h3>  
	    <div>  
	        Here is the student's application status for Bowling Green University.
	    </div>      
		</div>  
	</jsp:attribute>
</t:home_template>