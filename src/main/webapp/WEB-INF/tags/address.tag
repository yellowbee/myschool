<%-- <%@ page isELIgnored="false" %> --%>

<%-- <%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> --%>

<%-- <%@ attribute name="home_tabs" fragment="true" %>
<%@ attribute name="tab_content" fragment="true" %>
<%@ attribute name="tab_script" fragment="true" %> --%>

	<%-- <jsp:attribute name="scripts">
		<jsp:invoke fragment="tab_script" />
	</jsp:attribute> --%>

<div id="div_addr">
	<div id="asking_for_addr">
		<h3>Permanent Home Address</h3>
		<button id="btn_add_addr" type="button" class="btn btn-default btn-lg btn-block">Add Address</button>
		<div class="form-group">
			<div class="col-xs-offset-3 col-xs-9">
				<input type="button" class="btn btn-primary button_continue" value="Save">
				<input type="reset" class="btn btn-default" value="Reset">
			</div>
		</div>
	</div>
	<div id="addr_added" style="display:none">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Permanent Address</h3>
			</div>
			<div class="panel-body">
				<p id="postal_addr"></p>
				<p id="zip_code"></p>
			</div>
		</div>
		<a id="rm_addr" href="#">Remove</a>
	</div>

	<div class="bs-example">
	    <!-- Modal HTML -->
	    <div id="modal_address" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">	        
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                    <h4 class="modal-title">Add Address</h4>
	                </div>
	                <div class="modal-body">
	                    <form id="form_addr" role="form">
	                        <div class="form-group">
	                            <label for="recipient-name" class="control-label">Postal Address</label>
	                            <textarea rows="3" class="form-control" id="postalAddress" placeholder="Postal Address"></textarea>
	                        </div>
	                        <div class="form-group">
	                            <label for="message-text" class="control-label">Zip Code:</label>
	                            <input type="text" class="form-control" id="zipCode" placeholder="Zip Code">
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	                    <button id="btn_modal_add_addr" type="button" class="btn btn-primary" data-dismiss="modal">Add</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>