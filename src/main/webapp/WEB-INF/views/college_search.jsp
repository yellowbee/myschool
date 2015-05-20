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
					         name: 'OHIO UNIVERSITY'
					      }),
					      dataType: 'json',
					      success: function(result) {
					    	
					    	// create table body html
					    	var table_body = '<tbody>';
							$.each(result, function(index, value) {
								table_body = table_body + '<tr><td>' + value.name + '</td>'
																+ '<td>' + value.city + '</td>'
																+ '<td>' + value.state + '<a href="#myModal" data-toggle="modal" style="margin-left: 30px">Add</a>' + '</td></tr>';
							});
							table_body = table_body + '</tbody>';

							// create full table html
							var table = '<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\" id=\"table_result\"><thead><tr><th>School Name</th><th>City</th><th>State</th></tr></thead>';
							table = table + table_body + '</table>';

							$('#tab2').html(table);
							$('#table_result').dataTable({
						        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
						        searching: false
						    });
							
							// set left navbar's height the same as the content
							   /* var panel_height = $('#table_result_wrapper').height(); */
							   var panel_height = $('#left.pui-tabview-left > .pui-tabview-panels').height();
							   $('#left.pui-tabview-left > .pui-tabview-nav').height(panel_height);
					      	}
					   });
					   $('#left').puitabview('select', 1);
				});
				
				// set left navbar's height the same as the content
				var panel_height = $('#left.pui-tabview-left > .pui-tabview-panels').height();
				$('#left.pui-tabview-left > .pui-tabview-nav').height(panel_height);
				
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="home_tabs">
		<li><a href="dashboard">Dashboard</a></li>
		<li><a href="#">My Colleges</a></li>
		<li><a href="my_app">My App</a></li>
		<li class="active"><a href="college_search">College Search</a></li>
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
					<%-- <table cellpadding="0" cellspacing="0" border="0" class="display" id="table_result">
						<thead>
							<tr>
								<th>School Name</th>
								<th>City</th>
								<th>State</th>
							</tr>
						</thead>

					</table> --%>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal HTML -->
	    <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Confirmation</h4>
	                </div>
	                <div class="modal-body">
	                    <p>School successfully added to Dashboard!</p>
	                    <p>Go to <a href="dashboard">Dashboard</a> to review the newly added school.</p>
	                    <!-- <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p> -->
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</jsp:attribute>
</t:home_template>