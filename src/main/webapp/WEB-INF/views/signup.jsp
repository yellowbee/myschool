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
			                    lastName: $('input[id=lastName]').val(),
			                    firstName: $('input[id=firstName]').val(),
			                    phone: $('input[id=phone]').val(),
			                    sex: $('input[id=genderRadios]').val()
			                }),
					      dataType: 'json',
					      success: function(result) {
					    	  if (result.status == "SUCCESS") {
					    		  $('#signup-result-text').html('注册成功！ 赶紧<a href=\"home\">登录</a>吧.');
					    	  }
					    	  else if (result.status = "FAILURE") {
					    		  $('#signup-result-text').html(result.desc);
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
                                    <label class="control-label col-xs-3" for="name">姓:</label>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control" id="lastName" placeholder="姓">
                                    </div>
                                    <label class="control-label col-xs-1" for="name">名:</label>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control" id="firstName" placeholder="名">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="hidden" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3" for="phone">电话:</label>
                                    <div class="col-xs-9">
                                        <input type="tel" class="form-control" id="phone" placeholder="电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3">出生日期:</label>
                                    <div class="col-xs-3">
                                        <select class="form-control">
                                            <option>日</option>
                                            <option>01</option>
                                            <option>02</option>
                                            <option>03</option>
                                            <option>04</option>
                                            <option>05</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>08</option>
                                            <option>09</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                            <option>13</option>
                                            <option>14</option>
                                            <option>15</option>
                                            <option>16</option>
                                            <option>17</option>
                                            <option>18</option>
                                            <option>19</option>
                                            <option>20</option>
                                            <option>21</option>
                                            <option>22</option>
                                            <option>23</option>
                                            <option>24</option>
                                            <option>25</option>
                                            <option>26</option>
                                            <option>27</option>
                                            <option>28</option>
                                            <option>29</option>
                                            <option>30</option>
                                            <option>31</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-3">
                                        <select class="form-control">
                                            <option>月</option>
                                            <option>01</option>
                                            <option>02</option>
                                            <option>03</option>
                                            <option>04</option>
                                            <option>05</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>08</option>
                                            <option>09</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-3">
                                        <select class="form-control">
                                            <option>年</option>
                                            <option>2015</option>
                                            <option>2014</option>
                                            <option>2013</option>
                                            <option>2012</option>
                                            <option>2011</option>
                                            <option>2010</option>
                                            <option>2009</option>
                                            <option>2008</option>
                                            <option>2007</option>
                                            <option>2006</option>
                                            <option>2005</option>
                                            <option>2004</option>
                                            <option>2003</option>
                                            <option>2002</option>
                                            <option>2001</option>
                                            <option>2000</option>
                                            <option>1999</option>
                                            <option>1998</option>
                                            <option>1997</option>
                                            <option>1996</option>
                                            <option>1995</option>
                                            <option>1994</option>
                                            <option>1993</option>
                                            <option>1992</option>
                                            <option>1991</option>
                                            <option>1990</option>
                                            <option>1989</option>
                                            <option>1988</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-xs-3">性别:</label>
                                    <div class="col-xs-2">
                                        <label class="radio-inline">
                                            <input type="radio" name="genderRadios" value="M"> 男
                                        </label>
                                    </div>
                                    <div class="col-xs-2">
                                        <label class="radio-inline">
                                            <input type="radio" name="genderRadios" value="F"> 女
                                        </label>
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
                                        <span id="signup-result-text"></span>
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