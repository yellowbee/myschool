<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="/WEB-INF/tld/myschool.tld" prefix="ms" %>

<t:new_template>
	<jsp:attribute name="script">
		<script type="text/javascript">
	        $(document).ready(function(){
	            
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
                                        <label class="control-label">请输入注册账户时所使用的电子邮箱地址</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="inputEmail">电子信箱:</label>
                                    <div class="col-xs-9">
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                        <input type="reset" class="btn btn-default" value="Reset">
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="col-md-2 col-lg-2"></div>
                </div>
		
	</jsp:attribute>
</t:new_template>