attributes
multipart
	"Sets the content type used to submit the form to the server (when the value of method is 'post') to multipart/form-data instead the default application/x-www-form-urlencoded. This should be used in combination with a WAFileUploadTag."
	self attributes 
		at: 'enctype'
		put: 'multipart/form-data'