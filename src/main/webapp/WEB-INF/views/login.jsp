<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:basic_template>
	<jsp:attribute name="scripts">
		<script>
				$(function() {  
				    /* $('#dlg').puidialog({  
				        showEffect: 'fade',  
				        hideEffect: 'fade',  
				        minimizable: true,  
				        maximizable: true,  
				        modal: true,  
				        buttons: [{  
				                text: 'Yes',  
				                icon: 'ui-icon-check',  
				                click: function() {  
				                    $('#dlg').puidialog('hide');  
				                }  
				            },  
				            {  
				                text: 'No',  
				                icon: 'ui-icon-close',  
				                click: function() {  
				                    $('#dlg').puidialog('hide');  
				                }  
				            }  
				        ]  
				    });  
				  
				    $('#btn-show').puibutton({  
				        icon: 'ui-icon-arrow-4-diag',  
				        click: function() {  
				            $('#dlg').puidialog('show');  
				        }  
				    });   */
				});  
		</script>
	</jsp:attribute>
	<jsp:body>
		<div class="container-fluid">
				<div class="row">
				    <div class="col-sm-12 col-md-12 col-lg-12">
					    <div id="login">
							<div id="sign_up_button" style="margin:10px">
								<p>Don't have an account yet?</p>
								<!-- <button id="btn-show" type="button">Show</button> 
								<div id="dlg" title="Sign Up">  
								    <form action="#">
									  First name: <input type="text" name="fname"><br>
									  Last name: <input type="text" name="lname"><br>
									  <input type="submit" value="Submit">
									</form>  
								</div> -->
								
								<a href="#signup_modal" class="btn btn-lg btn-primary" data-toggle="modal">Sign Up</a>
								<div id="signup_modal" class="modal fade">
							        <div class="modal-dialog">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                    <h4 class="modal-title">Confirmation</h4>
							                </div>
							                <div class="modal-body">
							                   <form class="form-horizontal">
											        <div class="form-group">
											            <label for="inputEmail" class="control-label col-xs-2">Email</label>
											            <div class="col-xs-10">
											                <input type="email" class="form-control" id="inputEmail" placeholder="Email">
											            </div>
											        </div>
											        <div class="form-group">
											            <label for="inputPassword" class="control-label col-xs-2">Password</label>
											            <div class="col-xs-10">
											                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
											            </div>
											        </div>
											        <div class="form-group">
											            <div class="col-xs-offset-2 col-xs-10">
											                <button type="submit" class="btn btn-primary">Sign Up</button>
											            </div>
											        </div>
											    </form>
							                </div>
							                <div class="modal-footer">
							                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							
							<div id="sign_in">
								
								<form class="form-horizontal" action="authentication" method="post">
									<div class="form-group">
							            <label class="control-label col-xs-3" for="firstName">Username:</label>
							            <div class="col-xs-9">
							                <input type="text" class="form-control" id="userName" placeholder="Username">
							            </div>
							        </div>
							        <div class="form-group">
							            <label class="control-label col-xs-3" for="inputPassword">Password:</label>
							            <div class="col-xs-6">
							                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
							            </div>
							            <div class="col-xs-3">
							                <input type="submit" class="btn btn-primary" value="Submit">
							            </div>
							        </div>
							        
							        <br>
							        <!-- <div class="form-group">
							            <div class="col-xs-offset-3 col-xs-9">
							                <input type="submit" class="btn btn-primary" value="Submit">
							            </div>
							        </div> -->
							    </form>

							</div>
						</div>
				    </div>
				</div>
			</div>
	</jsp:body>
</t:basic_template>