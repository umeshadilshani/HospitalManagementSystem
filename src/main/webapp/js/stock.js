$(document).ready(function($) {            
	$("#AddStock").validate({
		rules: {
			s_name: {
				required: true,
			},
			
			s_quantity: {
				required: true,
				number: true,
			},
			
			s_price: {
				required: true,
				number: true,
			},
		},
		
		messages: {
			s_name: {
				required: "Medicine name required",
			},
			
			s_quantity: {
				required: "Quantity required",
				number: "Invalid quantity"
			},
			
			s_price: {
				required: "Unit price required",
				number: "Invalid price"
			},
		},
	});
	
	
	
	$("#checkMed").validate({
		rules: {
			s_id: {
				required: true,
				number: true,
			},
		},
		
		messages: {
			s_id: {
				required: "ID required",
				number: "Invalid ID"
			},
		},
	});
	
	$("#removeStock").validate({
		rules: {
			s_id: {
				required: true,
				number: true,
			},
		},
		
		messages: {
			s_id: {
				required: "ID required",
				number: "Invalid ID"
			},
		},
	});
	
	$("#updateMed").validate({
		rules: {
			s_quantity: {
				required: true,
				number: true,
			},
			
			s_price: {
				required: true,
				number: true,
			},
		},
		
		messages: {
			s_quantity: {
				required: "Quantity required",
				number: "Invalid quantity"
			},
			
			s_price: {
				required: "Unit price required",
				number: "Invalid price"
			},
		},
	});
});