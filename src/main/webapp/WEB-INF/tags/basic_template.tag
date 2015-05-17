<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@ attribute name="scripts" fragment="true" %>
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
    
	<link rel="stylesheet" type="text/css" href="resources/DataTables-1.10.7/media/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="resources/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
    
    
    <jsp:invoke fragment="scripts" />
</head>
<body>
	
	<div class="wrapper">
			<div id="header">
				<!-- <b:column span="1"><div class="tile"><h:outputText value="span=1" styleClass="outputtext"/></div></b:column> -->
				<div class="tile"></div>
			</div>
			
			<div id="content">
				<jsp:doBody />
			</div>
			
			<div class="push"></div>
		</div>	
			
		<div class="footer">
			<div class="tile"></div>
		</div>
</body>
</html>
