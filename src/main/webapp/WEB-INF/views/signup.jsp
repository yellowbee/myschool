<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="/WEB-INF/tld/myschool.tld" prefix="ms" %>

<t:new_template>
	<jsp:attribute name="script">
		<script type="text/javascript">
	        $(document).ready(function(){
	        	// process the form
	            $('form').submit(function(event) {

	                // get the form data
	                // there are many ways to get this data using jQuery (you can use the class or id also)
	                /* var formData = {
	                    userName: $('input[id=userName]').val(),
	                    email: $('input[id=email]').val(),
	                    password: $('input[id=password]').val(),
	                    confirmPassword: $('input[id=confirmPassword]').val()
	                }; */

	                // process the form
	                $.ajax({
						  type: "POST",
						  contentType: "application/json;charset=utf-8",
					      url: 'signUpProcess',
					      data: JSON.stringify({
			                    nickName: $('input[id=nickName]').val(),
			                    email: $('input[id=email]').val(),
			                    password: $('input[id=password]').val(),
			                    confirmPassword: $('input[id=confirmPassword]').val()
			                }),
					      dataType: 'json',
					      success: function(result) {
					    	  alert("coming back successfully");
					      },
					      error: function (xhr, textStatus, errorThrown) { alert(errorThrown); }
					});
	                
	                event.preventDefault();
	            });
	        });
    	</script>  
	</jsp:attribute>
	<jsp:attribute name="a_fragment">
			<div>
                <div class="row" style="margin-top:35px">
                    <div class="col-md-2 col-lg-2"></div>
                    <div class="col-md-8 col-lg-8">
                        <div class="bs-example">
                            <div style="display:table;margin:30px auto"><h1>用户注册</h1></div>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="nickName">用户名:</label>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" id="nickName" placeholder="用户名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="email">电子信箱:</label>
                                    <div class="col-xs-9">
                                        <input type="email" class="form-control" id="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="password">密码:</label>
                                    <div class="col-xs-9">
                                        <input type="password" class="form-control" id="password" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3 required" for="confirmPassword">确认密码:</label>
                                    <div class="col-xs-9">
                                        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3" for="name">姓名:</label>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3" for="phoneNumber">电话:</label>
                                    <div class="col-xs-9">
                                        <input type="tel" class="form-control" id="phoneNumber" placeholder="Phone Number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3">出生日期:</label>
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
                                <div class="form-group">
                                    <label class="control-label col-xs-3">性别:</label>
                                    <div class="col-xs-2">
                                        <label class="radio-inline">
                                            <input type="radio" name="genderRadios" value="male"> 男
                                        </label>
                                    </div>
                                    <div class="col-xs-2">
                                        <label class="radio-inline">
                                            <input type="radio" name="genderRadios" value="female"> 女
                                        </label>
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
            </div>
		
	</jsp:attribute>
</t:new_template>