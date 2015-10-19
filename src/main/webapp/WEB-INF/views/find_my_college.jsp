<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:new_template>
	<jsp:attribute name="script">
		<script src="resources/myschool-js/prepopulated-values.js"></script>
		<script type="text/javascript">
	        var selected_state_set = {};
	        var selected_major_set = {};
	        var src_inst_ctrl = null;
	        
	        function getSchoolTableCellHtml(name, city, state) {
	        	var html = "<td style=\"padding-bottom: 10px;width: 25%;text-align:center\">" +
								"<div class=\"panel panel-default\" style=\"margin:5px\">" +
				                    "<div class=\"panel-body\">" +
				                        "<div><a href=\"college_report\"><h5>" + name + "</h5></a></div>" +
				                        "<hr/>" +
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
	        
	        $(document).ready(function(){
	        	
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
	        	
	            $('#us_states').change( function() {
	                $(this).find(":selected").each(function () {
	                    //console.log( $(this).val() );
	                    var cur_selected = $(this).val();
	                    if (cur_selected != 'No Preference') {
	                        addUniqueEntry(selected_state_set, cur_selected, '#selected_items');
	                    }
	                    else {
	                        $('#selected_items').empty();
	                        selected_state_set = {};
	                    }
	                });
	            });
	            $('#selected_items').on('click', 'img', function() {
	                delete selected_state_set[$(this).parent().next().text()];
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
	            
	            
	        });
    	</script>  
	</jsp:attribute>
	<jsp:attribute name="a_fragment">
		<div class="row" style="margin-top: 30px">
			<div class="col-md-2 col-lg-2"></div>
                <div class="col-md-10 col-lg-10"><h3>Find My College</h3></div>
            </div>
            <div class="row" style="margin-top:35px">
                <div class="col-md-2 col-lg-2"></div>
                <div class="col-md-2 col-lg-2">
                    <ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
                        <li class="active"><a href="#test_scores" data-toggle="tab"><b style="font-size:18px">Test Scores</b></a></li>
                        <li><a href="#type_of_school" data-toggle="tab"><b style="font-size:18px">Type of School</b></a></li>
                        <li><a href="#location" data-toggle="tab"><b style="font-size:18px">Location</b></a></li>
                        <li><a href="#majors" data-toggle="tab"><b style="font-size:18px">Majors</b></a></li>
                        <li><a href="#paying" data-toggle="tab"><b style="font-size:18px">Paying</b></a></li>
                        <li id="search_results"><a href="#see_results" data-toggle="tab"><b style="font-size:18px">See Results</b></a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="tab-content" style="margin-left:20px">
                        <div class="tab-pane active" id="test_scores">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Test Scores</h3>
                            <p>Find Colleges where your SAT and/or ACT scores are close matches or above:</p>
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Critical Reading</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Math</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>SAT Writing</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>ACT Composite</h5></td>
                                    <td style="padding-bottom: 10px"><select class="selectpicker">
                                        <option>No Preference</option>
                                        <option>800</option>
                                        <option>700</option>
                                        <option>600</option>
                                        <option>500</option>
                                        <option>400</option>
                                        <option>300</option>
                                        <option>200</option>
                                    </select></td>
                                </tr>
                            </table>

                        </div>
                        <div class="tab-pane" id="type_of_school">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Type of School</h3>
                            <table cellpadding="10" style="width:100%">
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>2-year or 4-year</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">2-year/community<br/>colllege</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="c.typeahead, .tt-query, .tt-hint {
            border: 2px solid #CCCCCC;
            border-radius: 8px;
            font-size: 24px;
            height: 30px;
            line-height: 30px;
            outline: medium none;
            padding: 8px 12px;
            width: 396px;
        }
        .typeahead {
            background-color: #FFFFFF;
        }
        .typeahead:focus {
            border: 2px solid #0097CF;
        }heckbox">
                                        <label><input type="checkbox">4-year college or<br/>university</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>Public or Private</h5></td>
                                    <td style="padding-bottom: 10px"><label class="radio-inline">
                                        <input type="radio" name="srcRadios" value="Public">Public</label>
                                    </td>
                                    <td style="padding-bottom: 10px"><label class="radio-inline">
                                        <input type="radio" name="srcRadios" value="Private">Private</label>
                                    </td>
                                    <td style="padding-bottom: 10px"><label class="radio-inline">
                                        <input type="radio" name="srcRadios" value="Dontcare">Don't care</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>School Size</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Small(<2,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Medium<br/>(2,000 - 15,000)</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Large(>15,000)</label>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px"><h5>Single-sex or Coed</h5></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">Coed</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">All Women</label>
                                    </div></td>
                                    <td style="padding-bottom: 10px"><div class="checkbox">
                                        <label><input type="checkbox">All Men</label>
                                    </div></td>
                                </tr>
                            </table>

                        </div>
                        <div class="tab-pane" id="location">
                            <h3 style="border-bottom: solid 1px gray; padding: 5px">Location</h3>
                            <p>Choose as many as you like:</p>
                            <div id="us_states">
                            <select class="selectpicker">
                            	<option>No Preference</option>
                                <option>Alabama</option>
                                <option>Alaska</option>
                                <option>Arizona</option>
                                <option>Arkansas</option>
                                <option>California</option>
                                <option>Colorado</option>
                                <option>Connecticut</option>
                                <option>Delaware</option>
                                <option>Florida</option>
                                <option>Georgia</option>
                                <option>Hawaii</option>
                                <option>Idaho</option>
                                <option>Illinois</option>
                                <option>Indiana</option>
                                <option>Iowa</option>
                                <option>Kansas</option>
                                <option>Kentucky</option>
                                <option>Louisiana</option>
                                <option>Maine</option>
                                <option>Maryland</option>
                                <option>Massachusetts</option>
                                <option>Michigan</option>
                                <option>Minnesota</option>
                                <option>Mississippi</option>
                                <option>Missouri</option>
                                <option>Montana</option>
                                <option>Nebraska</option>
                                <option>Nevada</option>
                                <option>New Hampshire</option>
                                <option>New Jersey</option>
                                <option>New Mexico</option>
                                <option>New York</option>
                                <option>North Carolina</option>
                                <option>North Dakota</option>
                                <option>Ohio</option>
                                <option>Oklahoma</option>
                                <option>Oregon</option>
                                <option>Pennsylvania</option>
                                <option>Rhode Island</option>
                                <option>South Carolina</option>
                                <option>South Dakota</option>
                                <option>Tennessee</option>
                                <option>Texas</option>
                                <option>Utah</option>
                                <option>Vermont</option>
                                <option>Virginia</option>
                                <option>Washington</option>
                                <option>West Virginia</option>
                                <option>Wisconsin</option>
                                <option>Wyoming</option>
                            </select>
                            </div>
                            <div id="selected_items" style="margin-top: 15px">

                            </div>

                        </div>
                        <div class="tab-pane" id="majors">
                        	<h3 style="border-bottom: solid 1px gray; padding: 5px">Majors</h3>
                            <p>You would like to major in:</p>
                        	<div class="bs-example">
                                <input id="major-input" type="text" class="typeahead tt-query" autocomplete="off" spellcheck="false">
                                <div id="selected-majors" style="margin-top:20px"></div>
                            </div>
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
                    </div>
                </div>
                <div class="col-md-2 col-lg-2"></div>
            </div>
	</jsp:attribute>
</t:new_template>