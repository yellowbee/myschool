<%-- <%@ page isELIgnored="false" %> --%>

<%-- <%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> --%>

<%-- <%@ attribute name="home_tabs" fragment="true" %>
<%@ attribute name="tab_content" fragment="true" %>
<%@ attribute name="tab_script" fragment="true" %> --%>

	<%-- <jsp:attribute name="scripts">
		<jsp:invoke fragment="tab_script" />
	</jsp:attribute> --%>

<div class="bs-example">
    <form class="form-horizontal">
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
                <input type="button" class="btn btn-primary button_continue" value="Save">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
        </div>
    </form>
</div>