content
unableToResumeResponse
	| content |
	content := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | root title: 'Unable to proceed' ];
		render: [ :html |
			html heading level1; with: 'Unable to proceed - hit the back button, and try again'.
			html paragraph: 'Some exceptions cannot be resumed. You will usually see this page if you hit Proceed while debugging one of these exceptions. Your request was aborted but you can retry it by refreshing the page.' ].
	self requestContext respond: [ :response |
		response
			internalError;
			contentType: self application contentType;
			nextPutAll: content ]