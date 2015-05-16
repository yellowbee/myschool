<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:basic_template>
	<jsp:attribute name="scripts">
		<script>
				$(function() {  
				    $('#dlg').puidialog({  
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
				    });  
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
								<button id="btn-show" type="button">Show</button> 
								<div id="dlg" title="Sign Up">  
								    <form action="#">
									  First name: <input type="text" name="fname"><br>
									  Last name: <input type="text" name="lname"><br>
									  <input type="submit" value="Submit">
									</form>  
								</div> 
							</div>
							
							<div id="sign_in">
								<form action="authentication" method="post">
									  User name: <input type="text" name="fname"><br>
									  Password: <input type="text" name="lname"><br>
									  <input type="submit" value="Submit">
								</form> 
							</div>
						</div>
				    </div>
				</div>
			</div>
	</jsp:body>
</t:basic_template>