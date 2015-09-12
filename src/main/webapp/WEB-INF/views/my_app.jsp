<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:new_template>
	<jsp:attribute name="a_fragment">
		<div class="row" style="margin-top: 30px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-10 col-lg-10"><h3>My App</h3></div>
            </div>
            <div class="row" style="margin-top:35px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-2 col-lg-2">
                    <ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
                        <li class="active"><a href="#profile" data-toggle="tab"><b style="font-size:18px">Profile</b></a></li>
                        <li><a href="#education" data-toggle="tab"><b style="font-size:18px">Education</b></a></li>
                        <li><a href="#testing" data-toggle="tab"><b style="font-size:18px">Testing</b></a></li>
                        <li><a href="#activities" data-toggle="tab"><b style="font-size:18px">Activities</b></a></li>
                        <li><a href="#writing" data-toggle="tab"><b style="font-size:18px">Writing</b></a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="tab-content" style="margin-left:20px">
                        <div class="tab-pane active" id="profile">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Profile</h3>
                            <div>

                                <form class="form-horizontal">
                                    <h5 style="margin-left: 30px">Personal Information</h5>
                                    <hr/>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="firstName">First Name:</label>
                                        <div class="col-xs-9">
                                            <input type="text" class="form-control" id="firstName" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="lastName">Last Name:</label>
                                        <div class="col-xs-9">
                                            <input type="text" class="form-control" id="lastName" placeholder="Last Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3">Gender:</label>
                                        <div class="col-xs-2">
                                            <label class="radio-inline">
                                                <input type="radio" name="genderRadios" value="male"> Male
                                            </label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label class="radio-inline">
                                                <input type="radio" name="genderRadios" value="female"> Female
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3">Date of Birth:</label>
                                        <div class="col-xs-3">
                                            <select class="form-control">
                                                <option>Date</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <select class="form-control">
                                                <option>Month</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <select class="form-control">
                                                <option>Year</option>
                                            </select>
                                        </div>
                                    </div>
                                    <h5 style="margin-left: 30px">Address</h5>
                                    <hr/>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="postalAddress">Address:</label>
                                        <div class="col-xs-9">
                                            <textarea rows="3" class="form-control" id="postalAddress" placeholder="Postal Address"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="ZipCode">Zip Code:</label>
                                        <div class="col-xs-9">
                                            <input type="text" class="form-control" id="ZipCode" placeholder="Zip Code">
                                        </div>
                                    </div>
                                    <h5 style="margin-left: 30px">Contact Details</h5>
                                    <hr/>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="inputEmail">Email:</label>
                                        <div class="col-xs-9">
                                            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-3" for="phoneNumber">Phone:</label>
                                        <div class="col-xs-9">
                                            <input type="tel" class="form-control" id="phoneNumber" placeholder="Phone Number">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <input type="submit" class="btn btn-primary" value="Submit">
                                            <input type="reset" class="btn btn-default" value="Reset">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane" id="education">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Education</h3>
                        </div>
                        <div class="tab-pane" id="testing">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Testing</h3>
                        </div>
                        <div class="tab-pane" id="activities">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Activities</h3>
                        </div>
                        <div class="tab-pane" id="writing">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Writing</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
	</jsp:attribute>
</t:new_template>