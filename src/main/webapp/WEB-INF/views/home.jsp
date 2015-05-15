<%@ page isELIgnored="false" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%> --%>
<!DOCTYPE html>
<html>
<head>
	<%-- <base href="${basePath}" /> --%>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="resources/jquery-ui-1.11.3/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="resources/jquery-ui-1.11.3/jquery-ui.theme.css" />
	<link rel="stylesheet" type="text/css" href="resources/primeui-1.1/development/primeui-1.1.css" />
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap-theme.min.css" />
    
    <script src="resources/jquery/jquery-1.11.3.js"></script>
    <script src="resources/jquery-ui-1.11.3/jquery-ui.js"></script>
    <script src="resources/primeui-1.1/development/primeui-1.1.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
	
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
</head>
<body>
	
	<div class="wrapper">
			<div id="header">
				<!-- <b:column span="1"><div class="tile"><h:outputText value="span=1" styleClass="outputtext"/></div></b:column> -->
				<div class="tile"></div>
			</div>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 col-lg-2"></div>
				    <div class="col-md-8 col-lg-8">
					    <div id="default">  
						    <ul style="width:100%">  
						        <li><a href="#tab1">Dashboard</a></li>  
						        <li><a href="#tab2">My Colleges</a></li>  
						        <li><a href="#tab3">My Application</a></li>
						        <li><a href="#tab4">College Search</a></li>
						    </ul>  
						    <div id="main_tabs">  
						        <div id="tab1">  
						            The story begins as Don Vito Corleone, the head of a New York Mafia family, oversees his daughter's wedding. His beloved son Michael has just come home from the war, but does not intend to become part of his father's business. T hrough Michael's life the nature of the family business becomes clear. The business of the family is just like the head of the family, kind and benevolent to those who give respect, but given to ruthless violence whenever anything stands against the good of the family.  
						        </div>  
						        <div id="tab2">  
						            Francis Ford Coppola's legendary continuation and sequel to his landmark 1972 film, The_Godfather, parallels the young Vito Corleone's rise with his son Michael's spiritual fall, deepening The_Godfather's depiction of the dark side of the American dream. In the early 1900s, the child Vito flees his Sicilian village for America after the local Mafia kills his family. Vito struggles to make a living, legally or illegally, for his wife and growing brood in Little Italy, killing the local Black Hand Fanucci after he demands his customary cut of the tyro's business. With Fanucci gone, Vito's communal stature grows.  
						        </div>  
						        <div id="tab3">
						        	This is tab 3.
						        </div>
						        <div id="tab4">  
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
						        </div>  
						    </div>  
						</div>
				    </div>
				    <div class="col-md-2 col-lg-2"></div>
				</div>
			</div>
			
			<div class="push"></div>
		</div>	
			
		<div class="footer">
			<div class="tile"></div>
		</div>
</body>
</html>
