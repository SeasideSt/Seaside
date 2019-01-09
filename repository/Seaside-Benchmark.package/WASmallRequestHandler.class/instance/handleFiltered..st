handling
handleFiltered: aRequestContext
	aRequestContext respond: [ :response |
		response
			binary;
			contentType: WAMimeType textHtml;
			nextPutAll: self pageContent ]