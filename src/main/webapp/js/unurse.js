// Silva T.U.D

// Validation of the check inpatient form
$(document).ready(function($) {            
	$("#checkInPatientU").validate({
		rules: {
			ip_id: {
				required: true,
				number: true
			},
		},
		
		messages: {
			ip_id: {
				required: "Patient ID required",
				number: "Invalid Patient ID"
			},
		},
	});
	
	
	// Validation of the update inpatient form
	$("#updateInPatient").validate({
		rules: {
			ip_status: {
				required: true,
				test: true
			},
		},
		
		messages: {
			ip_status: {
				required: "Patient Status required",
				test: "Invalid Status..Should be DisCharge"
			},
		},
	});
	
	$.validator.addMethod("test", function(s) {
        if(s === "DisCharge"){
        	return true;
        }else{
            return false;
        }
	});
});