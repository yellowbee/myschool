<%-- <%@ page isELIgnored="false" %> --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:home_template>
	<jsp:attribute name="tab_script">
		<script>
			$(document).ready(function() {
				$('#left').puitabview({
					orientation: 'left'
				});
				
				$('#default').puiaccordion();

		        $('#profile').puiaccordion().attr("activeIndex", 0);
		        
		        // script for profile.tag
		        $('.button_continue').click(function(){
		        	var activeIndex = $('#profile').attr('activeIndex');
		        	$('#profile').puiaccordion('unselect', activeIndex);
		        	$('#profile').puiaccordion('select', ++activeIndex);
		        	$('#profile').attr('activeIndex', activeIndex);
		        });
		        
		        // register click event handler for activated tab
		        $('h3#personal_info').click(function(){
		        	$('#profile').attr('activeIndex', 0);
		        });
		        $('h3#address').click(function(){
		        	$('#profile').attr('activeIndex', 1);
		        });
		        $('h3#contact_detail').click(function(){
		        	$('#profile').attr('activeIndex', 2);
		        });
		        
		        //script for address.tag
		        $("#btn_add_addr").click(function(){
		    		$("#modal_address").modal('show');
		    	});
		        
		        $('#modal_address #btn_modal_add_addr').click(function(){
		        	var postalAddr = $('#form_addr #postalAddress').val();
		        	var zipCode = $('#form_addr #zipCode').val();
		        	$('#div_addr #asking_for_addr').hide();
		        	$('#addr_added #postal_addr').html(postalAddr);
		        	$('#addr_added #zip_code').html(zipCode);
		        	$('#div_addr #addr_added').show();
		        });

		        $("#addr_added #rm_addr").click(function(){
		        	$('#modal_address #postalAddress').val("");
		        	$('#modal_address #zipCode').val("");
		        	$('#addr_added').hide();
		        	$('#div_addr #asking_for_addr').show();
		        });
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="home_tabs">
		<li><a href="dashboard">Dashboard</a></li>
		<li><a href="#">My Colleges</a></li>
		<li class="active"><a href="my_app">My App</a></li>
		<li><a href="college_search">College Search</a></li>
	</jsp:attribute>
	<jsp:attribute name="tab_content">
		<div id="left">
			<ul>  
				<li><a href="#tab1">Profile</a></li>  
				<li><a href="#tab2">Family</a></li>
				<li><a href="#tab3">Education</a></li>
				<li><a href="#tab4">Testing</a></li>
				<li><a href="#tab5">Activities</a></li>
				<li><a href="#tab6">Writing</a></li>
			</ul>
			<div> 
				<div id="tab1">
					<div id="profile">  
					    <h3 id="personal_info">Personal Information</h3>  
				    	<t:personal_info />  

					    <h3 id="address">Address</h3>  
					    <t:address />  
					  
					    <h3 id="contact_detail">Contact Details</h3>  
					    <t:contact />      
					</div>
				</div>
				<div id="tab2"></div>
				<div id="tab3"></div>
				<div id="tab4"></div>
				<div id="tab5"></div>
				<div id="tab6"></div>
			</div>
		</div>

	</jsp:attribute>
</t:home_template>