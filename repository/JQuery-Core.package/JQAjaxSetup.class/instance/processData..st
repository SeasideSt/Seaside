options
processData: aBoolean
	"By default, data passed in to the data option as an object (technically, anything other than a string) will be processed and transformed into a query string, fitting to the default content-type 'application/x-www-form-urlencoded'. If you want to send a DOMDocument, or other non-processed data, set this option to false."
	
	self optionAt: 'processData' put: aBoolean