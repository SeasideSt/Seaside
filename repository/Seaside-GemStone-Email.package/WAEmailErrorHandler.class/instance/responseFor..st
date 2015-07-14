private
responseFor: anException
	| content |
	content := WARenderer default builder
		fullDocument: true;
		rootBlock: [ :root | root title: 'Internal Error ' ];
		render: [ :html |
			html heading level1; with: anException description.
			html paragraph: 'An internal error has been encountered. The maintainers of the site have been notified.' ].
	self requestContext respond: [ :response |
		response
			internalError;
			nextPutAll: content ]