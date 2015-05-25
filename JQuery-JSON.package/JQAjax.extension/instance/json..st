*jquery-json
json: aRenderable
	"Defines a json rendering callback."

	self dataType: 'json'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: WAMimeType applicationJson;
			nextPutAll: (WAJsonCanvas builder render: aRenderable) ]