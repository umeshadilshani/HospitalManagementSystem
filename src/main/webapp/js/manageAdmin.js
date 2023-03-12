// Silva T.U.D


// Validation of the add form
$(document).ready(function($) {
	$.validator.addMethod("email", function(value, element) {
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,15}$/i.test(value);
            }, "Email Address is invalid: Please enter a valid email address.");
             
            
	$("#addForm").validate({
		rules: {
			name: {
				required: true,
      			minlength: 3,
			},
			
			nic: {
				required: true,
				pattern: /^[1-9][0-9]{8}[x|X|v|V]|[1-9][0-9]{11}$/
			},
			
			email: {
      			required: true,
   			 },
   			 
   			 address: {
				required: true,
      			minlength: 5,
			 },
   			 
   			 contact:{
				required: true,
      			number: true,
      			minlength: 10,
      			maxlength: 10,
      			pattern: /^[0][0-9]{9}$/
			 }
		},
		
		messages: {
			name: {
				required: "Please enter your name",  
				minlength: jQuery.validator.format("Atleast {0} characters required!"),
			},                 
                    
			nic: {
      			required: "Please enter your NIC number",
      			pattern: 'Please enter a valid NIC number'
    		},
    		
    		email: {
      			required: "Please enter your email",
   			 },
   			 
   			 address: {
				required: "Please enter your address",  
				minlength: jQuery.validator.format("Atleast {0} characters required!"),
			 },
   			 
   			 contact: {
      			required: "Please enter your contact number",
      			number: "Please enter a valid contact number",
      			minlength: jQuery.validator.format("Atleast {0} characters in the format of 0771111111 required!"),
      			maxlength: jQuery.validator.format("Atmost {0} characters in the format of 0771111111 required!"),
      			pattern: 'Please enter a valid contact number'
   			 },   
		},
	});
});