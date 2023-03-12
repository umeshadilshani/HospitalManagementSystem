// Silva T.U.D

// Function related to the login page design
$('.loginBtn').click(function(){
	$('.login').show();
	$('.signUp').hide();
	
	$('.loginBtn').css({'border-bottom' : '2px solid #ff4141'});
	$('.signUpBtn').css({'border-style' : 'none'});
});

$('.signUpBtn').click(function(){
	$('.login').hide();
	$('.signUp').show();
	
	$('.signUpBtn').css({'border-bottom' : '2px solid #ff4141'});
	$('.loginBtn').css({'border-style' : 'none'});
});


// Validation of the signup form
$(document).ready(function($) {            
	$("#signUpValidate").validate({
		rules: {
			txtId: {
				required: true,
				checkId: true
			},
			
			txtUsername: {
				required: true,
				minlength: 5,
				maxlength: 20
			},
			
			txtPassword: {
				required: true,
				pwcheckopt1: true,
				pwcheckopt2:true,
				pwcheckopt3:true,
				pwcheckopt4:true,
				pwcheckopt5:true,
			},
			
			txtConfirmPassword: {
				required: true,
				equalTo: "#password"
			},
		},
		
		messages: {
			txtId: {
				required: "ID required",
				checkId: "Invalid User ID"
			},
			
			txtUsername: {
				required: "Username required",
				minlength: "Minimum 5 characters required",
				maxlength: "Maximum 20 characters allowed"
			},
			
			txtPassword: {
				required: "Password required",
				pwcheckopt1: "Enter valid characters",
				pwcheckopt2: "Must contain a uppercase letter",
				pwcheckopt3: "Must contain a lowercase letter",
				pwcheckopt4: "Must contain a digit",
				pwcheckopt5: "Must contain a special character"
			},
			
			txtConfirmPassword: {
				required: "Confirm Password required",
				equalTo: "Does not match with the password"
			},
		},
	});
	
	
	// Validation of the login form
	$("#loginValidate").validate({
		rules: {
			txtUsername: {
				required: true,
				minlength: 5,
				maxlength: 20
			},
			
			txtPassword: {
				required: true,
				pwcheck: true
			},
		},
		
		messages: {			
			txtUsername: {
				required: "Username required",
				minlength: "Minimum 5 characters required",
				maxlength: "Maximum 20 characters allowed"
			},
			txtPassword: {
				required: "Password required",
				pwcheck: "Please enter a valid password"
			},
		},
	});
		
	$.validator.addMethod("pwcheck", function(s) {
   		return /^[A-Za-z0-9\d=!\-@._*#$%^&]*$/.test(s) // consists of only these
   		&& /[=!\-@._*#$%^&]/.test(s) // has special characters
   		&& /[A-Z]/.test(s) // has a uppercase letter
        && /[a-z]/.test(s) // has a lowercase letter
        && /\d/.test(s) // has a digit
	});
	
	$.validator.addMethod("pwcheckopt1", function(s) {
   		return /^[A-Za-z0-9\d=!\-@._*#$%^&]*$/.test(s) // consists of only these
	});
	
	$.validator.addMethod("pwcheckopt2", function(s) {
   		return  /[A-Z]/.test(s) // has a uppercase letter
	});
	
	$.validator.addMethod("pwcheckopt3", function(s) {
   		return /[a-z]/.test(s) // has a lowercase letter
	});
	
	$.validator.addMethod("pwcheckopt4", function(s) {
   		return /\d/.test(s) // has a digit
	});
	
	$.validator.addMethod("pwcheckopt5", function(s) {
   		return /[=!\-@._*#$%^&]/.test(s) // has special characters
	});
		
	$.validator.addMethod("checkId", function(s) {
   		return /^[0-9]+$/.test(s) // has digits
	});
});