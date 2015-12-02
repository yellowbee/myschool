<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<t:new_template>
	<jsp:attribute name="script">
		<script src="resources/myschool-js/prepopulated-values.js"></script>
		<script src="resources/myschool-js/state-eng-2-chn.js"></script>
		<script src="resources/d3.min.js"></script>
		<script src="resources/myschool-js/school-data-vis.js"></script>
		<script src="resources/myschool-js/school-barchart.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/school-piechart.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/school-barchart.css" />
		<script type="text/javascript">
	        var selected_state_set = {};
	        var selected_major_set = {};
	        var src_inst_ctrl = null;
	        
	        function clickState(usState) {
	            if (!(usState in selected_state_set)) {
	                $('#selected_items').append(
	                        "<div>" +
	                        "<a href=\"javascript:;\"><img src=\"resources/images/removeX.png\" height=\"15px\" alt=\"" + usState +"\"" +"/></a>" +
	                        "<span style=\"margin-left:5px\">" + g_state_eng_2_chn[usState] + "</span>" +
	                        "</div>"
	                );
	                selected_state_set[usState] = true;
	            }
	        }
	        
	        function getSchoolTableCellHtml(name, city, state) {
	        	var html = "<td style=\"padding-bottom: 10px;width: 25%;text-align:center\">" +
								"<div class=\"panel panel-default\" style=\"margin:5px\">" +
				                    "<div class=\"panel-body\">" +
				                    	"<img src=\"resources/images/school_logo/" + name.replace(/\s/g, "-") + ".gif\" alt=\"school logo\"/>" +
				                    	"<hr/>" +
				                        "<div><span id=\"clickForInfo\" title=\"" + name + "\"><a href=\"javascript:;\"><h5>" + name + "</h5></a></span></div>" +
				                        "<h5>" + city + "," + state + "</h5>" +
				                        "<hr/>" +
				                        "<button type=\"button\" class=\"btn btn-primary\">Add to List</button>" +
				                    "</div>" +
				                "</div>" +
				            "</td>";
				return html;
	        }
	        
	        /* add an element with the label to the container if the label is not in the given set */
	        function addUniqueEntry(set, label, container) {
	        	if (!(label in set)) {
                    $(container).append(
                            "<div><a href=\"javascript:;\"><img src=\"resources/images/removeX.png\" height=\"15px\" /></a><span style=\"margin-left:5px\">" + label + "</span></div>"
                    );
                    set[label] = true;
                }
	        }
	        
	        function switchTabPane(ev) {
	        	$(ev.data.offTab).removeClass("active");
                $(ev.data.offPane).removeClass("active");
               $(ev.data.onTab).addClass("active");
                $(ev.data.onPane).addClass("active");
	        }
	        
	        /* ev handler for clicking #clickForInfo */
	        function showVisDataHandler(ev) {
	        	/* request school info */
	        	$.ajax({
					  type: "POST",
					  contentType: "application/json",
				      url: 'get-school-stats',
				      data: JSON.stringify({
				         "schoolName": $(this).attr("title"),
				      }),
				      dataType: 'json',
				      success: function(result) {
				    	  if (result[0].status == 'UNAUTHENTICATED') {
				    		  window.location.href = "http://localhost:8060/myschool/home";
				    	  }
				    	  else {
							  $('#pieChart').empty();
							  
							  /* drawPieChart('#pieChart', [
					        	                           { label: "Bachelor", count: 210 },
					        	                           { label: "Master", count: 110},
					        	                           { label: "Ph.D", count: 53}
					        	                       		]); */
					          drawPieChart('#pieChart', result[0].majorsPerDegreeList, 300, 120);
					          $('#barChart').empty();
					          drawBarChart('#barChart', result[1].enrollment, 1000, 100);
					          
				          	  switchTabPane(ev);
				    	  }
				      },
				      error: function(xhr, textStatus, errorThrown) {
				    	  window.location.href = "http://localhost:8060/myschool/home";
				      }
				});     	
	        }
	        
	        $(document).ready(function(){
	        	$('#result_table').on('click', '#clickForInfo', {offTab:'#search_results',
	        													offPane:'#see_results',
	        													onTab:'#report',
	        													onPane:'#school_report'},
	        						showVisDataHandler);
	        	
	        	$('#backToResult').on('click', {offTab:'#report',
												offPane:'#school_report',
												onTab:'#search_results',
												onPane:'#see_results'},
									switchTabPane);
	        	
	        	 $( "#major-input" ).autocomplete({
		        	 source: getAvailableMajors(),
		        	 select: function( event, ui ) {
			        	 addUniqueEntry(selected_major_set, ui.item.value, '#selected-majors');
			        	 $("#major-input").html(ui.item.value);
			        	 return false;
		        	 }
	        	 });
	        	 $('#selected-majors').on('click', 'img', function() {
			         delete selected_major_set[$(this).parent().next().text()];
			         $(this).parent().parent().remove();
		         });
	           
	            $('#selected_items').on('click', 'img', function() {
	                var state_str = $(this).attr('alt');
	                delete selected_state_set[state_str];
	                $(this).parent().parent().remove();
	            });
	            
	            $('li[id=search_results]').click(function() {
       	
            	   $('#result_table').find('tr').empty();
            	   
            	   if ($('input[value=Public]').is(":checked")) {
                       src_inst_ctrl = 'public';
                   }
                   else if ($('input[value=Private').is(":checked")) {
                       src_inst_ctrl = 'private';
                   }
                   else if ($('input[value=Dontcare]').is(":checked")) {
                       src_inst_ctrl = null;
                   }
            	   
            	   var state_arr = null;
            	   if (Object.keys(selected_state_set).length > 0) {
            		   state_arr = Object.keys(selected_state_set);
            	   }
            	   
            	   var major_arr = null;
            	   if (Object.keys(selected_major_set).length > 0) {
            		   major_arr = Object.keys(selected_major_set);
            	   }
            	   
				   $.ajax({
					  type: "POST",
					  contentType: "application/json",
				      url: 'find_my_college',
				      data: JSON.stringify({
				         "states": state_arr,
				         "srcInstCtrl": src_inst_ctrl,
				         "majors": major_arr
				      }),
				      dataType: 'json',
				      success: function(result) {
				    	  $('#result_table').find('tr').empty();
	                    	
	                    	var cnt = 0;
					    	$.each(result.slice(0, 16), function(index, value) {
								if (cnt % 4 == 0) {
									$('#result_table').append("<tr>" + getSchoolTableCellHtml(value.name, value.city, value.state) + "</tr>");
								}
								else {
									$('#result_table tr:last-child').append(getSchoolTableCellHtml(value.name, value.city, value.state));
								}
																
								cnt++;
						    });
				    	  
				    	  var num_of_pages = Math.floor(result.length / 16) + 1;
				    	  $('#pagi').empty().append("<ul id=\"pagination-demo\" class=\"pagination-sm\"></ul>");
				    	  $('#pagination-demo').twbsPagination({
			                    totalPages: num_of_pages,
			                    visiblePages: 5,
			                    onPageClick: function (event, page) {
			                    	$('#result_table').find('tr').empty();
			                    	
			                    	var count = 0;
							    	$.each(result.slice((page-1)*16, page*16), function(index, value) {
										if (count % 4 == 0) {
											$('#result_table').append("<tr>" + getSchoolTableCellHtml(value.name, value.city, value.state) + "</tr>");
										}
										else {
											$('#result_table tr:last-child').append(getSchoolTableCellHtml(value.name, value.city, value.state));
										}
																		
										count++;
		  						    });
			                    }
			              });
				      }
				   });

				});
	            
	            $( "#slider-range-min" ).slider({
	                range: "min",
	                value: 37,
	                min: 1,
	                max: 50000,
	                slide: function( event, ui ) {
	                    $( "#amount" ).val( "$" + ui.value );
	                }
	            });
	            $( "#amount" ).val( "$" + $( "#slider-range-min" ).slider( "value" ) );
	            
	            $( "#slider-range-sat" ).slider({
	                range: "min",
	                value: 1,
	                min: 1,
	                max: 2400,
	                slide: function( event, ui ) {
	                    $( "#satScore" ).val( "$" + ui.value );
	                }
	            });
	            $( "#satScore" ).val( "$" + $( "#slider-range-sat" ).slider( "value" ) );

	            $( "#slider-range-act" ).slider({
	                range: "min",
	                value: 1,
	                min: 1,
	                max: 36,
	                slide: function( event, ui ) {
	                    $( "#actScore" ).val( "$" + ui.value );
	                }
	            });
	            $( "#actScore" ).val( "$" + $( "#slider-range-act" ).slider( "value" ) );
	            
	        });
    	</script>  
	</jsp:attribute>
	<jsp:attribute name="a_fragment">
		<div>
		<div class="row">
			<div class="col-md-2 col-lg-2"></div>
			<div class="col-md-8 col-lg-8">
				<div style="float:right; margin-top:10px" class="${logged}">
					<span style="margin-right: 20px">Hi&nbsp;<c:out value="${user.firstName}" /></span>
					<span><a href="logout">&nbsp;登出&nbsp;</a></span>
				</div>
				<div style="float:right; margin-top:10px" class="${unlogged}">
					<span style="margin-right: 20px">登录</span>
					<span><a href="logout">&nbsp;注册&nbsp;</a></span>
				</div>
			</div>
			<div class="col-md-2 col-lg-2"></div>
		</div>
		<div class="row" style="margin-top: 30px">
			<div class="col-md-2 col-lg-2"></div>
                <div class="col-md-10 col-lg-10"><h3>搜索我的大学</h3></div>
            </div>
            <div class="row" style="margin-top:35px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-2 col-lg-2">
                    <ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
                        <li class="active"><a href="#test_scores" data-toggle="tab"><b style="font-size:18px">标准化考试成绩</b></a></li>
                        <li><a href="#type_of_school" data-toggle="tab"><b style="font-size:18px">学校类型</b></a></li>
                        <li><a href="#location" data-toggle="tab"><b style="font-size:18px">学校所在地</b></a></li>
                        <li><a href="#majors" data-toggle="tab"><b style="font-size:18px">专业</b></a></li>
                        <li><a href="#paying" data-toggle="tab"><b style="font-size:18px">学费和奖学金</b></a></li>
                        <li id="search_results"><a href="#see_results" data-toggle="tab"><b style="font-size:18px">查看搜索结果</b></a></li>
                        <li id="report"><a href="#school_report" data-toggle="tab"><b style="font-size:18px">学校简介</b></a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="tab-content" style="margin-left:20px">
                        <div class="tab-pane active" id="test_scores">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">标准化考试成绩</h3>
                            <p>输入你的ACT和SAT成绩:</p>
                            <div style="margin-top: 20px">
						        <p>
						            <label for="satScore">我的SAT成绩:</label>
						            <input type="text" id="satScore" readonly style="border:0; color:#f6931f; font-weight:bold;">
						        </p>
						        <div id="slider-range-sat" style="width: 300px"></div>
						    </div>
						
						    <div style="margin-top: 20px">
						        <p>
						            <label for="actScore">我的ACT COMPOSITE成绩:</label>
						            <input type="text" id="actScore" readonly style="border:0; color:#f6931f; font-weight:bold;">
						        </p>
						        <div id="slider-range-act" style="width: 300px"></div>
						    </div>

                        </div>
                        <div class="tab-pane" id="type_of_school">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">学校类型</h3>
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>两年制或四年制</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">两年制大专<br/>colllege</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">四年制本科</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>公立或私立</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox" value="Public">公立</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox" value="Public">公立</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>学校规模</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">小型(<2,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">中型<br/>(2,000 - 15,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">大型(>15,000)</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>是否男女同校</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">男女同校</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">女子学校</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">男子学校</label>
                                    </div></td>
                                </tr>
                            </table>

                        </div>
                        <div class="tab-pane" id="location">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">学校所在地</h3>
                            <p>输入你感兴趣的学校所在的州，可以输入多个：</p>

                            <div id="map-box">
                                <img src="resources/images/map-us.png" width="610" height="373" border="0" usemap="#usa_map" style="margin-left: 10%"/>
                                <map name="usa_map">
                                    <area onclick="clickState('Maine');" shape="poly" alt="Maine" title="缅因" coords="560,68, 557,64, 556,42, 563,33, 563,28, 572,17, 582,17, 586,21, 586,38, 591,44, 594,47, 594,51, 591,52, 587,51, 568,61, 565,64, 563,68" href="javascript:;">
                                    <area onclick="clickState('Massachusetts');" shape="poly" alt="Massachusetts" title="马萨诸塞" coords="542,83, 546,74, 564,73, 567,76, 569,81, 574,82, 573,89, 565,92, 558,84" href="javascript:;">
                                    <area onclick="clickState('Massachusetts');" shape="poly" alt="Massachusetts" title="马萨诸塞" coords="575,110, 602,110, 602,128, 575,128" href="javascript:;">
                                    <area onclick="clickState('New Hampshire');" shape="poly" alt="New Hampshire" title="新罕布什尔" coords="538,71, 538,64, 549,42, 553,42, 554,64, 557,68, 551,74" href="javascript:;">
                                    <area onclick="clickState('New Hampshire');" shape="poly" alt="New Hampshire" title="新罕布什尔" coords="574,105, 574,87, 603,87, 603,105" href="javascript:;">
                                    <area onclick="clickState('Vermont');" shape="poly" alt="Vermont" title="佛蒙特" coords="528,68, 528,40, 546,40, 541,54, 535,68" href="javascript:;">
                                    <area onclick="clickState('Vermont');" shape="poly" alt="Vermont" title="佛蒙特" coords="574,64, 602,64, 602,82, 574,82" href="javascript:;">
                                    <area onclick="clickState('Delaware');" shape="poly" alt="Delaware" title="特拉华" coords="522,160, 522,142, 526,141, 533,160, 526,162" href="javascript:;">
                                    <area onclick="clickState('Delaware');" shape="poly" alt="Delaware" title="特拉华" coords="574,202, 603,202, 603,220, 574,220" href="javascript:;">
                                    <area onclick="clickState('New Jersey');" shape="poly" alt="New Jersey" title="新泽西" coords="524,139, 516,132, 522,123, 519,119, 524,110, 533,114, 533,128" href="javascript:;">
                                    <area onclick="clickState('New Jersey');" shape="poly" alt="New Jersey" title="新泽西" coords="574,179, 603,179, 603,197, 574,197" href="javascript:;">
                                    <area onclick="clickState('Connecticut');" shape="poly" alt="Connecticut" title="康捏迭戈" coords="527,99, 530,84, 546,84, 546,96, 530,100" href="javascript:;">
                                    <area onclick="clickState('Connecticut');" shape="poly" alt="Connecticut" title="康捏迭戈" coords="574,156, 602,156, 602,174, 574,174" href="javascript:;">
                                    <area onclick="clickState('Rhode Island');" shape="poly" alt="Rhode Island" title="罗德岛" coords="547,96, 548,84, 555,87, 557,94, 548,99" href="javascript:;">
                                    <area onclick="clickState('Rhode Island');" shape="poly" alt="Rhode Island" title="罗德岛" coords="573,151, 573,132, 603,132, 603,151" href="javascript:;">
                                    <area onclick="clickState('Maryland');" shape="poly" alt="Maryland" title="马里兰" coords="479,138, 479,129, 514,132, 516,146, 519,148, 518,153, 512,154, 506,151, 500,147, 500,141, 493,135, 484,138, 481,141" href="javascript:;">
                                    <area onclick="clickState('Maryland');" shape="poly" alt="Maryland" title="马里兰" coords="574,225, 603,225, 603,243, 574,243" href="javascript:;">
                                    <area onclick="clickState('District of Columbia');" shape="rect" alt="District of Columbia" title="District of Columbia" coords="574,248,602,265" href="javascript:;">
                                    <area onclick="clickState('New York');" shape="poly" alt="New York" title="纽约" coords="471,93, 471,88, 477,76, 493,75, 496,76, 500,75, 500,68, 511,57, 526,57, 524,104, 535,102, 538,104, 532,107, 516,111, 518,107, 510,98, 508,94" href="javascript:;">
                                    <area onclick="clickState('Pennsylvania');" shape="poly" alt="Pennsylvania" title="宾夕法尼亚" coords="462,127, 463,100, 471,94, 473,100, 508,100, 513,107, 511,116, 516,121, 510,127, 503,129" href="javascript:;">
                                    <area onclick="clickState('West Virginia');" shape="poly" alt="West Virginia" title="西弗吉尼亚" coords="459,174, 450,162, 453,156, 467,143, 469,132, 473,132, 473,143, 479,143, 493,143, 498,148, 498,151, 493,152, 491,150, 482,160, 479,160, 473,171, 465,173" href="javascript:;">
                                    <area onclick="clickState('Virginia');" shape="poly" alt="Virginia" title="弗吉尼亚" coords="447,187, 450,185, 464,176, 468,178, 477,176, 485,165, 498,154, 503,154, 510,160, 509,165, 516,171, 522,168, 526,170, 519,183, 522,189, 522,192, 507,190, 452,189" href="javascript:;">
                                    <area onclick="clickState('Ohio');" shape="poly" alt="俄亥俄" title="俄亥俄" coords="420,119, 437,119, 445,121, 458,116, 459,135, 457,145, 447,154, 442,160, 437,160, 434,156, 430,156, 420,150" href="javascript:;">
                                    <area onclick="clickState('Michigan');" shape="poly" alt="Michigan" title="密歇根" coords="397,110, 402,100, 399,89, 399,81, 402,74, 413,64, 418,64, 429,70, 429,81, 434,84, 437,100, 429,112, 402,113" href="javascript:;">
                                    <area onclick="clickState('Indiana');" shape="poly" alt="Indiana" title="印第安纳" coords="384,170, 384,165, 388,160, 388,125, 415,123, 415,160, 405,170, 388,171, 386,171" href="javascript:;">
                                    <area onclick="clickState('Kentucky');" shape="poly" alt="Kentucky" title="肯塔基" coords="394,192, 381,192, 381,189, 386,180, 394,173, 409,173, 422,160, 427,160, 432,165, 442,165, 450,180, 437,192" href="javascript:;">
                                    <area onclick="clickState('Illinois');" shape="poly" alt="Illinois" title="伊力诺依" coords="359,113, 383,113, 387,125, 387,158, 383,165, 382,173, 377,179, 367,180, 365,176, 365,171, 359,165, 356,154, 350,146, 350,138, 353,129, 359,125, 359,117" href="javascript:;">
                                    <area onclick="clickState('Wisconsin');" shape="poly" alt="Wisconsin" title="威斯康辛" coords="347,57, 360,54, 364,57, 366,61, 381,66, 386,74, 388,72, 391,74, 390,79, 385,93, 385,107, 358,107, 352,104, 352,90, 341,81, 341,68, 345,64, 345,57, 349,56" href="javascript:;">
                                    <area onclick="clickState('Missouri');" shape="poly" alt="Missouri" title="密苏里" coords="306,141, 343,141, 345,143, 346,151, 352,156, 352,160, 355,160, 355,165, 355,168, 362,174, 364,182, 366,182, 366,189, 360,195, 352,195, 352,192, 355,190, 314,190, 315,160" href="javascript:;">
                                    <area onclick="clickState('Iowa');" shape="poly" alt="Iowa" title="衣阿华" coords="305,135, 304,132, 302,125, 299,110, 300,100, 346,100, 346,110, 355,119, 355,123, 349,127, 349,132, 343,138, 341,138, 339,137, 306,137" href="javascript:;">
                                    <area onclick="clickState('Minnesota');" shape="poly" alt="Minnesota" title="明尼苏达" coords="297,31, 301,94, 347,94, 345,87, 333,76, 336,66, 338,57, 358,43, 358,40, 345,38, 341,38, 330,33, 320,33, 319,25, 312,25, 312,28" href="javascript:;">
                                    <area onclick="clickState('Tennessee');" shape="poly" alt="Tennessee" title="田纳西" coords="372,216, 382,195, 455,195, 429,218" href="javascript:;">
                                    <area onclick="clickState('Arkansas');" shape="poly" alt="Arkansas" title="阿肯色" coords="330,241, 330,235, 327,233, 327,197, 369,197, 375,206, 360,233, 358,241" href="javascript:;">
                                    <area onclick="clickState('North Carolina');" shape="poly" alt="North Carolina" title="北卡罗来纳" coords="445,213, 445,211, 471,192, 524,195, 529,203, 530,211, 522,216, 519,218, 511,220, 505,228, 498,228, 487,216, 477,216, 475,213, 459,213, 450,213" href="javascript:;">
                                    <area onclick="clickState('South Carolina');" shape="poly" alt="South Carolina" title="南卡罗来纳" coords="453,227, 477,257, 500,233, 489,222, 479,220, 475,218, 458,218, 451,224" href="javascript:;">
                                    <area onclick="clickState('Georgia');" shape="poly" alt="Georgia" title="乔治亚" coords="466,284, 471,278, 477,262, 456,235, 456,231, 429,231, 430,235, 434,259, 434,270, 434,280, 450,282, 460,282" href="javascript:;">
                                    <area onclick="clickState('Florida');" shape="poly" alt="Florida" title="佛罗里达" coords="473,358, 489,350, 492,337, 493,329, 477,282, 469,284, 466,288, 442,286, 442,282, 413,282, 413,286, 415,292, 430,295, 437,301, 442,301, 450,298, 457,306, 457,316, 459,327, 468,343, 468,351" href="javascript:;">
                                    <area onclick="clickState('Alabama');" shape="poly" alt="Alabama" title="阿拉巴马" coords="394,276, 402,280, 408,274, 408,270, 430,270, 430,255, 432,252, 424,220, 398,220, 394,253" href="javascript:;">
                                    <area onclick="clickState('Mississippi');" shape="poly" alt="Mississippi" title="密西西比" coords="375,268, 375,274, 379,278, 391,276, 390,270, 391,252, 394,222, 390,220, 372,220, 362,238, 362,255, 358,264, 358,268" href="javascript:;">
                                    <area onclick="clickState('Louisiana');" shape="poly" alt="Louisiana" title="路易斯安那" coords="371,274, 372,280, 375,284, 375,288, 379,293, 375,301, 371,299, 369,295, 362,296, 355,296, 349,293, 341,292, 327,288, 327,284, 329,274, 330,272, 325,262, 325,247, 358,247, 358,258, 352,272, 371,272" href="javascript:;">
                                    <area onclick="clickState('Oklahoma');" shape="poly" alt="Oklahoma" title="俄克拉荷马" coords="270,206, 242,206, 244,195, 320,195, 323,238, 316,236, 304,238, 287,236, 269,228" href="javascript:;">
                                    <area onclick="clickState('Kansas');" shape="poly" alt="Kansas" title="堪萨斯" coords="244,154, 305,154, 311,165, 312,192, 242,192" href="javascript:;">
                                    <area onclick="clickState('Nebraska');" shape="poly" alt="Nebraska" title="内布拉斯加" coords="230,110, 275,110, 279,112, 288,112, 294,117, 300,134, 300,138, 304,146, 304,148, 244,148, 244,137, 228,138" href="javascript:;">
                                    <area onclick="clickState('South Dakota');" shape="poly" alt="South Dakota" title="南达科他" coords="232,68, 294,68, 297,112, 292,112, 288,107, 230,107" href="javascript:;">
                                    <area onclick="clickState('North Dakota');" shape="poly" alt="North Dakota" title="北达科他" coords="235,25, 288,25, 297,64, 232,64" href="javascript:;">
                                    <area onclick="clickState('Texas');" shape="poly" alt="Texas" title="德克萨斯" coords="289,337, 278,335, 269,330, 247,293, 239,292, 233,301, 230,301, 215,291, 214,282, 196,266, 196,259, 233,259, 235,211, 267,211, 266,235, 272,237, 287,241, 294,241, 300,241, 307,241, 320,244, 321,262, 327,274, 325,280, 325,288, 322,292, 314,296, 307,301, 297,309, 294,314, 291,319, 291,323, 294,329, 294,333" href="javascript:;">
                                    <area onclick="clickState('New Mexico');" shape="poly" alt="New Mexico" title="新墨西哥" coords="174,192, 230,192, 230,253, 182,259, 177,262, 171,262" href="javascript:;">
                                    <area onclick="clickState('Colorado');" shape="poly" alt="Colorado" title="科罗拉多" coords="179,141, 238,141, 239,189, 176,189" href="javascript:;">
                                    <area onclick="clickState('Wyoming');" shape="poly" alt="Wyoming" title="怀俄明" coords="159,87, 223,87, 225,137, 217,138, 159,137" href="javascript:;">
                                    <area onclick="clickState('Montana');" shape="poly" alt="Montana" title="蒙大拿" coords="153,87, 138,71, 137,59, 129,49, 128,43, 128,28, 223,28, 225,79, 169,81, 169,84" href="javascript:;">
                                    <area onclick="clickState('Idaho');" shape="poly" alt="Idaho" title="爱达荷" coords="101,123, 103,91, 107,81, 103,74, 103,42, 116,40, 116,54, 129,68, 129,76, 132,79, 139,91, 153,89, 156,93, 156,123" href="javascript:;">
                                    <area onclick="clickState('Utah');" shape="poly" alt="Utah" title="犹他" coords="122,192, 124,129, 152,129, 153,143, 169,143, 169,190" href="javascript:;">
                                    <area onclick="clickState('Arizona');" shape="poly" alt="Arizona" title="亚利桑那" coords="109,253, 148,268, 169,268, 168,199, 120,199, 116,206, 113,213, 113,225, 116,231, 113,238" href="javascript:;">
                                    <area onclick="clickState('Alaska');" shape="poly" alt="Alaska" title="阿拉斯加" coords="191,337, 196,343, 190,349, 180,349, 166,335, 156,332, 151,338, 137,350, 111,354, 93,354, 75,347, 64,335, 67,329, 69,327, 73,328, 77,332, 79,337, 84,340, 96,343, 105,343, 105,331, 107,316, 111,303, 122,296, 130,288, 140,282, 149,286, 159,288, 164,288, 166,321, 174,321, 179,324, 186,330" href="javascript:;">
                                    <area onclick="clickState('Hawaii');" shape="poly" alt="Hawaii" title="夏威夷" coords="33,259, 45,255, 64,263, 93,272, 99,288, 85,301, 75,296, 74,282, 42,272, 30,268" href="javascript:;">
                                    <area onclick="clickState('Nevada');" shape="poly" alt="Nevada" title="内华达" coords="109,211, 61,167, 63,129, 115,130, 116,201, 111,201, 111,211" href="javascript:;">
                                    <area onclick="clickState('California');" shape="poly" alt="California" title="加利福尼亚" coords="109,244, 106,247, 81,250, 78,244, 67,245, 56,239, 48,228, 19,171, 17,156, 21,135, 57,137, 58,173, 105,217, 111,225" href="javascript:;">
                                    <area onclick="clickState('Oregon');" shape="poly" alt="Oregon" title="俄勒冈" coords="97,123, 96,125, 35,125, 33,120, 33,112, 38,75, 50,75, 52,81, 78,76, 97,76, 101,81, 97,94" href="javascript:;">
                                    <area onclick="clickState('Washington');" shape="poly" alt="Washington" title="华盛顿" coords="101,70, 82,71, 56,76, 42,65, 38,45, 38,40, 54,33, 99,33" href="javascript:;">
                                </map>
                            </div>
                            <div id="selected_items" style="margin-top: 15px">

                            </div>

                        </div>
                        <div class="tab-pane" id="majors">
                        	<h3 style="border-bottom: solid 1px gray; padding: 5px">专业</h3>
                            <p>You would like to major in:</p>
                        	<div class="bs-example">
                                <input id="major-input" type="text" class="typeahead tt-query" autocomplete="off" spellcheck="false">
                                <div id="selected-majors" style="margin-top:20px"></div>
                            </div>
                        </div>
                        <div class="tab-pane" id="paying">
                        	<h3 style="border-bottom: solid 1px gray; padding: 5px">学费</h3>
                            <p>我可以支付的最大学费是:</p>
                            <p>
						        <label for="amount">Maximum price:</label>
						        <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
						    </p>
						    <div id="slider-range-min" style="width: 300px"></div>
                        </div>
                        <div class="tab-pane" id="see_results">
                            <table id="result_table" cellpadding="10" style="width:100%; table-layout:fixed">
                            	<col width="25%"/>
                                <col width="25%"/>
                                <col width="25%"/>
                                <col width="25%"/>
                                
                            </table>
                            <!-- <ul id="pagination-demo" class="pagination-sm"></ul> -->
                            <div id="pagi"></div>
                        </div>
                        <div class="tab-pane" id="school_report">
                        	<div id="backToResult"><a href="javascript:;">Back to Search Result</a></div>
                        	
                        	<div class="fact-container">
                        	<div class="fact">
                        		<div class="left-note">
	                                <svg class="paperclip" enable-background="new 0 0 100 100" version="1.1" viewBox="0 0 100 100" x="0px" xml:space="preserve" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" y="0px">
	                                    <path class="behind" d="M54,18.3c1.8,1.6,3,4,3,6.7" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                        <path class="in-front" d="M57,38v41.1c0,4.9-4,8.9-8.9,8.9h-0.1
                                           C43,88,39,84,39,79.1V24.9c0-4.9,4-8.9,8.9-8.9h0.1c2.3,0,4.4,0.9,6,2.3" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                    </svg>
                                    <span>学校概况</span>
                                </div>
                                <img src="resources/images/ou_arial_view.jpg" style="width:50%;display:block;margin-left:auto;margin-right:auto;margin-bottom: 30px"/>
                                <p><h4>俄亥俄大学是位于主要在1,850英亩（7.5平方公里）的校园在雅典，俄亥俄州，美国一个主要的美国公立研究型大学。
                                作为美国历史最悠久的大学之一，俄亥俄州立大学被特许在1804年2月18日， [ 3 ]和开放学生1809 [4] 2014年，雅典校园拥
                                有约23300个别学生;其他五个校区拥有约10,000结合;和电子教学有大约5900学生个人。总共39201人已报名参加课程相当于30878名全职出席会议。</h4></p>
                            </div>
                            </div>
							
                            <div class="fact-container">
                        	<div class="fact">
                        		<div class="left-note">
	                                <svg class="paperclip" enable-background="new 0 0 100 100" version="1.1" viewBox="0 0 100 100" x="0px" xml:space="preserve" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" y="0px">
	                                    <path class="behind" d="M54,18.3c1.8,1.6,3,4,3,6.7" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                        <path class="in-front" d="M57,38v41.1c0,4.9-4,8.9-8.9,8.9h-0.1
                                           C43,88,39,84,39,79.1V24.9c0-4.9,4-8.9,8.9-8.9h0.1c2.3,0,4.4,0.9,6,2.3" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                    </svg>
                                    <span>学校图表</span>
                                </div>
                            	<div id="pieChart" style="margin-left:auto;margin-right:auto"></div>
                            </div>
                            </div>
                            
                            <div class="fact-container">
                            <div class="fact">
                                <div class="left-note">
                                    <svg class="paperclip" enable-background="new 0 0 100 100" version="1.1" viewBox="0 0 100 100" x="0px" xml:space="preserve" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" y="0px">
                                        <path class="behind" d="M54,18.3c1.8,1.6,3,4,3,6.7" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                        <path class="in-front" d="M57,38v41.1c0,4.9-4,8.9-8.9,8.9h-0.1
                                           C43,88,39,84,39,79.1V24.9c0-4.9,4-8.9,8.9-8.9h0.1c2.3,0,4.4,0.9,6,2.3" fill="none" stroke-miterlimit="10" stroke-width="3" stroke="#CC3333"></path>
                                    </svg>
                                    <span>学校图表</span>
                                </div>
                                <div id="barChart"></div>
                            </div>
                            </div>
						</div>
                    </div>
                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
            </div>
	</jsp:attribute>
</t:new_template>