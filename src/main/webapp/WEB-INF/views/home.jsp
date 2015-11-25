<%-- <%@ page isELIgnored="false" %> --%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<t:new_template>
	<jsp:attribute name="script">
		<script src="resources/myschool-js/prepopulated-values.js"></script>
		<script src="resources/myschool-js/state-eng-2-chn.js"></script>
		<script src="resources/d3.min.js"></script>
		<script src="resources/myschool-js/school-data-vis.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/school-piechart.css" />
		<script type="text/javascript">
	       
    	</script>  
	</jsp:attribute>
	<jsp:attribute name="a_fragment">
		<div class="row" style="margin-top:35px;background-color:#eee">

                    <div class="col-md-2 col-lg-2"></div>
                    
                    <div class="col-md-8 col-lg-8">
                    <div class="row" style="margin:20px;background-color:#ffffff">

                    <div class="col-md-3 col-lg-3" style="margin:30px 20px">
                        <div id="sign_in" style="border: 1px solid #ddd">
                            <div style="margin:20px">
                            <form:form class="form-horizontal" action="authentication" method="post" commandName="loginForm">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-12">
                                            <label class="control-label col-xs-3" for="username" style="width:100%;text-align:left">用户名</label>
                                        </div>
                                    </div>
                                    <div class="row" style="padding: 10px">
                                        <div class="col-md-12 col-lg-12">
                                            <form:input path="username" class="form-control" id="inputUsername" placeholder="Input Email Address Here" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-12">
                                            <label class="control-label col-xs-3" for="inputPassword" style="width:100%;text-align:left">密码</label>
                                        </div>
                                    </div>
                                    <div class="row" style="padding: 10px">
                                        <div class="col-md-12 col-lg-12">
                                            <form:password path="password" class="form-control" id="inputPassword" placeholder="Password" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <input type="submit" class="btn btn-primary" value="登&nbsp;&nbsp;录" />
                                    </div>
                                    <div class="col-xs-8">
                                        <!-- <a href="javascript:;"><h5>注&nbsp;&nbsp;册</h5></a> -->
                                    </div>
                                </div>

                                <br>
                                <!-- <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                    </div>
                                </div> -->
                            </form:form>
                            </div>

							<a href="#signup_modal" class="btn btn-lg btn-primary" data-toggle="modal">注&nbsp;&nbsp;册</a>
								<div id="signup_modal" class="modal fade">
							        <div class="modal-dialog">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                    <h4 class="modal-title">Confirmation</h4>
							                </div>
							                <div class="modal-body">
							                   <form:form action="signUp" method="post" commandName="signUpForm" class="form-horizontal">
											        <div class="form-group">
											            <label for="inputEmail" class="control-label col-xs-2">Email</label>
											            <div class="col-xs-10">
											                <form:input type="email" path="email" class="form-control" id="inputEmail" placeholder="Email" />
											            </div>
											        </div>
											        <div class="form-group">
											            <label for="inputPassword" class="control-label col-xs-2">Password</label>
											            <div class="col-xs-10">
											                <form:password path="password" class="form-control" id="inputPassword" placeholder="Password" />
											            </div>
											        </div>
											        <div class="form-group">
											            <label for="inputFirstName" class="control-label col-xs-2">First Name</label>
											            <div class="col-xs-10">
											                <form:input path="firstName" class="form-control" id="inputFirstName" placeholder="First Name" />
											            </div>
											        </div>
											        <div class="form-group">
											            <label for="inputLastName" class="control-label col-xs-2">Last Name</label>
											            <div class="col-xs-10">
											                <form:input path="lastName" class="form-control" id="inputLastName" placeholder="Last Name" />
											            </div>
											        </div>
											        <div class="form-group">
											            <div class="col-xs-offset-2 col-xs-10">
											                <button type="submit" class="btn btn-primary">Sign Up</button>
											            </div>
											        </div>
											    </form:form>
							                </div>
							                <div class="modal-footer">
							                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							                </div>
							            </div>
							        </div>
							    </div> <!-- signup_modal -->
							    
                            <div style="background-color:#eee;margin:0px;padding:10px 20px">
                                <a href="javascript:;"><h5>忘了用户名和密码了？</h5></a>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-7 col-lg-7" style="margin:30px 20px">
                        <div style="border:solid 1px #ddd">
                            <img src="resources/images/Knowing_Guessing_Large.png" style="max-width:100%;height:auto"/>
                        </div>
                    </div>

                    </div>
                    </div>

                    <div class="col-md-2 col-lg-2"></div>


                </div>
	</jsp:attribute>
</t:new_template>