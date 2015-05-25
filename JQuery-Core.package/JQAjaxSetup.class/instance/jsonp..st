options
jsonp: aString
	"Override the callback function name in a jsonp request. This value will be used instead of 'callback' in the 'callback=?' part of the query string in the url for a GET or the data for a POST. So {jsonp:'onJsonPLoad'} would result in 'onJsonPLoad=?' passed to the server."
	
	self optionAt: 'jsonp' put: aString