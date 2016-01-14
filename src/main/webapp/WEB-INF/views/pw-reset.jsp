<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="/WEB-INF/tld/myschool.tld" prefix="ms" %>

<t:new_template>
	<jsp:attribute name="script">
		<script type="text/javascript">
	        $(document).ready(function(){
	        	$('form').submit(function(event) {
	                // process the form
	                $.ajax({
						  type: "POST",
						  contentType: "application/json",
					      url: 'submitPwResetInfo',
					      data: JSON.stringify({
					    	  newPassword: $('input[id=newPassword]').val(),
					    	  email: $('input[id=email]').val()
			              }),
					      dataType: 'json',
					      success: function(result) {
					    	  if (result.status == "SUCCESS") {
					    		  $('#pwreset-result-text').html('Password has been updated! Please log in.');
					    	  }
					    	  else {
					    		  $('#pwreset-result-text').html(result.desc);
					    	  }
					      },
					      error: function (xhr, textStatus, errorThrown) { alert(errorThrown); }
					});
	                
	                event.preventDefault();
	            });
	        });
    	</script>  
	</jsp:attribute>
	<jsp:attribute name="a_fragment">
				<div class="row" style="margin-top:35px">
                    <div class="col-md-2 col-lg-2"></div>
                    <div class="col-md-8 col-lg-8">
                        <div class="bs-example">
                            <div style="display:table;margin:30px auto"><h1>密码恢复</h1></div>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <div class="control-label col-xs-3"></div>
                                    <div class="col-xs-9">
                                        <label class="control-label">请输入以下恢复信息</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="newPassword">新密码:</label>
                                    <div class="col-xs-9">
                                        <input type="password" class="form-control" id="newPassword" placeholder="password">
                                    </div>
                                </div>
								<div class="form-group">
                                    <label class="control-label col-xs-3 required" for="confirmNewPassword">确认新密码:</label>
                                    <div class="col-xs-9">
                                        <input type="password" class="form-control" id="confirmNewPassword" placeholder="confirm password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                        <input type="reset" class="btn btn-default" value="Reset">
                                        <input type="hidden" id="email" value="${email}">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <span id="pwreset-result-text"></span>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="col-md-2 col-lg-2"></div>
                </div>
		
	</jsp:attribute>
</t:new_template>