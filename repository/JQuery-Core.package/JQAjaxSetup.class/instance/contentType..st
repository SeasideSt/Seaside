options
contentType: aString
	"When sending data to the server, use this content-type. Default is 'application/x-www-form-urlencoded', which is fine for most cases. If you explicitly pass in a content-type to $.ajax() then it'll always be sent to the server (even if no data is sent)."
	
	self optionAt: 'contentType' put: aString