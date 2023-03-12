// Silva T.U.D

// Validation of the check ward form
$(document).ready(function($) {            
	$("#checkWard").validate({
		rules: {
			w_name: {
				required: true,
				test: true
			},
		},
		
		messages: {
			w_name: {
				required: "Ward Name required",
				test: "Invalid Ward Name"
			},
		},
	});
	
	$.validator.addMethod("test", function(s) {
		var reg = /[0-9]/;
        if(reg.test(s)){
        	return false;
        }else{
            return true;
        }
	});
	
	
	// Validation of the add inpatient form
	$("#addInPatient").validate({
		rules: {
			ip_name: {
				required: true,
				test: true
			},
		},
		
		messages: {
			ip_name: {
				required: "Patient Name required",
				test: "Invalid Patent Name"
			},
		},
	});
	
	$.validator.addMethod("test", function(s) {
		var reg = /[0-9]/;
        if(reg.test(s)){
        	return false;
        }else{
            return true;
        }
	});
	
	
	// Validation of the check inpatient form
	$("#checkInPatientU").validate({
		rules: {
			ip_name: {
				required: true,
				test: true
			},
		},
		
		messages: {
			ip_name: {
				required: "Patient Name required",
				test: "Invalid Patent Name"
			},
		},
	});
	
	$.validator.addMethod("test", function(s) {
		var reg = /[0-9]/;
        if(reg.test(s)){
        	return false;
        }else{
            return true;
        }
	});
});
