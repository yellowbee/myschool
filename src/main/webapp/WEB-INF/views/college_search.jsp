<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="college_search_scripts">
		<script>
			$(document).ready(function() {
				$('#default').puitabview();
				
				$('#left').puitabview({
					orientation: 'left'
				});
				
				$('#form:search_button').click(function showSearchResult() {
					$('#left').puitabview('select', 1);
				});
				
				// Attach a submit handler to the form
				$('#button').click(function() {	
					   $.ajax({
						  type: "POST",
						  contentType: "application/json",
					      url: 'search_colleges',
					      data: JSON.stringify({
					         name: 'Ohio University'
					      }),
					      dataType: 'json',
					      success: function(result) {
							$.each(result, function(index, value) {
								$('#result').append(value.name + '<br/>');
							})
					    	 $('#left').puitabview('select', 1);
					      }	
					   });
				});
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="college_search_tab">
		<li><a href="dashboard">Home</a></li>
		<li><a href="my_college">my_colleges</a></li>
		<li><a href="common_app">common_app</a></li>
		<li class="active"><a href="college_search">college_search</a></li>
	</jsp:attribute>
	<jsp:attribute name="tab_content">
		<div id="left" style="width:100%;">  
									    <ul>  
									        <li><a href="#tab1">Search Criteria</a></li>  
									        <li><a href="#tab2">Search Result</a></li>  
									    </ul>  
									    <div> 
										        <div id="tab1">
										        	<div class="container-fluid">
										        		<div class="row">
										        			<div class="col-md-2">
											        			<input type="text"></input>
											        		</div>
											        		<div class="col-md-10">
											        		</div>
											        	</div>
											            <button id="button" type="button">Search</button>
										            </div>
										        </div>
										        <div id="tab2">
										            <!-- the result of the search will be rendered inside this div -->
													<div id="result"></div>
										        </div>
									    </div>  
									</div> 
	</jsp:attribute>
</t:home_template>