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
					      url: 'submitPwResetReq',
					      data: JSON.stringify({
			                    email: $('input[id=email]').val()
			              }),
					      dataType: 'json',
					      success: function(result) {
					    	  if (result.status == "SUCCESS") {
					    		  $('#pwreset-result-text').html('请点击<a href=\"passwordResetPg?uuid=' + result.uuid + '\">密码恢复链接</a>，跟随提示重置密码');
					    	  }
					    	  else {
					    		  $('#pwreset-result-text').html('We did not find the email address submitted.');
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
                            <div style="display:table;margin:30px auto"><h1>忘了密码?</h1></div>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <div class="control-label col-xs-3"></div>
                                    <div class="col-xs-9">
                                        <label class="control-label">请输入注册账户时所使用的电子邮箱地址</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="inputEmail">电子信箱:</label>
                                    <div class="col-xs-9">
                                        <input type="email" class="form-control" id="email" placeholder="Email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                        <input type="reset" class="btn btn-default" value="Reset">
                                        <a href="home">取消</a>
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