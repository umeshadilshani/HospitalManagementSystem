// Silva T.U.D


// Validation of the profile picture
$(document).ready(function($) {            
	$("#imageUpload").validate({
		rules: {
			image: {
				required: true, 
				extension: "png|jpe?g|jfif",
				filesize: 2000000
			}
		},
		
		messages: {
			image: {
				required : "Image is not selected",
				extension : "File must be PNG, JPG, JPEG or JFIF",
				filesize: "Maximum file size should be 2MB"
			}
		}
	});
});


// Validation of the update profile form
$(document).ready(function($) {       
	$("#updateProfile").validate({
		rules: {
			id:{
				required: true
			},
			phone: {
				required: true, 
				number: true
			},
			email:{
				required: true,
				chkEmail: true
			},
			username:{
				required: true,
				minlength: 5,
				maxlength: 20
			},
			address:{
				required: true,
				minlength: 5
			}
		},
		
		messages: {
			id:{
				required: "ID required"
			},
			phone: {
				required : "Contact number required",
				number: "Enter a valid number"
			},
			email: {
				required : "Email required",
				chkEmail: "Enter a valid email"
			},
			username: {
				required: "Username required",
				minlength: "Minimum 5 characters required",
				maxlength: "Maximum 20 characters allowed"
			},
			address: {
				required: "Address required",
				minlength: "Enter a valid address",
			},
		}
	});
	
	$.validator.addMethod("chkEmail", function(s) {
   		return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,15}$/i.test(s) 
	});
	
});


// Validation of the add employee form
$(document).ready(function($) {
	$.validator.addMethod("email", function(value, element) {
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,15}$/i.test(value);
            }, "Email Address is invalid: Please enter a valid email address.");
             
            
	$("#addEmployee").validate({
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
			 },
			 
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


// Validation of the check employee form
$(document).ready(function($) {            
	$("#checkEmp").validate({
		rules: {
			id: {
				required: true,
      			number: 3,
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
			 },
			 
		},
		
		messages: {
			id: {
				required: "Please enter employer ID",  
				number: "Enter a valid Employer ID"
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


// Validation of the update employee form
$(document).ready(function($) {             
	$("#updateEmp").validate({
		rules: {
			
			email: {
      			required: true,
      			emailChk: true
   			 },
   			 
   			 address: {
				required: true,
      			minlength: 5,
			 },
   			 
   			 phone:{
				required: true,
      			number: true,
      			minlength: 10,
      			maxlength: 10,
      			pattern: /^[0][0-9]{9}$/
			 },
			 
		},
		
		messages: {
		
    		email: {
      			required: "Please enter your email",
      			emailChk: "Enter a valid email"
   			 },
   			 
   			 address: {
				required: "Please enter your address",  
				minlength: jQuery.validator.format("Atleast {0} characters required!"),
			 },
   			 
   			 phone: {
      			required: "Please enter your contact number",
      			number: "Please enter a valid contact number",
      			minlength: jQuery.validator.format("Atleast {0} characters in the format of 0771111111 required!"),
      			maxlength: jQuery.validator.format("Atmost {0} characters in the format of 0771111111 required!"),
      			pattern: 'Please enter a valid contact number'
   			 },   
		},
	});
	$.validator.addMethod("emailChk", function(s) {
   		return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,15}$/i.test(s) 
	});
});


// Validation of the check employee form
$(document).ready(function($) {            
	$("#checkEmp").validate({
		rules: {
			id: {
				required: true,
      			number: 3,
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
			 },
			 
		},
		
		messages: {
			id: {
				required: "Please enter employer ID",  
				number: "Enter a valid Employer ID"
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
