generation
pageExpired
	self ifResetPossible: [
		self response
			doNotCache;
			contentType: WAMimeType textHtml ].
	self response
		nextPutAll: (WAHtmlCanvas builder
			fullDocument: true;
			rootBlock: [ :root | root title: 'Page Expired' ];
			render: [ :html | 
				html heading: 'Page Expired'.
				html paragraph: 'This page has expired. Please use the back-button to navigate to the last valid page.' ])