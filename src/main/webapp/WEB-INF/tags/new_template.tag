<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@ attribute name="script" fragment="true" %>
<%@ attribute name="a_fragment" fragment="true" %>
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
    
    <%-- <jsp:invoke fragment="scripts" /> --%>
    <script type="text/javascript">
		$(document).ready(function(){
			$(".dropdown-toggle").dropdown();
			$('.selectpicker').selectpicker();
		});  
	</script>
	
	<jsp:invoke fragment="script" />
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
                                    <li><a href="college_list">College List</a></li>
                                </ul>
						    </span>
						    <span class="dropdown" style="margin-right:20px">
						        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-size: 18px">My Application</b><b class="caret"></b></a>
						        <ul class="dropdown-menu">
                                    <li><a href="my_app">My App</a></li>
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
					<div style="float:right; margin-top:10px">
						<span style="margin-right: 20px">Hi&nbsp;<c:out value="${user.firstName}" /></span>
						<span><a href="logout">&nbsp;Log out&nbsp;</a></span>
					</div>

                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
            <jsp:invoke fragment="a_fragment" />
        </div>
    </div>

    <div class="push"></div>
</div>

<div class="footer">
    <div class="tile"></div>
</div>
</body>
</html>
