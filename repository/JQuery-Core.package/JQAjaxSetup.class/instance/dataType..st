options
dataType: aString
	"The type of data that you're expecting back from the server. If none is specified, jQuery will intelligently pass either responseXML or responseText to your success callback, based on the MIME type of the response. The available types (and the result passed as the first argument to your success callback) are:
	-	xml: Returns a XML document that can be processed via jQuery.
	-	html: Returns HTML as plain text; included script tags are evaluated when inserted in the DOM.
	-	script: Evaluates the response as JavaScript and returns it as plain text. Disables caching unless option 'cache' is used. Note: This will turn POSTs into GETs for remote-domain requests.
	-	json: Evaluates the response as JSON and returns a JavaScript Object.
	-	jsonp: Loads in a JSON block using JSONP. Will add an extra '?callback=?' to the end of your URL to specify the callback. (Added in jQuery 1.2)
	-	text: A plain text string."
	
	self optionAt: 'dataType' put: aString