<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@ attribute name="scripts" fragment="true" %>
<%@ attribute name="find_my_college_tabs" fragment="true" %>
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
    <link rel="stylesheet" type="text/css" href="resources/bootstrap-vertical-tabs/bootstrap.vertical-tabs.min.css" />
    <link rel="stylesheet" type="text/css" href="resources/bootstrap-select/dist/css/bootstrap-select.min.css" />
    
    <script src="resources/jquery/jquery-1.11.3.js"></script>
    <script src="resources/jquery-ui-1.11.3/jquery-ui.js"></script>
    <script src="resources/primeui-1.1/development/primeui-1.1.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    
	<link rel="stylesheet" type="text/css" href="resources/DataTables-1.10.7/media/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="resources/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
    
    <jsp:invoke fragment="scripts" />
    <script type="text/javascript">
		$(document).ready(function(){
			$(".dropdown-toggle").dropdown();
			$('.selectpicker').selectpicker();
		});  
	</script>
</head>
<body>
	
<div class="wrapper">
    <div id="header">

        <!-- <b:column span="1"><div class="tile"><h:outputText value="span=1" styleClass="outputtext"/></div></b:column> -->
        <!-- <div class="tile"></div> -->
    </div>

    <div id="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-3 col-lg-3">
                    <div style="margin-top: 30px">
                        <img src="resources/images/logo_my_college.jpeg" height="65px" />
                    </div>
                </div>
                <div class="col-md-5 col-lg-5">
                    <div class="bs-example" style="border-bottom:solid 1px #D8D8D8;margin-top:50px">
                        <div style="margin-bottom: 15px">
								    <span class="dropdown" style="margin-right:20px">
								        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-size: 18px">Dashboard</b><b class="caret"></b></a>
								        <ul class="dropdown-menu">
                                            <li><a href="#">Dashboard</a></li>
                                        </ul>
								    </span>
								    <span class="dropdown" style="margin-right:20px">
								        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-size: 18px">My Colleges</b><b class="caret"></b></a>
								        <ul class="dropdown-menu">
                                            <li><a href="#">College List</a></li>
                                        </ul>
								    </span>
								    <span class="dropdown" style="margin-right:20px">
								        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-size: 18px">My Application</b><b class="caret"></b></a>
								        <ul class="dropdown-menu">
                                            <li><a href="#">My App</a></li>
                                        </ul>
								    </span>
								    <span class="dropdown" style="margin-right:20px">
								        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-size: 18px">College Search</b><b class="caret"></b></a>
								        <ul class="dropdown-menu">
                                            <li><a href="find_my_college">Find My College</a></li>
                                        </ul>
								    </span>
                        </div>
                    </div>

                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
            <jsp:invoke fragment="find_my_college_tabs" />
            <!-- <div class="row" style="margin-top: 30px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-10 col-lg-10"><h3>Find My College</h3></div>
            </div>
            <div class="row" style="margin-top:35px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-2 col-lg-2">
                    <ul class="nav nav-tabs tabs-left">'tabs-right' for right tabs
                        <li class="active"><a href="#test_scores" data-toggle="tab"><b style="font-size:18px">Test Scores</b></a></li>
                        <li><a href="#type_of_school" data-toggle="tab"><b style="font-size:18px">Type of School</b></a></li>
                        <li><a href="#location" data-toggle="tab"><b style="font-size:18px">Location</b></a></li>
                        <li><a href="#campus_n_housing" data-toggle="tab"><b style="font-size:18px">Campus & Housing</b></a></li>
                        <li><a href="#paying" data-toggle="tab"><b style="font-size:18px">Paying</b></a></li>
                        <li><a href="#see_results" data-toggle="tab"><b style="font-size:18px">See Results</b></a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="tab-content" style="margin-left:20px">
                        <div class="tab-pane active" id="test_scores">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Test Scores</h3>
                            <p>Find Colleges where your SAT and/or ACT scores are close matches or above:</p>
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Critical Reading</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Math</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Writing</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>ACT Composite</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                            </table>

                            <button type="button" class="btn btn-primary" style="float:right">Save</button>
                        </div>
                        <div class="tab-pane" id="type_of_school">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Type of School</h3>
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>2-year or 4-year</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">2-year/community<br/>colllege</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">4-year college or<br/>university</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>Public or Private</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Public</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Private</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>School Size</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Small(<2,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Medium<br/>(2,000 - 15,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Large(>15,000)</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>Single-sex or Coed</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Coed</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">All Women</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">All Men</label>
                                    </div></td>
                                </tr>
                            </table>

                            <button type="button" class="btn btn-primary" style="float:right">Save</button>
                        </div>
                        <div class="tab-pane" id="location">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Test Scores</h3>
                            <p>Choose as many as you like:</p>
                            <div>
                            <select class="selectpicker">
                                <option>Alabama</option>
                                <option>Wyoming</option>
                            </select>
                            </div>
                            <button type="button" class="btn btn-primary" style="float:right">Save</button>
                        </div>
                        <div class="tab-pane" id="campus_n_housing">campus and housing</div>
                        <div class="tab-pane" id="see_results">
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px;width: 25%;text-align:center">
                                        <div class="panel panel-default" style="margin:5px">
                                            <div class="panel-body">
                                                <div><a href="#"><h5>Ohio University</h5></a></div>
                                                <hr/>
                                                <h5>Athens, OH</h5>
                                                <hr/>
                                                <button type="button" class="btn btn-primary">Add to List</button>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 10px;width: 25%;text-align:center">
                                        <div class="panel panel-default" style="margin:5px">
                                            <div class="panel-body">
                                                <div><a href="#"><h5>Ohio University</h5></a></div>
                                                <hr/>
                                                <h5>Athens, OH</h5>
                                                <hr/>
                                                <button type="button" class="btn btn-primary">Add to List</button>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 10px;width: 25%;text-align:center">
                                        <div class="panel panel-default" style="margin:5px">
                                            <div class="panel-body">
                                                <div><a href="#"><h5>Ohio University</h5></a></div>
                                                <hr/>
                                                <h5>Athens, OH</h5>
                                                <hr/>
                                                <button type="button" class="btn btn-primary">Add to List</button>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 10px;width: 25%;text-align:center">
                                        <div class="panel panel-default" style="margin:5px">
                                            <div class="panel-body">
                                                <div><a href="#"><h5>Ohio University</h5></a></div>
                                                <hr/>
                                                <h5>Athens, OH</h5>
                                                <hr/>
                                                <button type="button" class="btn btn-primary">Add to List</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div> -->
        </div>
    </div>

    <div class="push"></div>
</div>

<div class="footer">
    <div class="tile"></div>
</div>
</body>
</html>