handling
handleFiltered: aRequestContext
	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			nextPutAll: self pageContent ]