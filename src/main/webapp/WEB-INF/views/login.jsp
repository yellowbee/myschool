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
</head>
<body>
	
	<div class="wrapper">
			<div id="header">
				<!-- <b:column span="1"><div class="tile"><h:outputText value="span=1" styleClass="outputtext"/></div></b:column> -->
				<div class="tile"></div>
			</div>
			
			<div class="container">
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
								<form action="home" method="post">
									  User name: <input type="text" name="fname"><br>
									  Password: <input type="text" name="lname"><br>
									  <input type="submit" value="Submit">
								</form> 
							</div>
						</div>
				    </div>
				</div>
			</div>
			
			<div class="push"></div>
		</div>	
			
		<div class="footer">
			<div class="tile"></div>
		</div>
</body>
</html>
