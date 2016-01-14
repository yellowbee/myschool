
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
				drawBarChart('#barChart', result[1].enrollment, 300, 60);
				
				$('#pieChart_faculty').empty();
				drawPieChart('#pieChart_faculty', result[2].faculty, 300, 120);
				
				$('#mixedbarchart').empty();
				drawMixedBarChart("#mixedbarchart", result[3].tuition, 500, 30);
				$('#legend').empty();
			    drawLegendCategory10("#legend", result[3].tuition, 400, 25);
				
				switchTabPane(ev);
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			window.location.href = "http://localhost:8060/myschool/home";
		}
	});     	
}