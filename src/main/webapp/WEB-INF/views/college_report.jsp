<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:new_template>
	<jsp:attribute name="a_fragment">
			<div class="row" style="margin-top: 30px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-8 col-lg-8"><h3>Ohio University</h3><h5>Athens, OH</h5><hr/></div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
            <div class="row" style="margin-top:35px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-2 col-lg-2">
                    <ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
                        <li class="active"><a href="#at_a_glance" data-toggle="tab"><b style="font-size:18px">At a Glance</b></a></li>
                        <li><a href="#deadline" data-toggle="tab"><b style="font-size:18px">Deadline</b></a></li>
                        <li><a href="#majors_n_learning" data-toggle="tab"><b style="font-size:18px">Majors & Learning Environment</b></a></li>
                        <li><a href="#campus_life" data-toggle="tab"><b style="font-size:18px">Campus Life</b></a></li>
                        <li><a href="#applying" data-toggle="tab"><b style="font-size:18px">Applying</b></a></li>
                        <li><a href="#paying" data-toggle="tab"><b style="font-size:18px">Paying</b></a></li>
                        <li><a href="#transfer_student" data-toggle="tab"><b style="font-size:18px">For Transfer Student</b></a></li>
                        <li><a href="#international_student" data-toggle="tab"><b style="font-size:18px">For International Student</b></a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-4">
                    <div class="tab-content" style="margin-left:20px">
                        <div class="tab-pane active" id="at_a_glance">
                            <img src="resources/images/ou_arial_view.jpg" style="width:100%;display:block;margin-left:auto;margin-right:auto;margin-bottom: 30px"/>
                            <p><h4>Ohio University is a major U.S. public research university
                                located primarily on a 1,850-acre (7.5 km2) campus in Athens, Ohio, United States.
                                As one of America's oldest universities, Ohio University was chartered on
                                February 18, 1804,[3] and opened for students in 1809.[4] As of 2014, the Athens
                                campus had approximately 23,300 individual students; the other five campuses had
                                approximately 10,000 combined; and eLearning had approximately 5900 individual students.
                                In total, 39,201 individuals were enrolled in classes equivalent to 30,878 full time
                                equivalent attendance.</h4></p>

                            <hr/>
                            <h5>Quick Facts</h5>
                            <h1>Large</h1>
                            <h6>35,000 total undergrads <br/> 8,000 degree-seeking freshman</h6>
                            <h1>$12,526 average financial aid</h1>
                            <h6>65% of financial need met <br/> Tuition and fees $10,957 in-state, $29,421 out-of-state</h6>

                            <hr/>
                            <h5>Location</h5>
                            <h5>Main Address</h5>
                            <h6>120 Chubb Hall <br/> Athens, OH 45701-2979 <br/> www.ohio.edu</h6>
                        </div>
                        <div class="tab-pane" id="deadline">
                            <h3 style="padding: 5px">Deadline</h3>
                        </div>
                        <div class="tab-pane" id="majors_n_learning">
                            <h3 style="padding: 5px">Majors & Learning</h3>
                        </div>
                        <div class="tab-pane" id="campus_life">
                            <h3 style="padding: 5px">Campus Life</h3>
                        </div>
                        <div class="tab-pane" id="applying">
                            <h3 style="padding: 5px">Applying</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4"></div>
            </div>
	</jsp:attribute>
</t:new_template>