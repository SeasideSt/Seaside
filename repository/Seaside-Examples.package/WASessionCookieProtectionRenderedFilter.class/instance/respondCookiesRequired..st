processing
respondCookiesRequired: aRequestContext
	| dialog |
	dialog := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | 
			root
				beHtml5;
				title: 'Cookies Required' ];
		render: [ :html | self renderCookiesRequiredStatementOn: html ].
	aRequestContext
		respond: [ :response | 
			response
				forbidden;
				contentType: WAMimeType textHtml;
				nextPutAll: dialog ]