options
useJson
	"Configure the request for JSON payload and response handling."

	self
		contentType: 'application/json; charset=UTF-8';
		processData: false;
		dataType: 'json'