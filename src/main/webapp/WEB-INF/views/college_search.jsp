<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="college_search_scripts">
		<script>
			$(document).ready(function() {
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
				
				// set left navbar's height the same as the content
				var panel_height = $('#left.pui-tabview-left > .pui-tabview-panels').height();
				$('#left.pui-tabview-left > .pui-tabview-nav').height(panel_height);
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="home_tabs">
		<li><a href="dashboard">Home</a></li>
		<li><a href="my_college">my_colleges</a></li>
		<li><a href="common_app">common_app</a></li>
		<li class="active"><a href="college_search">college_search</a></li>
	</jsp:attribute>
	<jsp:attribute name="tab_content">
		<div id="left">
			<ul>  
				<li><a href="#tab1">Search Criteria</a></li>  
				<li><a href="#tab2">Search Result</a></li>  
			</ul>
			<div> 
				<div id="tab1">
					<div class="container-fluid">
						<div class="bs-example">
						    <h3>Search for Schools</h3>
						    <hr />
						    <form class="form-horizontal">
						        <div class="form-group">
						            <label class="control-label col-xs-3" for="schoolName">School Name:</label>
						            <div class="col-xs-9">
						                <input type="text" class="form-control" id="schoolName" placeholder="School Name">
						            </div>
						        </div>
						        
						        <div class="form-group">
						            <label class="control-label col-xs-3">US State</label>
						            <div class="col-xs-9">
						                <select class="form-control">
						                    <option>Alabama</option>
						                    <option>Arizona</option>
						                    <option>Arkansas</option>
						                    <option>California</option>
						                    <option>Colorado</option>
						                    <option>Connecticut</option>
						                    <option>North Carolina</option>
						                    <option>South Carolina</option>
						                </select>
						            </div>
						        </div>
						        
						        <div class="form-group">
						            <label class="control-label col-xs-3">Term:</label>
						            <div class="col-xs-3">
						                <label class="checkbox-inline">
						                    <input type="checkbox" value="fall_2015"> Fall 2015
						                </label>
						            </div>
						            <div class="col-xs-3">
						                <label class="checkbox-inline">
						                    <input type="checkbox" value="spring_2015"> Spring 2015
						                </label>
						            </div>
						            <div class="col-xs-3">
						                <label class="checkbox-inline">
						                    <input type="checkbox" value="other"> Other 2015
						                </label>
						            </div>
						        </div>
						        
						        <div class="form-group">
						            <label class="control-label col-xs-3" for="deadline">Deadline on or after:</label>
						            <div class="col-xs-9">
						                <input type="text" class="form-control" id="deadline" placeholder="mm/dd/yyyy">
						            </div>
						        </div>
						        
						        <br>
						        <div class="form-group">
						            <div class="col-xs-offset-3 col-xs-9">
						                <input type="button" id="button" class="btn btn-primary" value="Search">
						                <input type="reset" class="btn btn-default" value="Clear">
						            </div>
						        </div>
						    </form>
						</div>

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