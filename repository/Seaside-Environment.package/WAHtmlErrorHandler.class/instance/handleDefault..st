actions
handleDefault: anException
	self requestContext respond: [ :response |
		response
			internalError;
			contentType: (WAMimeType textHtml
				charset: self requestContext charSet;
				yourself);
			nextPutAll: (self rendererClass builder
				fullDocument: true;
				rootBlock: [ :root | self updateHtmlRoot: root forException: anException ];
				render: [ :html | self renderContentForException: anException on: html ]) ]