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
		<li class="active"><a href="dashboard">Home</a></li>
		<li><a href="my_college">My Colleges</a></li>
		<li><a href="common_app">Common App</a></li>
		<li><a href="college_search">College Search</a></li>
	</jsp:attribute>
	
	<jsp:attribute name="tab_content">
		<div id="multiple">  
	    <h3>Ohio University</h3>  
	    <div>  
	        The story begins as Don Vito Corleone, the head of a New York Mafia family, oversees his daughter's wedding. His beloved son Michael has just come home from the war, but does not intend to become part of his father's business. Through Michael's life the nature of the family business becomes clear. The business of the family is just like the head of the family, kind and benevolent to those who give respect, but given to ruthless violence whenever anything stands against the good of the family.  
	    </div>  
	  
	    <h3>Akron School</h3>  
	    <div>  
	        Francis Ford Coppola's legendary continuation and sequel to his landmark 1972 film, The_Godfather, parallels the young Vito Corleone's rise with his son Michael's spiritual fall, deepening The_Godfather's depiction of the dark side of the American dream. In the early 1900s, the child Vito flees his Sicilian village for America after the local Mafia kills his family. Vito struggles to make a living, legally or illegally, for his wife and growing brood in Little Italy, killing the local Black Hand Fanucci after he demands his customary cut of the tyro's business. With Fanucci gone, Vito's communal stature grows.  
	    </div>  
	  
	    <h3>Bowling Green University</h3>  
	    <div>  
	        After a break of more than 15 years, director Francis Ford Coppola and writer Mario Puzo returned to the well for this third and final story of the fictional Corleone crime family. Two decades have passed, and crime kingpin Michael Corleone, now divorced from his wife Kay has nearly succeeded in keeping his promise that his family would one day be completely legitimate.  
	    </div>      
		</div>  
	</jsp:attribute>
</t:home_template>